/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();

duration = 30;

targetroom = rm_sobre;

if(instance_exists(obj_controller_sobre)) {
	targetroom = rm_menu;
}

color = c_black;

timer = 0;
alpha = 0;
state = 0;