/* Recursive C program to count the number of occurrences of a given number in an int array */

#include <stdio.h>

int search(int* arr, int size, int target);

int main(void) {
	int arr[] = {1, 2, 2, 3, 5};
	int* p = arr;

	printf("%d\n", search(p, 5, 2));

	return 0;
}

int search(int* arr, int size, int target) {
	if(size == 1) return (*arr == target) ? 1 : 0;
	// base case

	int sum = search(arr+1, size-1, target);
	// recursive case
	
	if(*arr == target) sum += 1;

	return sum;
}
