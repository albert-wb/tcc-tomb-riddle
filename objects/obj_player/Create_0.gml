/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
hspd = 0;
vspd = 0;
vspd_min = -7;
vspd_max = 6;

grv = 0.3;

move_dir = 0;
move_spd = 0;
move_spd_max = 3;

can_move = 0;

acc = 0.3;
dcc = 0.3;

jump_max = 2;
jump_count = jump_max;
jump_height = 6;
coyote_time = 0;
coyote_time_max = 10;

dash = true;
dash_delay = 30;
dash_force = 8;
dash_time = 0;
dash_distance = 10;

x_scale = 1;
y_scale = 1;

state = player_state_free;