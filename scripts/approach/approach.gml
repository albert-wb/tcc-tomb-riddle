// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function approach(val1,val2,amount){
	if (val1 < val2)
	{
	    val1 += amount;
	    if (val1 > val2)
	        return val2;
	}
	else
	{
	    val1 -= amount;
	    if (val1 < val2)
	        return val2;
	}
	return val1;
}