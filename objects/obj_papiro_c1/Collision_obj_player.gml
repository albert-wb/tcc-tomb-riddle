if (keyboard_check_pressed(ord("E"))){
	//instance_create_layer(720, 304,"instances",obj_painel); //criar o quadro com as informações do desafio
	obj_controlador_draw.pode_draw_soma_c1 = true;
	instance_destroy();
}