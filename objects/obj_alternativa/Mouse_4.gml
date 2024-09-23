if (global.NumQuestion == 1 and _RespCerta == 1){
	
	global.NumQuestion++;
	_RespCerta = 0;
	show_debug_message("Resposta certa 1");
	
	obj_next_room_quis.next_room_activate = true;
	
} else if (global.NumQuestion == 2 and _RespCerta == 2){
	
	global.NumQuestion++;
	_RespCerta = 0;
	show_debug_message("Resposta certa 2");
	
	obj_next_room_quis.next_room_activate = true;
	
} else if (global.NumQuestion == 3 and _RespCerta == 3){
	
	global.NumQuestion++;
	_RespCerta = 0;
	show_debug_message("Resposta certa 3");
	
	obj_next_room_quis.next_room_activate = true;
	
} else {
	
	global.NumQuestion = 1; //reinicia o numero da questao, pra ele voltar pra primeira pergunta.
	//O obj_fade_quis é responsavel por controlar qual sala o jogador cai
	obj_controlador_draw.life_hp-=100;  //mata o jogador
	
}


y = ystart +4;
alarm[0] = 10;

show_debug_message("Questão" + string(global.NumQuestion))