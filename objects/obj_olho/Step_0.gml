// Step
vspd += grv; // Aumenta a velocidade vertical pela gravidade
vspd = clamp(vspd, vspd_min, vspd_max); // Limita a velocidade vertical

// Verificação de colisão com o chão
if (place_meeting(x, y+1, obj_wall)) {
    // Se colidir com o chão
    vspd = 0; // Reseta a velocidade vertical
}

// Move o objeto
y += vspd; // Aplica o movimento vertical