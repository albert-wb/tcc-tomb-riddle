/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

event_inherited();

move_spd = 0;
move_spd_max = P_MOVE_SPD_MAX;

can_move = 0;

acc = P_ACC;
dcc = P_DCC;

jump_max = 2;
jump_count = jump_max;
jump_height = P_JUMP_FORCE;
coyote_time = 0;
coyote_time_max = P_COYOTE_MAX;

dash = true;
dash_delay = 30;
dash_force = P_DASH_FORCE;
dash_time = 0;
dash_distance = P_DASH_DIST;

attack_count = 0;

damage_dir = 0;
damage_time = 0;
damage_distance = P_DMG_DIST;

estado_morte = false;

previous_move_dir = -1;

state = player_state_free;