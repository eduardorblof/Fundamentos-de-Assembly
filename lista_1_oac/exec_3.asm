main: 
	# s0 = temp; s1 = x
	addi s0, zero, 5
	addi t0, zero, 10
	addi t1, zero, 25
	addi t2, zero, 0
switch:
	beq  s0, t0, case_1
	beq s0, t1, case_2
	j default
case_1:
	add s1, zero, t0
	j exit
case_2:
	
	add s1, zero, t1
	j exit
default:
	add s1, zero, t2
	j exit
exit:
	nop

/*

int main(){
	int s0 = 5;
	int t0 = 10;
	inz t1 = 25;
	int t2 = 0;

	int s1;

	switch(s0){
	case(t0):
		s1 = t0;
	case(t1):
		s1 = t1;
	default:
		s1 = t2;
	}
	return 0;
}


*/