if (instance_exists(obj_player)) {
    x = obj_player.x + (x_offset * obj_player.x_scale); // Atualiza a posição X da hitbox
    y = obj_player.y; // Mantém a mesma posição Y do jogador
}