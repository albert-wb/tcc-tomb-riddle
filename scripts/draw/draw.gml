// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description Função para desenhar a barra de vida

function draw_lifebar() {
    // Calcula a largura da barra de vida com base na vida atual do jogador
    var amount = (life_hp / life_max) * lifebar_w; // Largura da barra de vida atual
    var amount_fixed = (life_max / life_max) * lifebar_w; // Largura da barra de vida máxima (para o fundo)
    var amount_feedback = (life_feedback / life_max) * lifebar_w; // Largura da barra de feedback
    var x1 = 30; // Posição X inicial da barra de vida
    var y1 = 330; // Posição Y inicial da barra de vida
    var x2 = x1 + amount; // Posição X final da barra de vida atual
    var x2_fixed = x1 + amount_fixed; // Posição X final da barra de vida máxima
    var x2_feedback = x1 + amount_feedback; // Posição X final da barra de feedback
    var y2 = y1 + lifebar_h; // Posição Y final da barra de vida

    // Verifica se o jogador ainda tem vida
    if (life_hp > 0) {
        // Desenha o fundo da barra de vida
        draw_set_color(color_2); // Define a cor do fundo
        draw_rectangle(x1, y1, x2_fixed, y2, false); // Desenha o retângulo do fundo

        // Desenha a barra de feedback
        draw_set_color(color_4); // Define a cor do feedback
        draw_rectangle(x1, y1, x2_feedback, y2, false); // Desenha o retângulo do feedback

        // Desenha a barra de vida atual
        draw_set_color(color_1); // Define a cor da barra de vida
        draw_rectangle(x1, y1, x2, y2, false); // Desenha o retângulo da vida atual

        // Desenha a borda (outline) da barra de vida
        draw_set_color(color_3); // Define a cor da borda
        draw_rectangle(x1, y1, x2_fixed, y2, true); // Desenha o retângulo da borda
    } else {
        // Se a vida do jogador for menor ou igual a zero, destrói a instância do jogador
        instance_destroy(obj_player);
    }

    // Restaura a cor de desenho padrão
    draw_set_color(-1);
}

function draw_interface(){
	draw_sprite(spr_roma,0,8,6);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_ui);
	draw_text(30,15,string(global.roma));
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
}

function draw_fade(){
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_rectangle(0,0,width,height,0);
	draw_set_alpha(1);
	draw_set_color(c_black);
}