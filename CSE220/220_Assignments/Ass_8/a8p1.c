/* Question 1, Assignment #8, CSE 220
 * Recursive 'division by repeated subtraction' function in C, as an intermediary step before formally porting to MIPS code for submission,
 * in order to understand the algorithm better.
 *
 * Author: Wooyoung "Richard" Jung
 * Version: 1.0
 */

#include <stdio.h>
#include <stdlib.h>

void divide_helper(int res[], int quotient, int divisor, int dividend);
int* divide(int divisor, int dividend);

int main(void) {
	int divisor, dividend;

	printf("Enter a positive divisor and dividend, each followed by the Enter key: \n");
	scanf("%d\n%d", &divisor, &dividend);

	int *res = divide(divisor, dividend);
	
	printf("The quotient is: %d\nThe remainder is: %d\n", res[0], res[1]);

	free(res);
	return 0;
}

void divide_helper(int res[], int quotient, int divisor, int dividend) {
	if(divisor < dividend) {
		res[0] = quotient;
		res[1] = divisor;
	} else {
		divide_helper(res, quotient + 1, divisor - dividend, dividend);
	}
}

int* divide(int divisor, int dividend) {
	int res[2];
	
	divide_helper(res, 0, divisor, dividend);

	int* ptr = malloc(sizeof(int) * 2);
	ptr[0] = res[0];
	ptr[1] = res[1];

	return ptr;
}


