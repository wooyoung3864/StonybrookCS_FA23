// Recursive program in C to print the presence of a given number in an int array

#include <stdio.h>

void found(int* arr, int size, int search);

int main(void) {
	int arr[] = {1, 2, 3, 4, 5}, *p = arr;

	found(p, 5, 2);
	found(p, 5, 6);

	return 0;
}

void found(int* arr, int size, int search) {
	if(size == 0) printf("NOT FOUND :-(\n"); // base case
 
	if(*arr == search) {
		printf("FOUND.\n");
		return;
	} // recursive case

	found(arr+1, size-1, search);

	return;
}
