// Variável para controlar a velocidade da animação
var frame_speed = 5; // Ajuste esse valor para aumentar ou diminuir a velocidade
var frame_counter = 0; // Contador para controlar os frames

// step
if (estado_bau = false) {  
        image_index--;
    if (image_index <= 0) {
        image_index = 0;
    }
} else {
    frame_counter++;
    if (frame_counter >= frame_speed) {
        image_index++;
        frame_counter = 0; // Reseta o contador após mudar o frame
    }
    if (image_index >= 5) {
        image_index = 5;
		global.key_c03 = false;
    }
}