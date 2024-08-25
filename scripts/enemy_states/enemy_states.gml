// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function state_walk(){
	sprite_index = spr_enemy_01_run;
	var ground = place_meeting(x,y+1,obj_wall);
	
	if(ground){
		hspd = move_dir * move_spd;
		if(hspd != 0) x_scale = sign(hspd);
	}
	
	if(place_meeting(x+hspd,y,obj_wall)){
		move_dir*=-1;
	}
	
	if(!position_meeting(x+(20*move_dir),y+1, obj_wall)){
		move_dir*=-1;
	}
	
	// Verifica se há colisão com entidades
	var collision_e = instance_place(x + hspd, y, obj_hitbox);
	
	// Se houver colisão
	if(collision_e){
		hspd = 0; // Reseta a velocidade horizontal
		vspd = 0; // Reseta a velocidade vertical
		vspd -= 4; // Aplica uma pequena força para cima
		atk_dir = point_direction(collision_e.x, collision_e.y, x, y); // Calcula a direção do dano
		state = enemy_state_damage; // Muda para o estado de dano
		show_debug_message("Hitbox atingiu o inimigo e causou dano");
	}
	
}

function enemy_state_damage(){
	sprite_index = spr_enemy_01_idle; // Define o sprite de inatividade
	hspd = lengthdir_x(4, atk_dir); // Aplica a velocidade na direção do dano
	
	atk_time = approach(atk_time, atk_distance, 1); // Aumenta o tempo de dano até a distância máxima
	
	// Se o tempo de dano atingir a distância máxima
	if(atk_time >= atk_distance){
		hspd = 0; // Reseta a velocidade horizontal
		atk_time = 0; // Reseta o tempo de dano
		state = state_walk; // Retorna ao estado livre
	}
}