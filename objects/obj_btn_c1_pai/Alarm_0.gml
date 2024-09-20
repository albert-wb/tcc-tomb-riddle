//quando o alarme executa as alavancas resetam e a porta da proxima fase é destruída
with (obj_btn_c1_pai) { // Itera sobre todas as instâncias do objeto pai dos botões
        estado_alavanca = false; // Altera o sprite do botão para amarelo
    }

global.soma_next_room = 0; // Reseta a soma global para 0
show_debug_message("Passagem destruída \nSoma resetada \nEstado da alavanca resetado");