/* int find_max(int a[], int N) 
 * - returns largest value in array
 *
 * int main(void)
 * - reads values into array
 * - calls find_max
 * - prints result
 */

#include <stdio.h>
#define N 10

int find_max(int a[], int n);

int main(void) {
	int arr[N], *p;

	printf("Enter %d numbers: ", N);
	for(p = arr; p < arr + N; p++) scanf("%d", p); // scans a %d into the memory address denoted by p; 
							// therefore & would be redundant in this case
	printf("Maximum element in array: %d\n", find_max(arr, N));

	return 0;
}

int find_max(int a[], int n) {
	int *p;
	p = a;
	int max = *p;

	for( ; p < a + n; p++) {
		if(*p > max) max = *p;
	}

	return max;
}
