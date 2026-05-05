main: 
	addi s0, zero, 10 
	addi s1, zero, 5
if:
	blt s1, s0, else # salta se s1 < s0
	add s2, s0, zero # s2 = s0
	jal exit
	
else: 
	add s2, s1, zero # s2 = s1
exit:
	nop

/* 

int main(){

	int x = 10;
	int y = 5;
	int z;

	if(x >= y){
	z = x;
	} else {
	z = y; 
	}

	return 0;

}

*/