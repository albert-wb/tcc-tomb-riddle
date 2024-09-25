// Controlar o fade e a mudança de cutscene
if (rm_cut == 1){ 
	if (is_transitioning) {
	    // Se estamos em transição, controlar o fade
	    if (fade_in) {
	        fade_alpha += 1 / fade_duration; // Aumentar a opacidade
	        if (fade_alpha >= 1) {
	            fade_alpha = 1; // Garantir que a opacidade não ultrapasse 1
	            fade_in = false; // Mudar para fade out
				current_cutscene++; // Avançar para a próxima cutscene
				show_debug_message("avançou para cutscene " + string(current_cutscene));
	        }
	    } else {
	        fade_alpha -= 1 / fade_duration; // Diminuir a opacidade
	        if (fade_alpha <= 0) {
	            fade_alpha = 0; // Garantir que a opacidade não fique negativa
	            is_transitioning = false; // Finalizar a transição
	            if (current_cutscene > 9) { // Mudar para a próxima fase depois da última cutscene
					key_active = false;
					alarm[0] = 60;
	            } else {
	                fade_in = true; // Iniciar o fade in para a próxima cutscene
	            }
	        }
	    }
	} else {
	    // Verifica se o espaço foi pressionado e inicia a transição
	    if (keyboard_check_pressed(vk_space)) {
			if(key_active){
	        is_transitioning = true; // Iniciar a transição
	        fade_alpha = 0; // Começar com a tela totalmente transparente
	        fade_in = true; // Iniciar o fade in
	    } else {
			show_debug_message("Tecla desativada.")
		}
		}
		}
		
} else if (rm_cut == 2){ 
	if (is_transitioning) {
	    // Se estamos em transição, controlar o fade
	    if (fade_in) {
	        fade_alpha += 1 / fade_duration; // Aumentar a opacidade
	        if (fade_alpha >= 1) {
	            fade_alpha = 1; // Garantir que a opacidade não ultrapasse 1
	            fade_in = false; // Mudar para fade out
				current_cutscene++; // Avançar para a próxima cutscene
				show_debug_message("avançou para cutscene " + string(current_cutscene));
	        }
	    } else {
	        fade_alpha -= 1 / fade_duration; // Diminuir a opacidade
	        if (fade_alpha <= 0) {
	            fade_alpha = 0; // Garantir que a opacidade não fique negativa
	            is_transitioning = false; // Finalizar a transição
	            if (current_cutscene > 18) { // Mudar para a próxima fase depois da última cutscene
					key_active = false;
					alarm[0] = 60;
	            } else {
	                fade_in = true; // Iniciar o fade in para a próxima cutscene
	            }
	        }
	    }
	} else {
	    // Verifica se o espaço foi pressionado e inicia a transição
	    if (keyboard_check_pressed(vk_space)) {
			if(key_active){
	        is_transitioning = true; // Iniciar a transição
	        fade_alpha = 0; // Começar com a tela totalmente transparente
	        fade_in = true; // Iniciar o fade in
	    } else {
			show_debug_message("Tecla desativada.")
		}
		}
		}
} else if (rm_cut == 3){ 
	if (is_transitioning) {
	    // Se estamos em transição, controlar o fade
	    if (fade_in) {
	        fade_alpha += 1 / fade_duration; // Aumentar a opacidade
	        if (fade_alpha >= 1) {
	            fade_alpha = 1; // Garantir que a opacidade não ultrapasse 1
	            fade_in = false; // Mudar para fade out
				current_cutscene++; // Avançar para a próxima cutscene
				show_debug_message("avançou para cutscene " + string(current_cutscene));
	        }
	    } else {
	        fade_alpha -= 1 / fade_duration; // Diminuir a opacidade
	        if (fade_alpha <= 0) {
	            fade_alpha = 0; // Garantir que a opacidade não fique negativa
	            is_transitioning = false; // Finalizar a transição
	            if (current_cutscene > 26) { // Mudar para a próxima fase depois da última cutscene
					key_active = false;
					alarm[0] = 60;
	            } else {
	                fade_in = true; // Iniciar o fade in para a próxima cutscene
	            }
	        }
	    }
	} else {
	    // Verifica se o espaço foi pressionado e inicia a transição
	    if (keyboard_check_pressed(vk_space)) {
			if(key_active){
	        is_transitioning = true; // Iniciar a transição
	        fade_alpha = 0; // Começar com a tela totalmente transparente
	        fade_in = true; // Iniciar o fade in
	    } else {
			show_debug_message("Tecla desativada.")
		}
		}
		}
} else if (rm_cut == 5){ 
	if (is_transitioning) {
	    // Se estamos em transição, controlar o fade
	    if (fade_in) {
	        fade_alpha += 1 / fade_duration; // Aumentar a opacidade
	        if (fade_alpha >= 1) {
	            fade_alpha = 1; // Garantir que a opacidade não ultrapasse 1
	            fade_in = false; // Mudar para fade out
				current_cutscene++; // Avançar para a próxima cutscene
				show_debug_message("avançou para cutscene " + string(current_cutscene));
	        }
	    } else {
	        fade_alpha -= 1 / fade_duration; // Diminuir a opacidade
	        if (fade_alpha <= 0) {
	            fade_alpha = 0; // Garantir que a opacidade não fique negativa
	            is_transitioning = false; // Finalizar a transição
	            if (current_cutscene > 34) { // Mudar para a próxima fase depois da última cutscene
					key_active = false;
					alarm[0] = 60;
	            } else {
	                fade_in = true; // Iniciar o fade in para a próxima cutscene
	            }
	        }
	    }
	} else {
	    // Verifica se o espaço foi pressionado e inicia a transição
	    if (keyboard_check_pressed(vk_space)) {
			if(key_active){
	        is_transitioning = true; // Iniciar a transição
	        fade_alpha = 0; // Começar com a tela totalmente transparente
	        fade_in = true; // Iniciar o fade in
	    } else {
			show_debug_message("Tecla desativada.")
		}
		}
		}
} else if (rm_cut == 6){ 
	if (is_transitioning) {
	    // Se estamos em transição, controlar o fade
	    if (fade_in) {
	        fade_alpha += 1 / fade_duration; // Aumentar a opacidade
	        if (fade_alpha >= 1) {
	            fade_alpha = 1; // Garantir que a opacidade não ultrapasse 1
	            fade_in = false; // Mudar para fade out
				current_cutscene++; // Avançar para a próxima cutscene
				show_debug_message("avançou para cutscene " + string(current_cutscene));
	        }
	    } else {
	        fade_alpha -= 1 / fade_duration; // Diminuir a opacidade
	        if (fade_alpha <= 0) {
	            fade_alpha = 0; // Garantir que a opacidade não fique negativa
	            is_transitioning = false; // Finalizar a transição
	            if (current_cutscene > 64) { // Mudar para a próxima fase depois da última cutscene
					key_active = false;
					alarm[0] = 60;
					audio_stop_sound(snd_musica_ambiente);
	            } else {
	                fade_in = true; // Iniciar o fade in para a próxima cutscene
	            }
	        }
	    }
	} else {
	    // Verifica se o espaço foi pressionado e inicia a transição
	    if (keyboard_check_pressed(vk_space)) {
			if(key_active){
	        is_transitioning = true; // Iniciar a transição
	        fade_alpha = 0; // Começar com a tela totalmente transparente
	        fade_in = true; // Iniciar o fade in
	    } else {
			show_debug_message("Tecla desativada.")
		}
		}
		}
}