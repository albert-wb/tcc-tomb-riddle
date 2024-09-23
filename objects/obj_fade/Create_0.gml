/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();

duration = 30;

targetroom = rm_cutscenes;

if(instance_exists(obj_cutscene_controller)) {
	
	if (obj_cutscene_controller.rm_cut == 1){
		targetroom = capitulo_01;
		global.rm_cut_value = 2;
	} else if (obj_cutscene_controller.rm_cut == 2){
		targetroom = capitulo_02;
		global.rm_cut_value = 3;
	} else if (obj_cutscene_controller.rm_cut == 3){ // sala da pergunta 1
		targetroom = capitulo_02_quis;
		global.rm_cut_value = 4; //vai comecar as cutscenes antes de entrar na sala de quis
	} else if (obj_cutscene_controller.rm_cut == 4){ // sala da pergunta 2
		targetroom = capitulo_02_quis_1;
		global.rm_cut_value = 5; //vai comecar as cutscenes antes de entrar na sala de quis
	} else if (obj_cutscene_controller.rm_cut == 5){ // sala da pergunta 3
		targetroom = capitulo_02_quis_2;
		global.rm_cut_value = 6; //vai comecar as cutscenes antes de entrar na sala de quis
	} else if (obj_cutscene_controller.rm_cut == 5){ // capitulo 3
		targetroom = capitulo_03;
		//global.rm_cut_value = 6; //vai comecar as cutscenes antes de entrar na sala de quis
	}
	
}

color = c_black;

timer = 0;
alpha = 0;
state = 0;