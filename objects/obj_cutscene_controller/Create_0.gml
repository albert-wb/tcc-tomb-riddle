
fade_duration = 30; // Duração do fade em frames
fade_alpha = 0; // Opacidade inicial
fade_in = true; // Controla se está fazendo fade in ou out
is_transitioning = false; // Para controlar se estamos em uma transição

key_active = true; // Desativa a tecla

rm_cut = global.rm_cut_value;

if (rm_cut == 1){
	current_cutscene = 1; // Começa com a primeira cutscene
} else if (rm_cut == 2){
	current_cutscene = 8;
}