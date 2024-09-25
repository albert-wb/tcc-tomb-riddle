estado_alavanca = !estado_alavanca;

if (estado_alavanca == true && _correta = true){//alavanca certa - ativada
	global.soma_next_room++;
} else if ((estado_alavanca == false && _correta = true)){ //alavanca certa - desativada
	global.soma_next_room--;
} else if ((estado_alavanca == true && _correta = false)){ //alavanca errada - ativada
	global.soma_next_room--;
} else if ((estado_alavanca == false && _correta = false)){//alavanca errada - desativada
	global.soma_next_room++;
}

// Verifica se a soma é igual a um dos valores esperados
if (global.soma_next_room == 4) { // Se a soma global for igual a 24
	obj_next_room.next_room_activate = true;
	audio_play_sound(snd_door_opening,0,false, 0.3);
	show_debug_message("Ativou a alavancas corretas, soma: " + string(global.soma_next_room));
	show_debug_message("Pode passar pela porta");
} else if (global.soma_next_room > 4){
	estado_alavanca = false;
	global.soma_next_room = 0;
} else {
	obj_next_room.next_room_activate = false;
	show_debug_message("Ultrapassou a soma de alavancas corretas, soma: " + string(global.soma_next_room));
	show_debug_message("Não pode passar pela porta");
}