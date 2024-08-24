// Evento de clique do botão
global.soma_next_room += soma_c1;
var _proximaFase = instance_create_layer(736, 320, "colisao", obj_next_room);

// Verifica se a soma é igual a um dos valores esperados
if (global.soma_next_room == 7) {
    sprite_index = spr_btn_c1_verde;
    soma_c1 = 0;
    show_message("Botão do 7, soma: " + string(global.soma_next_room));
    
} else if (global.soma_next_room == 10) {
    sprite_index = spr_btn_c1_verde;
    soma_c1 = 0;
    show_message("Botão do 3, soma: " + string(global.soma_next_room));
    
} else if (global.soma_next_room == 15) {
    sprite_index = spr_btn_c1_verde;
    soma_c1 = 0;
    show_message("Botão do 5, soma: " + string(global.soma_next_room));
    
} else if (global.soma_next_room == 24) {
    sprite_index = spr_btn_c1_verde;
    soma_c1 = 0;
    show_message("Botão do 9, soma: " + string(global.soma_next_room));

    with (_proximaFase) {
        next_lvl = other.capitulo_num;
    }
    
} else {
    // Se a soma não corresponder a nenhum valor esperado, redefine todos os botões para a sprite amarela
    with (obj_btn_c1_pai) { // Substitua 'obj_btn_c1_pai' pelo nome do seu objeto pai se necessário
        sprite_index = spr_btn_c1_amarelo;
        soma_c1 = soma_c1_save; // Reseta a soma do botão
    }
    
    global.soma_next_room = 0; // Reseta a soma global
}