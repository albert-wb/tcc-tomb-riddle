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
		//cria a instancia do jogador morrendo
		show_debug_message("room atual:" + string(room));
		instance_destroy(obj_player);
			if (obj_parede_inferior.queda_on == true){ //se estiver no C3 e ativar as paredes
													//significa que ele pegou o olho e vai morrer pra entrar nas cutscenes
				instance_create_layer(0, 0, "Instances", obj_fade); 
			} else {
				instance_create_layer(0, 0, "Instances", obj_fade_dead);
			}
		global.NumQuestion = 1;
    }

    // Restaura a cor de desenho padrão
    draw_set_color(-1);
}

function draw_artefatos(){
	draw_sprite(spr_artefato_1,0,8,8);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_ui);
	draw_text(35,15,string(global.artefato_1));
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
	draw_sprite(spr_artefato_2,0,8,27);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_ui);
	draw_text(35,32,string(global.artefato_2));
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
	draw_sprite(spr_artefato_3,0,8,46);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_ui);
	draw_text(35,52,string(global.artefato_3));
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
	draw_sprite(spr_artefato_4,0,8,67);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_ui);
	draw_text(35,73,string(global.artefato_4));
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

function draw_soma_c1(){
	draw_sprite(spr_soma,0,8,8);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_ui);
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
}