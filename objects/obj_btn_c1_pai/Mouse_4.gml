// Evento de clique do botão
global.soma_next_room += soma_c1; // Adiciona o valor de soma_c1 à soma global (global.soma_next_room)
var _proximaFase = instance_create_layer(736, 320, "colisao", obj_next_room); // Cria uma nova instância do objeto obj_next_room na camada "colisao" nas coordenadas (736, 320)

// Verifica se a soma é igual a um dos valores esperados
if (global.soma_next_room == 7) { // Se a soma global for igual a 7
    sprite_index = spr_btn_c1_verde; // Altera o sprite do botão para verde
    soma_c1 = 0; // Reseta a soma do botão para 0
    
} else if (global.soma_next_room == 10) { // Se a soma global for igual a 10
    sprite_index = spr_btn_c1_verde; // Altera o sprite do botão para verde
    soma_c1 = 0; // Reseta a soma do botão para 0
    
    
} else if (global.soma_next_room == 15) { // Se a soma global for igual a 15
    sprite_index = spr_btn_c1_verde; // Altera o sprite do botão para verde
    soma_c1 = 0; // Reseta a soma do botão para 0
   
    
} else if (global.soma_next_room == 24) { // Se a soma global for igual a 24
    sprite_index = spr_btn_c1_verde; // Altera o sprite do botão para verde
    soma_c1 = 0; // Reseta a soma do botão para 0

    with (_proximaFase) { // Acessa a instância criada de obj_next_room
        next_lvl = other.capitulo_num; // Define o próximo nível com base no número do capítulo do objeto pai
    }
    
} else { // Se a soma não corresponder a nenhum dos valores esperados
    // Redefine todos os botões para a sprite amarela
    with (obj_btn_c1_pai) { // Itera sobre todas as instâncias do objeto pai dos botões
        sprite_index = spr_btn_c1_amarelo; // Altera o sprite do botão para amarelo
        soma_c1 = soma_c1_save; // Reseta a soma do botão para o valor salvo
    }
    
    global.soma_next_room = 0; // Reseta a soma global para 0
}