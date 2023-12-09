/*   1. (a) Read 10 integers into an array
 *	(b) Search array to find smallest integer
 *	(c) Print that value
 */

#include <stdio.h>
#define N 10

int main(void) {
	int a[N], i;
	int min;

	for(i = 0; i < N; i++) {
		printf("Enter a number: ");
		scanf("%d", &a[i]);	
	}

	printf("\n");	
	min = a[0];

	for(i = 0; i < N; i++) {
		if(a[i] < min) min = a[i];
	}

	printf("The smallest number is: %d\n", min);

	return 0;
}
