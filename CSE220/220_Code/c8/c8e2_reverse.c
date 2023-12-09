/*   2. (a) Read 10 integers into an array
 *   	(b) Print the elements of the array.
 *   	    Reverse the elements in the array. 
 *   	    (Don't use another array).
 *   	(c) Print the elements of the array
 */

#include <stdio.h>
#define N 2

int main(void) {
	int a[N], front, back, i, j;

	for(i = 0; i < N; i++) {
		printf("Enter a number: ");
		scanf("%d", &a[i]);
	}

	for(i = 0, j = N -1; i < (N / 2); i++, j--) {
		front = a[i];
		back = a[j];
	
		a[i] = back;
		a[j] = front;
	}
	
	printf("[");
	for(i = 0; i < N; i++) {
		if(i != N -1) printf("%d, ", a[i]);
		else printf("%d", a[i]);
	}
	printf("]");

	return 0;
}

