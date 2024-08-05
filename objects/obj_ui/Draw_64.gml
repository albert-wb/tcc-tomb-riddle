draw_sprite(spr_roma,0,8,6);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_ui);
draw_text(30,15,string(global.roma));
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);