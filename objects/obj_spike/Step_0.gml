var collision_s = instance_place(x + hspd_s, y, colisor);
	
	// Se houver colisão
	if(collision_s){ 
		obj_player.hspd = 0; // Reseta a velocidade horizontal
		obj_player.vspd = 0; // Reseta a velocidade vertical
		obj_player.vspd -= 4; // Aplica uma pequena força para baixo
		obj_player.damage_dir = point_direction(collision_s.x, collision_s.y, x, y); // Calcula a direção do dano
		obj_player.state = player_state_damage; // Muda para o estado de dano
	}