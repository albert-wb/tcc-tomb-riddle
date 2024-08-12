draw_sprite_ext(sprite_index,image_index,x,y,x_scale,y_scale,0,c_white,1);


if (alpha > 0){
gpu_set_fog(true,color,0,0);
draw_sprite_ext(sprite_index,image_index,x,y,x_scale,y_scale,0,c_white,alpha);
gpu_set_fog(false,color,0,0);
}