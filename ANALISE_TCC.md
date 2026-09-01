# Análise de Código TCC - Jogo de Plataforma GameMaker

## 1. Mapeamento da Estrutura
- **obj_player / player_states**: Controla a lógica do jogador (movimento, pulo, dash, ataque, dano, estados) e vida.
- **obj_enemy_pai / enemy_states**: Classe pai dos inimigos controlando movimento e recepção de dano.
- **obj_hitbox**: Criado pelo ataque do jogador para detectar dano em inimigos.
- **obj_controlador_draw**: Gerencia a interface, vida (barra de vida) e morte do jogador.
- **obj_wall_move_horizontal / vertical**: Plataformas móveis que interagem com o jogador.
- **draw.gml / player_states.gml / enemy_states.gml**: Scripts contendo funções e lógicas de estado para entidades e desenho de interface.

## 2. Bugs Encontrados e Corrigidos

### [BUG CRÍTICO] - Memory Leak em obj_hitbox (ds_list)
- **Arquivo**: `objects/obj_hitbox/Create_0.gml`
- **Problema**: `collision_list` e `hitbox_list` são criados no Create Event, mas nunca destruídos. A cada ataque do jogador um hitbox é instanciado e destruído (quando a animação acaba). Isso cria vazamento de memória gravíssimo porque ds_lists permanecem na memória até serem destruídas explicitamente ou o jogo fechar.
- **Correção**: Adicionado Evento CleanUp (`objects/obj_hitbox/CleanUp_0.gml`) para checar se a ds_list existe e aplicar `ds_list_destroy()` nela. O arquivo `obj_hitbox.yy` foi editado para registrar o novo evento CleanUp.

### [BUG CRÍTICO] - Crash ao verificar alfa de obj_entities_pai
- **Arquivo**: `scripts/player_states/player_states.gml`
- **Problema**: Ao receber dano, o jogador executava `obj_player.alpha = 1`. Referenciar a constante da classe `obj_player` diretamente ao invés da própria instância pode causar comportamento indefinido ou crashes ao instanciar objetos no Step do GameMaker (se houver mais de um player, ou ao rodar scripts).
- **Correção**: A linha foi substituída por `alpha = 1`, visto que o script já roda no contexto correto.

### [MELHORIA DE CÓDIGO/LEGIBILIDADE] - Magic Numbers Refatorados para Macros
- **Arquivo**: `objects/obj_player/Create_0.gml` e `scripts/macros/macros.gml`
- **Problema**: Valores hardcoded de mecânicas físicas na definição das variáveis (como `dash_force = 8` e `move_spd_max = 3`).
- **Correção**: Criei macros equivalentes no script de macros global do jogo, prefixadas com `P_` e apliquei essas referências de volta ao `Create_0` do `obj_player`, melhorando a semântica sem mudar o design atual do jogo.

### [MELHORIA DE PERFORMANCE / CÓDIGO] - Otimização de colisão com loop e place_meeting (SUGESTÃO)
- **Arquivo**: `objects/obj_player/Step_0.gml` e `obj_enemy_pai/Step_2.gml`
- **Problema**: O `place_meeting` é chamado repetidamente no loop de movimento vertical/horizontal. Como não é um problema massivo e altera um pouco o design da física (movimento sub-pixel) se eu alterar a lógica toda, decidi manter, mas registrar a sugestão para uso de `move_and_collide()` ou checks mais simplificados no futuro.

### [MELHORIA DE CÓDIGO/LEGIBILIDADE] - Sugestões Futuras (Não aplicadas para preservar Game Design)
1. **Hitbox**: Criar e destruir hitbox a cada ataque gera garbage/fragmentação de IDs, pode-se usar apenas uma hitbox desativada e ativá-la quando atacar.
2. **Plataformas móveis (with obj_player)**: A checagem de plataforma móvel manipula diretamente o `x` e `y` do jogador no Step da plataforma. Isso pode causar "stutters" dependendo da ordem dos eventos das instâncias no GameMaker, sendo ideal lidar com o empurrão da plataforma no próprio Step do Jogador.

## 3. Considerações para a Banca
O código está muito bem estruturado e organizado, utilizando Máquinas de Estados Finitos para gerenciar as ações do jogador e inimigos (o que é uma ótima prática). As poucas falhas encontradas estão no gerenciamento manual de estruturas de dados do GameMaker, que não possuem Garbage Collector automático (como ds_list). Com as correções aplicadas o jogo não apresentará vazamentos de memória durante longas sessões.
