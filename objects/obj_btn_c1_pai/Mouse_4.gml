// Evento de clique do botão
global.soma_next_room += soma_c1; // Adiciona o valor de soma_c1 à soma global (global.soma_next_room)
estado_alavanca = true;

// Verifica se a soma é igual a um dos valores esperados
if (global.soma_next_room == 24) { // Se a soma global for igual a 25
   
	var _proximaFase = instance_create_layer(3184, 256, "colisao", obj_next_room); // Cria uma nova instância do objeto obj_next_room na camada "colisao" nas coordenadas (736, 320)
    with (_proximaFase) { // Acessa a instância criada de obj_next_room
        next_lvl = other.capitulo_num; // Define o próximo nível com base no número do capítulo do objeto pai
		//não é necessário pois o próprio objeto já tem como definição o capitulo 2
		//como nova fase.
    }
	show_debug_message("Ativou a alavancas corretas: " + string(_correta));
    
}