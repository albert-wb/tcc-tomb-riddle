/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

move_spd = 0;
move_spd_max = 3;

can_move = 0;

acc = 0.3;
dcc = 0.3;

jump_max = 2;
jump_count = jump_max;
jump_height = 4.5;
coyote_time = 0;
coyote_time_max = 10;

dash = true;
dash_delay = 30;
dash_force = 8;
dash_time = 0;
dash_distance = 10;

attack_count = 0;

damage_dir = 0;
damage_time = 0;
damage_distance = 10;

estado_morte = false;

previous_move_dir = -1;

state = player_state_free;