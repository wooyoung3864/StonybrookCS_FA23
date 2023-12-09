/*   3. (a) Read 9 integers into a 3x3 array.
 * 	(b) Search the array for the smallest integer.
 * 	(c) Print that value.
 */

#include <stdio.h>
#define N 3

int main(void) {
	int a[N][N], min, i, j;

	for(i = 0; i < N; i++) {
		for(j = 0; j < N; j++) {
			printf("Enter a number: ");
			scanf("%d", &a[i][j]);
		}
	}

	min = a[0][0];

	for(i = 0; i < N; i++) {
		for(j = 0; j < N; j++) {
			if(a[i][j] < min) min = a[i][j];
		}
	}

	printf("\nThe smallest number is: %d\n", min);

	return 0;
}
