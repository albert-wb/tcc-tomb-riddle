/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();

duration = 30;

targetroom = capitulo_02_quis_1;

if (global.NumQuestion = 1){
	targetroom = capitulo_02;
} else if (global.NumQuestion == 2){
	targetroom = capitulo_02_quis_1;
} else if (global.NumQuestion == 3){
	targetroom = capitulo_02_quis_2;
} else {
	targetroom = capitulo_03;	
}

color = c_black;

timer = 0;
alpha = 0;
state = 0;