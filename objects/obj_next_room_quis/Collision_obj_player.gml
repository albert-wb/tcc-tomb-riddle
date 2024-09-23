if (next_room_activate == true){
	instance_create_layer(0, 0, "Instances", obj_fade_quis);
	instance_deactivate_object(obj_player);
} 

//if(obj_fade.alpha == 1){
	//room_goto(rm_cutscenes);
//}