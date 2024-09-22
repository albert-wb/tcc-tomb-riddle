if (global.NumQuestion == 1 and _RespCerta == 1){
	
	global.NumQuestion++;
	_RespCerta = 0;
	
} else if (global.NumQuestion == 2 and _RespCerta == 2){
	
	global.NumQuestion++;
	_RespCerta = 0;
	
} else if (global.NumQuestion == 3 and _RespCerta == 3){
	
	global.NumQuestion++;
	_RespCerta = 0;
	
	obj_next_room.next_room_activate = true;
	
} else {

	obj_controlador_draw.life_hp-=20;
	
}


y = ystart +4;
alarm[0] = 10;

show_debug_message("Questão" + string(global.NumQuestion))