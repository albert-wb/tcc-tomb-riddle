// Movimentação Vertical
repeat(abs(vspd)){ // Itera o número de pixels que a entidade deve se mover verticalmente
    
    // se a queda for permitida a parede se move.
    if(queda_on == false or place_meeting(x, y + sign(vspd), obj_parede_superior)){
        vspd = 0; // Se houver colisão, zera a velocidade vertical
		obj_camera.random = 0;
		audio_play_sound(snd_colisao, 0, false, 1);
        break; // Sai do loop de movimentação vertical
    } else {
        y -= sign(vspd); // Caso contrário, move a entidade na direção da velocidade vertical
    }
}

//place_meeting(x, y + sign(vspd), obj_wall) vou tentar usar esse codigo pra fazer as duas paredes pararem