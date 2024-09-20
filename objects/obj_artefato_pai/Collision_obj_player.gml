global.soma_artefato++;

if (global.soma_artefato == 4) { // Se a soma global for igual a 3
   
	instance_deactivate_object(obj_passagem);
	obj_next_room.next_room_activate = true;
	show_debug_message("Coletou todos os artefatos");
    
}

instance_destroy();