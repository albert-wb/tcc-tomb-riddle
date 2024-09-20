if (estado_m == false){
	image_index--;
	if (image_index <= 0){
		image_index = 0;
	}
} else {
	image_index++;
	if (image_index >= 6){
		image_index = 6;
	}
}