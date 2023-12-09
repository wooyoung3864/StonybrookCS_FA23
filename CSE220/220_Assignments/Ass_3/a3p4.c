/** 4. Repeat (3), but with code that uses pointers instead of array subscripting (i.e., indexing).
 */

#include <stdio.h>
#define N 10

void ptr_sort(int arr[], int size);
void ptr_num_occurrences(int arr[], int size);

int main(void) {
	int arr[N] = { 8, 3, 8, 5, 4, 3, 4, 3, 5, 9 };
	
	printf("Input array: \n");
	for(int i = 0; i < N; i++) printf("%d ", arr[i]);
	printf("\n");

	ptr_num_occurrences(arr, N);

	return 0;
}

void ptr_sort(int arr[], int size) {
	int *p, *q, temp;

	for(p = arr; p < arr + size; p++) {
		for(q = p+1; q < arr + size; q++) {
			if(*q < *p) {
				temp = *p;
				*p = *q;
				*q = temp;
			}
		}
	}
}

void ptr_num_occurrences(int arr[], int size) {
	ptr_sort(arr, size);

	int *p = &arr[0], *q, num_unique = 0;

	while(p < arr + size) {
		for(q = arr; q < arr + size; q++) {
			if(*p == *q) num_unique++;
		}
		printf("Number of unique occurrences of %d: %d\n", *p, num_unique);
		p += num_unique;
		num_unique = 0;
	}
}

