global.roma++;
if (obj_controlador_draw.life_hp >= 50){
	obj_controlador_draw.life_hp = 50;
	show_debug_message("a vida já está máxima: " + string(obj_controlador_draw.life_hp));
} else {
	obj_controlador_draw.life_hp += 10;
	show_debug_message("vida curada +10 \n total: " + string(obj_controlador_draw.life_hp)); //mostra o valor da vida
}

