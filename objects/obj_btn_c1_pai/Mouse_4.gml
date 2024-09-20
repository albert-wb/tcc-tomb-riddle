// Evento de clique do botão
global.soma_next_room += soma_c1; // Adiciona o valor de soma_c1 à soma global (global.soma_next_room)
estado_alavanca = true;

// Verifica se a soma é igual a um dos valores esperados
if (global.soma_next_room == 24) { // Se a soma global for igual a 25
	obj_next_room.next_room_activate = true;
	show_debug_message("Ativou a alavancas corretas: " + string(_correta));
	show_debug_message("Pode passar pela porta");
}