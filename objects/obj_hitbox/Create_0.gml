// Cria uma lista para armazenar as instâncias que colidem com a hitbox
collision_list = ds_list_create();

// Cria uma lista para armazenar as instâncias que já receberam dano
hitbox_list = ds_list_create();

// Verifica se há instâncias do objeto "obj_entities_pai" na posição (x, y) da hitbox
// As instâncias encontradas são adicionadas à "collision_list"
// O último parâmetro "false" indica que a detecção de colisão não deve ser feita com a própria instância
var c = instance_place_list(x, y, obj_entities_pai, collision_list, false);

// Se houver colisões (c > 0)
if(c > 0){
    // Percorre cada instância na "collision_list"
    for(var i = 0; i < ds_list_size(collision_list); i++){
        // Obtém a instância atual da lista
        var _alvo = collision_list[| i];
        
        // Verifica se o "alvo" já está na "hitbox_list"
        // Se não estiver, significa que ainda não recebeu dano nesta interação
        if(!ds_list_find_value(hitbox_list, _alvo)){
            // Adiciona o "alvo" à "hitbox_list" para evitar que receba dano novamente
            ds_list_add(hitbox_list, _alvo);
            
            // Aplica o dano ao "alvo"
            // Dentro deste bloco, você pode acessar diretamente as variáveis do "alvo"
            with(_alvo){
                life -= 5;
				show_debug_message("5 de dano ao inimigo");
				show_debug_message("Enemy hit flash - ativado");
            }
        }
    }
}

x_offset = 25; // Distância horizontal em relação ao jogador