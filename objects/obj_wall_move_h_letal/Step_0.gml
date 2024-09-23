hspd = move_dir * move_spd;

if(place_meeting(x,y,obj_wall)){
	move_dir*=-1;
	hspd = move_dir * move_spd;
}

var c = place_meeting(x+sign(hspd),y,obj_player) or place_meeting(x,y-1,obj_player);

if(c){
	with(obj_player){
		if(!place_meeting(x+other.hspd,y,obj_wall)){
			x+=other.hspd;
		}
	}
}

x+=hspd;