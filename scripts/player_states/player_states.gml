function player_state_free(){
	// Verifica se as teclas de movimento são pressionadas
	var key_left = keyboard_check(ord("A")); // Tecla esquerda
	var key_right = keyboard_check(ord("D")); // Tecla direita
	var key_up = keyboard_check_pressed(vk_space); // Tecla de pulo
	var key_dash = keyboard_check_pressed(ord("Z")); // Tecla de dash

	// Calcula se há movimento horizontal
	var move = key_right - key_left != 0; // Verifica se o jogador está se movendo para a esquerda ou direita

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
	
	// Verifica se o botão esquerdo do mouse está pressionado
	if (mouse_check_button(mb_left)){
		attack_count += 1; // Incrementa o contador de ataques
		show_debug_message(attack_count); // Exibe o contador de ataques no console de depuração
		// Ajusta a escala do sprite com base na posição do mouse
		if(mouse_x < x) x_scale = -1; else x_scale = 1; // Inverte a escala se o mouse está à esquerda
		image_index = 0; // Reseta o índice da imagem do sprite
		state = player_state_atk; // Muda para o estado de ataque
	}
	
	// Verifica se há colisão com entidades
	var collision_e = instance_place(x + hspd, y, obj_entities_pai);
	
	// Se houver colisão
	if(collision_e){
		hspd = 0; // Reseta a velocidade horizontal
		vspd = 0; // Reseta a velocidade vertical
		vspd -= 4; // Aplica uma pequena força para baixo
		damage_dir = point_direction(collision_e.x, collision_e.y, x, y); // Calcula a direção do dano
		state = player_state_damage; // Muda para o estado de dano
	}
}

function player_state_damage(){
	sprite_index = spr_player_idle; // Define o sprite de inatividade
	hspd = lengthdir_x(4, damage_dir); // Aplica a velocidade na direção do dano
	
	damage_time = approach(damage_time, damage_distance, 1); // Aumenta o tempo de dano até a distância máxima
	
	// Se o tempo de dano atingir a distância máxima
	if(damage_time >= damage_distance){
		hspd = 0; // Reseta a velocidade horizontal
		damage_time = 0; // Reseta o tempo de dano
		state = player_state_free; // Retorna ao estado livre
	}
}

function player_state_dash(){
	// Estado de dash
	hspd = lengthdir_x(dash_force, move_dir); // Aplica a força do dash na direção do movimento
	dash_time = approach(dash_time, dash_distance, 1); // Aumenta o tempo de dash até a distância máxima
	// Se o tempo de dash atingir a distância máxima
	if(dash_time >= dash_distance){
		state = player_state_free; // Retorna ao estado livre após completar o dash
	}
}

function player_state_atk(){
	// Verifica se o índice da imagem do ataque está acima de 3
	if(image_index > 3){
		if(!instance_exists(obj_hitbox)){
			// Cria a hitbox de ataque se não existir
			instance_create_layer(x + (25 * x_scale), y, layer, obj_hitbox);
		}
	}
	
	// Estado de ataque
	if(attack_count == 1){
		sprite_index = spr_player_attack_1; // Define o sprite para o primeiro ataque
	} else if (attack_count == 2){
		sprite_index = spr_player_attack_2; // Define o sprite para o segundo ataque
	} else if (attack_count == 3){
		sprite_index = spr_player_attack_3; // Define o sprite para o terceiro ataque
	} else {
		attack_count = 1; // Reseta o contador de ataques
	}

	hspd = 0; // Reseta a velocidade horizontal
	vspd += 0.2; // Aplica uma pequena gravidade para queda após o ataque
	
	// Se o índice da imagem do ataque atingir o número máximo de imagens
	if(image_index >= image_number - 1){
		// Sai do estado de ataque
		state = player_state_free; // Retorna ao estado livre
		if(instance_exists(obj_hitbox)){
			instance_destroy(obj_hitbox); // Destrói a hitbox de ataque
		}
	}
}