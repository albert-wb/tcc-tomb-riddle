collision_list = ds_list_create();
hitbox_list = ds_list_create();

var c = instance_place_list(x, y, obj_inimigo_pai, collision_list, false);

if(c>0){
	for(var i = 0; i <ds_list_size(collision_list);i++){
		var alvo = collision_list[| i];
		if(!ds_list_find_value(hitbox_list, alvo)){
			ds_list_add(hitbox_list, alvo)
			with(alvo){
				life-=5;
			}
		}
	}
}