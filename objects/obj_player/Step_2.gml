repeat(abs(hspd)){
	
	if(place_meeting(x+sign(hspd),y,obj_wall)){
		if(!place_meeting(x+sign(hspd),y-1,obj_wall)){
			y--;
		}else{
			if(!place_meeting(x+sign(hspd),y+1,obj_wall)){
				if(!place_meeting(x+sign(hspd),y+2,obj_wall)){
					y++;
				}
			}
		}
	}
	
	
	if(place_meeting(x+sign(hspd),y,obj_wall)){
		hspd = 0;
		//sprite_index = spr_player_idle; - colidir com a parede, muda pra sprite parado
		break;
	} else {
		x += sign(hspd);
	}
}

repeat(abs(vspd)){
	if(place_meeting(x,y+sign(vspd),obj_wall)){
		vspd = 0;
		break;
	} else {
		y += sign(vspd);
	}
}