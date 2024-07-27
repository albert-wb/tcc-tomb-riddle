function player_state_free(){
	// Verifica se as teclas de movimento são pressionadas
	var key_left = keyboard_check(vk_left);
	var key_right = keyboard_check(vk_right);
	var key_up = keyboard_check_pressed(vk_up);

	// Calcula se há movimento horizontal
	var move = key_right - key_left != 0;

	// Aplica a gravidade ao jogador
	vspd += grv;
	vspd = clamp(vspd, vspd_min, vspd_max);

	// Se houver movimento horizontal
	if(move){
		// Define o sprite de caminhada
		sprite_index = spr_player_walking;
		// Define a direção do movimento
		move_dir = point_direction(0, 0, key_right - key_left, 0);
		// Aumenta a velocidade de movimento até o máximo, usando aceleração
		move_spd = approach(move_spd, move_spd_max, acc);
	}else{
		// Define o sprite de inatividade
		sprite_index = spr_player_idle;
		// Reduz a velocidade de movimento até zero, usando desaceleração
		move_spd = approach(move_spd, 0, dcc);
	}

	// Se o jogador pode se mover, calcula a velocidade horizontal
	if(can_move <= 0) hspd = lengthdir_x(move_spd, move_dir);

	// Define a escala do sprite baseado na direção do movimento
	if(hspd != 0){
		x_scale = sign(hspd);	
	}
	
	// Reduz a habilidade de movimento ao longo do tempo
	can_move = approach(can_move, 0, .4);
	
	// Verifica se o jogador está no chão ou próximo a uma parede
	var ground = place_meeting(x, y + 1, obj_wall);
	var wall = place_meeting(x + 1, y, obj_wall) || place_meeting(x - 1, y, obj_wall);

	// Se o jogador está no chão
	if(ground){
		// Reseta o tempo de coyote (permite pulo após deixar o chão por um curto período)
		coyote_time = coyote_time_max;
	}else{
		// Reduz o tempo de coyote se no ar
		coyote_time--;
		// Define o sprite de pulo ou queda
		if (vspd < 0){
			sprite_index = spr_player_jump; // Sprite pulando
		} else {
			sprite_index = spr_player_fall; // Sprite caindo
		}
	}

	// Se a tecla de pulo é pressionada e o tempo de coyote é positivo
	if(key_up and coyote_time > 0){
		// Reseta o tempo de coyote
		coyote_time = 0;
		// Reseta e aplica a velocidade de pulo
		vspd = 0;
		vspd -= jump_height;
	}
	
	// Se o jogador está colidindo com uma parede e não está no chão
	if(wall and !ground){
		if(vspd > 1){
			// Define a velocidade vertical ao deslizar na parede
			vspd = 1;
		}
		// Se a tecla de pulo é pressionada enquanto na parede
		if(key_up){
			// Reseta o tempo de coyote e aplica a velocidade de pulo na parede
			coyote_time = 0;
			vspd = 0;
			vspd -= jump_height;
			// Temporariamente impede movimento horizontal e aplica força horizontal para o lado oposto
			can_move = 5;
			hspd -= 4 * x_scale;
		}
	}
}
