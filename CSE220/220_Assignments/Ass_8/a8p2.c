/*
 * Recursive C function that computes the number of occurrences of a given number in an int array.
 */

#include <stdio.h>

int num_occurrences(int* arr, int length, int num);

int main(void) {
	int arr[]  = {1, 2, 2, 3, 4, 2, 5, 2, 6};
	int* p = arr;

	printf("%d\n", num_occurrences(p, 9, 2));	

	return 0;
}

int num_occurrences(int* arr, int length, int num) {
	if(length == 1) {
		return (*arr == num) ? 1 : 0;
	} // base case

	int sum = num_occurrences(arr+1, length-1, num); // recursive case

	if(*arr == num) { 
		sum +=1;
	} 

	return sum;
}
	
