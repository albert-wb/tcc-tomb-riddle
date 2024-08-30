global.soma_artefato++;

if (global.soma_artefato == 3) { // Se a soma global for igual a 3
   
	instance_deactivate_object(obj_passagem);
	show_debug_message("Coletou todos os artefatos");
    
}

instance_destroy();