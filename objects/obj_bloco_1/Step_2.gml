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