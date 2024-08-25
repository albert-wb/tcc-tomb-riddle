//condições para alterar o sprite do mouse
if (estado_alavanca == false){
	image_index--;
	if (image_index <= 0){
		image_index = 0;
	}
} else {
	image_index++;
	if (image_index >= 4){
		image_index = 4;
	}
}