// Configurações da câmera para exibição
view_w = camera_get_view_width(view_camera[0]); // Obtém a largura da visão da câmera
view_h = camera_get_view_height(view_camera[0]); // Obtém a altura da visão da câmera
display_set_gui_size(view_w, view_h); // Define o tamanho da interface gráfica (GUI) com base nas dimensões da câmera

// Configurações da barra de vida
life_max = 50; // Define a vida máxima do jogador
life_hp = life_max; // Inicializa a vida atual do jogador com a vida máxima
life_feedback = life_max; // Inicializa o feedback de vida com a vida máxima
lifebar_w = 100; // Define a largura da barra de vida
lifebar_h = 10; // Define a altura da barra de vida

// Cores utilizadas na barra de vida
color_1 = make_color_rgb(255, 0, 64); // Cor da barra de vida (vermelho)
color_2 = make_color_rgb(19, 19, 19); // Cor do fundo da barra de vida (preto)
color_3 = make_color_rgb(19, 19, 19); // Cor da borda da barra de vida (preto)
color_4 = c_white; // Cor do feedback (branco)

draw_vida = draw_lifebar;

pode_draw_artefatos = false;