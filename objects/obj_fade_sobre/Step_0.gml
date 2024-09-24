/// @description Insert description here
// You can write your code in this editor
if (state == 0){
	timer += 0.5;
	if(timer >= duration){
		room_goto(targetroom)
		state = 1;
	}
} else {
	if(state == 1){
		timer -=0.5;
		if (timer <= 0){
			instance_destroy();
		}
	}
}

alpha = timer/duration;
depth = -100;