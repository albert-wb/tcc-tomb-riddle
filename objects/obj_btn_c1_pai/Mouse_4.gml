// Evento de clique do botão

click_alavanca++;

if (click_alavanca % 2 == 0){
	 // A variável é par
	 estado_alavanca = true;
	 global.soma_next_room += soma_c1;
	 show_debug_message("// A variável é par");
} else {
	// A variável é impar
	estado_alavanca = false;
	global.soma_next_room-=soma_c1;
	show_debug_message("// A variável é impar");
}

// Verifica se a soma é igual a um dos valores esperados
if (global.soma_next_room == 24) { // Se a soma global for igual a 25
	obj_next_room.next_room_activate = true;
	show_debug_message("Ativou a alavancas corretas, soma: " + string(global.soma_next_room));
	show_debug_message("Pode passar pela porta");
} else {
	obj_next_room.next_room_activate = false;
	show_debug_message("Ultrapassou a soma de alavancas corretas, soma: " + string(global.soma_next_room));
	show_debug_message("Não pode passar pela porta");
}