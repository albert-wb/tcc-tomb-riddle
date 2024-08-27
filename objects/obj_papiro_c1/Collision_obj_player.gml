if (keyboard_check_pressed(ord("E"))){
	instance_create_layer(720, 304,"instances",obj_painel); //criar o quadro com as informações do desafio
	instance_destroy();
}