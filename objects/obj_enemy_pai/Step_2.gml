// Evento Step

// Movimentação Horizontal
repeat(abs(hspd)){ // Itera o número de pixels que a entidade deve se mover horizontalmente
    
    // Verifica se haverá uma colisão ao mover a entidade na direção da velocidade horizontal
    if(place_meeting(x + sign(hspd), y, obj_wall)){
        
        // Se não houver colisão 1 pixel acima, move a entidade 1 pixel para cima
        if(!place_meeting(x + sign(hspd), y - 1, obj_wall)){
            y--;
        } else {
            // Caso contrário, verifica se pode mover 1 pixel para baixo
            if(!place_meeting(x + sign(hspd), y + 1, obj_wall)){
                // Se ainda não houver colisão, verifica se pode mover 2 pixels para baixo
                if(!place_meeting(x + sign(hspd), y + 2, obj_wall)){
                    y++; // Move a entidade 1 pixel para baixo
                }
            }
        }
    }
    
    // Verifica novamente se haverá colisão após os ajustes verticais
    if(place_meeting(x + sign(hspd), y, obj_wall)){
        hspd = 0; // Se houver colisão, zera a velocidade horizontal
        // sprite_index = spr_player_idle; // Muda para o sprite de "parado" ao colidir
        break; // Sai do loop de movimentação horizontal
    } else {
        x += sign(hspd); // Caso contrário, move a entidade na direção da velocidade horizontal
    }
}

// Movimentação Vertical
repeat(abs(vspd)){ // Itera o número de pixels que a entidade deve se mover verticalmente
    
    // Verifica se haverá uma colisão ao mover a entidade na direção da velocidade vertical
    if(place_meeting(x, y + sign(vspd), obj_wall)){
        vspd = 0; // Se houver colisão, zera a velocidade vertical
        break; // Sai do loop de movimentação vertical
    } else {
        y += sign(vspd); // Caso contrário, move a entidade na direção da velocidade vertical
    }
}