
function player_state_free(){
	var key_left = keyboard_check(vk_left);
	var key_right = keyboard_check(vk_right);
	var key_up = keyboard_check_pressed(vk_up);

	var move = key_right - key_left != 0;

	vspd+= grv;
	vspd = clamp(vspd,vspd_min,vspd_max);

	if(move){
		sprite_index = spr_player_walking;
		move_dir = point_direction(0,0,key_right - key_left, 0);
		move_spd = approach(move_spd, move_spd_max,acc);
	}else{
		sprite_index = spr_player_idle;
		move_spd = approach(move_spd,0,dcc);
	}

	if(can_move <= 0) hspd = lengthdir_x(move_spd,move_dir);

	if(hspd != 0){
		x_scale = sign(hspd);	
	}
	
	can_move = approach(can_move,0,.4);
	
	var ground = place_meeting(x,y+1,obj_wall);
	var wall = place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall);

	if(ground){
		coyote_time = coyote_time_max;
	}else{
		coyote_time--;
		if (vspd < 0){
			sprite_index = spr_player_jump; //sprite pulando
		} else {
			sprite_index = spr_player_fall; //sprite caindo
		}
	}

	if(key_up and coyote_time > 0){
		coyote_time = 0;
		vspd = 0;
		vspd-=jump_height;
	}
	
	if(wall and !ground){
		if(vspd > 1){
			//sprite_index = spr_player_wall; - quando ele estiver deslizando na parede
			vspd = 1;
		}
		if(key_up){
			coyote_time = 0;
			vspd = 0;
			vspd-=jump_height;
			can_move = 5;
			hspd-=4 * x_scale;
		}
	}
}