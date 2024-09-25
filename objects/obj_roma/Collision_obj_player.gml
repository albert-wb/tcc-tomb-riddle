audio_play_sound(snd_collect_roma, 0, false, 0.1);

var instance_smoke_jump = instance_create_depth(x,y, 0, obj_collected);
instance_smoke_jump.alarm[0] = 15;

instance_destroy();