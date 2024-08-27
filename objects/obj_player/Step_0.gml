event_inherited();

global.coord_jogador_x = x;
global.coord_jogador_y = y;

state();

alpha = approach(alpha,0,0.05);

//empurrando blocos

var push_list = ds_list_create();
var is_block_h = instance_place_list(x+hspd,y,obj_bloco,push_list,false);

if (is_block_h){
	if(ds_list_size(push_list)>0){
		for(var i = 0; i < ds_list_size(push_list);i++){ //percorrendo a lista
			var block = push_list[| i];
			with(block){ //dentro do obj_bloco
				if(!place_meeting(x+other.hspd,y,obj_wall)){
					other.sprite_index = spr_player_jump; // sprite dele empurrando
					x+=other.hspd/3;
				}
			}
		}
	}
}

ds_list_destroy(push_list);