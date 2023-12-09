#include <stdio.h>

void swap(int *p, int *q);

int main(void) {
	/* int i, *p, *q;
	
	*a pointer is just an address, and on that address is an integer.
	 * Since both the pointers and the values they point to are both integers, assigning them is not
	 * technically wrong, but the compiler will throw a warning for us to double-check.
	 *
	
	p = i; // cannot point an 'int *' to an int
	p = &q; // 
	p = *q;
	*p = &i;
	p = *&q;
	*p = q;
	&p = q; // look at the address of p, and change that to q. 
	p = q;
	*p = *q; // dereference q, and copy that to the value of p
	*/

	*p = 5;
	*q = 6;
	swap(p, q);
	printf("%d, %d\n", *p, *q);
	
	return 0;
}

void swap(int *p, int *q) {
	int temp_p = *p, temp_q = *q;
	*p = temp_q;
	*q = temp_p;
}
