// Desenhar a cutscene
draw_sprite(asset_get_index("sobre_0" + string(current_cutscene)), 0, x, y);

// Aplicar o efeito de fade
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1); // Resetar a opacidade para desenhar o sprite