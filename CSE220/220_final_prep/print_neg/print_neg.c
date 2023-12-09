// Recursive program that prints all the negative numbers in a 10-element int array

#include <stdio.h>

void print_neg(int* arr, int size);

int main(void) {
	int arr[] = {1, 2, -2, -34, 5, 6, -6, -94, 78, -49};
	int* p = arr;

	print_neg(p, 10);

	return 0;
}

void print_neg(int* arr, int size) {
	if(size == 0) {
		return;
	}
	
	if(*arr < 1) printf("%d ", *arr);

	print_neg(arr+1, size-1);
}
