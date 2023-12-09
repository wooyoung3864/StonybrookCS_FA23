/* 1. Declare and initialize an array of 10 elements
 * 2. Write a function that finds and returns the largest element in the array
 * 3. Write a main to call the function and print the result.
*/
#include <stdio.h>
#define N 10

int max_arr(int arr[], int n);
int rec_max_arr(int arr[], int n);
void selection_sort(int arr[], int n);

int main() {
	//int arr[N] = { -9, 1, 2, 5, 4, 5, 3, 2, 7, -6 }, i;
	int arr[N], i;
	
	for(i = 0; i < N; i++) {
		printf("Enter a number: ");
		scanf("%d", &arr[i]);
	}
	
	printf("%d\n", max_arr(arr, N));
	printf("%d\n", rec_max_arr(arr, N));	
	selection_sort(arr, N);
	for(int i = 0; i < N; i++) printf("%d", arr[i]);

	return 0;
}

int max_arr(int arr[], int n) {
	int max, i;
	max = arr[0];

	for(i = 0; i < n; i++) 
		if(arr[i] > max) max = arr[i];

	return max;
}

int rec_max_arr(int arr[], int n) {
	int max, next;
	max = arr[n];
	if (n == 1) return arr[0];
	next = rec_max_arr(arr, n-1);
	if (next > max) return next;
	return max;
}

void selection_sort(int arr[], int n) {
	if(n == 0) return;

	int i, temp, max_idx = 0;

	for(i = 0; i < n; i++) {
		if(arr[i] > arr[max_idx]) {
			max_idx = i;
		}
	}

	temp = arr[n-1];
	arr[n-1] = arr[max_idx];
	arr[max_idx] = temp;

	selection_sort(arr, n-1);
}

	



// Do recursive version & 216 PP1
