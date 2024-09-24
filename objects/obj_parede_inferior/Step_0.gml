vspd += grv; // Aumenta a velocidade vertical pela gravidade
	vspd = clamp(vspd, vspd_min, vspd_max); // Limita a velocidade vertical entre valores mínimo e máximo