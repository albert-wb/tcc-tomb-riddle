if (global.soma_next_room >= 25){ // Se a soma não corresponde
	// Redefine as alavancas para cima
    with (obj_btn_c1_pai) { // Itera sobre todas as instâncias do objeto pai dos botões
        estado_alavanca = false; // Altera o sprite do botão cima
    }
	global.soma_next_room = 0; // Reseta a soma global para 0
	show_debug_message("Passagem destruída \nSoma resetada \nEstado da alavanca resetado");
	
}