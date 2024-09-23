
if (next_room_activate == false){
	image_index--;
	if (image_index <= 0){
		image_index = 0;
	}
} else {
	image_index++;
	if (image_index >= 5){
		image_index = 5;
	}
}