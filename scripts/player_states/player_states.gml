function player_state_free(){
	// Verifica se as teclas de movimento são pressionadas
	var key_left = keyboard_check(ord("A")); // Tecla esquerda
	var key_right = keyboard_check(ord("D")); // Tecla direita
	var key_up = keyboard_check_pressed(vk_space) || keyboard_check(ord("W")); // Tecla de pulo
	var key_dash = keyboard_check_pressed(ord("Z")); // Tecla de dash

	// Calcula se há movimento horizontal
	var move = key_right - key_left != 0; // Verifica se o jogador está se movendo para a esquerda ou direita

	// Aplica a gravidade ao jogador
	vspd += grv; // Aumenta a velocidade vertical pela gravidade
	vspd = clamp(vspd, vspd_min, vspd_max); // Limita a velocidade vertical entre valores mínimo e máximo

	// Se houver movimento horizontal
	if(move){
		// Define o sprite de caminhada
		sprite_index = spr_player_walking; // Sprite de movimento
		// Define a direção do movimento
		move_dir = point_direction(0, 0, key_right - key_left, 0); // Calcula a direção do movimento
		// Aumenta a velocidade de movimento até o máximo, usando aceleração
		move_spd = approach(move_spd, move_spd_max, acc); // Acelera o movimento
	}else{
		// Define o sprite de inatividade
		sprite_index = spr_player_idle; // Sprite parado
		// Reduz a velocidade de movimento até zero, usando desaceleração
		move_spd = approach(move_spd, 0, dcc); // Desacelera o movimento
	}

	// Se o jogador pode se mover, calcula a velocidade horizontal
	if(can_move <= 0) hspd = lengthdir_x(move_spd, move_dir); // Aplica a velocidade horizontal

	// Define a escala do sprite baseado na direção do movimento
	if(hspd != 0){
		x_scale = sign(hspd); // Ajusta a escala do sprite para a direção do movimento
	}
	
	// Reduz a habilidade de movimento ao longo do tempo
	can_move = approach(can_move, 0, .4); // Diminui a capacidade de movimento

	// Verifica se o jogador está no chão ou próximo a uma parede
	var ground = place_meeting(x, y + 1, obj_wall); // Verifica colisão com o chão
	var wall = place_meeting(x + 1, y, obj_wall) || place_meeting(x - 1, y, obj_wall); // Verifica colisão com paredes

	// Se o jogador está no chão
	if(ground){
		jump_count = jump_max; // Reseta o contador de pulos
		// Reseta o tempo de coyote (permite pulo após deixar o chão por um curto período)
		coyote_time = coyote_time_max; // Reseta o tempo de coyote
	}else{
		// Reduz o tempo de coyote se no ar
		coyote_time--; // Diminui o tempo de coyote
		// Define o sprite de pulo ou queda
		if (vspd < 0){
			sprite_index = spr_player_jump; // Sprite pulando
		} else {
			sprite_index = spr_player_fall; // Sprite caindo
		}
	}

	// Se a tecla de pulo é pressionada e o tempo de coyote é positivo
	if(key_up and coyote_time > 0 || key_up and jump_count > 0){
		jump_count--; // Diminui o contador de pulos
		// Reseta o tempo de coyote
		coyote_time = 0; // Reseta o tempo de coyote
		// Reseta e aplica a velocidade de pulo
		vspd = 0; // Reseta a velocidade vertical
		vspd -= jump_height; // Aplica a força do pulo
	}
	
	// Se o jogador está colidindo com uma parede e não está no chão
	if(wall and !ground){
		if(vspd > 1){
			sprite_index = spr_player_slide_vertical; // Sprite deslizando na parede
			jump_count = jump_max; // Reseta o contador de pulos
			// Define a velocidade vertical ao deslizar na parede
			vspd = 1; // Mantém uma velocidade vertical mínima
		}
		// Se a tecla de pulo é pressionada enquanto na parede
		if(key_up){
			// Reseta o tempo de coyote e aplica a velocidade de pulo na parede
			coyote_time = 0; // Reseta o tempo de coyote
			vspd = 0; // Reseta a velocidade vertical
			vspd -= jump_height; // Aplica a força do pulo
			// Temporariamente impede movimento horizontal e aplica força horizontal para o lado oposto
			can_move = 5; // Define um tempo de bloqueio para movimento
			hspd -= 4 * x_scale; // Aplica força horizontal oposta
			if (hspd < 0){
				move_dir = 180; // Define a direção para a esquerda
			}else if (hspd > 0){
				move_dir = 0; // Define a direção para a direita
			}
		}
	}
	
	// Se a tecla de dash é pressionada
	if(key_dash and dash){
		hspd = 0; // Reseta a velocidade horizontal
		vspd = 0; // Reseta a velocidade vertical
		dash_time = 0; // Reseta o tempo de dash
		dash = false; // Desativa o estado de dash
		alarm[0] = dash_delay; // Define um alarme para o delay do dash
		sprite_index = spr_player_dash; // Define o sprite de dash
		state = player_state_dash; // Muda para o estado de dash
	}
}

function player_state_dash(){
	// Estado de dash
	hspd = lengthdir_x(dash_force, move_dir); // Aplica a força do dash na direção do movimento
	dash_time = approach(dash_time, dash_distance, 1); // Aumenta o tempo de dash até a distância máxima
	if(dash_time >= dash_distance){
		state = player_state_free; // Retorna ao estado livre após completar o dash
	}
}