/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if(life <= 0){
	
	var smoke_instance = instance_create_depth(x, y, 0, obj_smoke_puf);
	smoke_instance.alarm[0] = 20;
	instance_destroy();
}

state();
