/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();

duration = 30;
if (instance_exists(obj_next_room)){
	targetroom = obj_next_room.next_lvl;
} else if(instance_exists(obj_cutscene_controller)) {
	targetroom = capitulo_01;
} else {
	targetroom = rm_cutscenes;
}

color = c_black;

timer = 0;
alpha = 0;
state = 0;