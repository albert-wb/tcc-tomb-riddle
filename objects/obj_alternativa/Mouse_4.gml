if (global.NumQuestion == 1 and _RespCerta == 1){
	
	global.NumQuestion++;
	obj_question.question_text = "Pergunta 2";
	_RespCerta = 0;
	
} else if (global.NumQuestion == 2 and _RespCerta == 2){
	
	global.NumQuestion++;
	obj_question.question_text = "Pergunta 3";
	_RespCerta = 0;
	
} else if (global.NumQuestion == 3 and _RespCerta == 3){
	
	global.NumQuestion++;
	obj_question.question_text = "Passagem aberta";
	_RespCerta = 0;
	
	//criar instancia da next_room quando tiver as perguntas prontas
	
} else {

	obj_controlador_draw.life_hp-=20;
	
}

if (global.NumQuestion == 2){ //textos das alternativas questão 2
	
	if (obj_txt_alterA._NumAlternativa == 1){
		
		obj_txt_alterA._TextAlternativa = "A2";
		
	}
	
	if (obj_txt_alterB._NumAlternativa == 2){
	
		obj_txt_alterB._TextAlternativa = "B2";
	
	}
	
	if (obj_txt_alterC._NumAlternativa == 3){
	
		obj_txt_alterC._TextAlternativa = "C2";
	
	}
	
	if (obj_txt_alterD._NumAlternativa == 4){
	
		obj_txt_alterD._TextAlternativa = "D2";
	
	}
	
} else if (global.NumQuestion == 3){ //textos das alternativas questão 2
	
	if (obj_txt_alterA._NumAlternativa == 1){
		
		obj_txt_alterA._TextAlternativa = "A3";
		
	}
	
	if (obj_txt_alterB._NumAlternativa == 2){
	
		obj_txt_alterB._TextAlternativa = "B3";
	
	}
	
	if (obj_txt_alterC._NumAlternativa == 3){
	
		obj_txt_alterC._TextAlternativa = "C3";
	
	}
	
	if (obj_txt_alterD._NumAlternativa == 4){
	
		obj_txt_alterD._TextAlternativa = "D3";
	
	}
	
} else {
	instance_destroy(obj_txt_alterA);
	instance_destroy(obj_txt_alterB);
	instance_destroy(obj_txt_alterC);
	instance_destroy(obj_txt_alterD);
}

y = ystart +4;
alarm[0] = 10;

show_debug_message("Questão" + string(global.NumQuestion))