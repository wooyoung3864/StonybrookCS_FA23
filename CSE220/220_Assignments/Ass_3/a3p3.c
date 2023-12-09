/** 3. Write a function to find the number of occurrences of integers in an array of ten elements. For example, with the array { 8, 3, 8, 5, 4, 3, 4, 3, 5, 9 }, the output should be 
 * 	8:2
 * 	3:3
 * 	5:2
 * 	4:2
 *      9:1
 *     Write a main to test the function appropriately.
 */

#include <stdio.h>
#define N 10

void sort(int arr[], int size);
void num_occurrences(int arr[], int size);

int main(void) {
	int arr[N] = { 8, 3, 8, 5, 4, 3, 4, 3, 5, 9 };
	
	printf("Input array: \n");
	for(int i = 0; i < N; i++) printf("%d ", arr[i]);
	printf("\n");

	num_occurrences(arr, N);

	return 0;
}

void sort(int arr[], int size) {
	int i, j;

	for(i = 0; i < size; i++) {
		for(j = i+1; j < size; j++) {
			if(arr[j] < arr[i]) {
				int temp = arr[i];
				arr[i] = arr[j];
				arr[j] = temp;
			}
		}
	}
}

void num_occurrences(int arr[], int size) {
	sort(arr, size); // sorts arr in ascending order first so that identical elements are grouped together.
			
	int i = 0, j, num_unique = 0;

	/** Compares adjacent elements using two nested loops; the for-loop with index j traverses the subarray spanning i to size-1 and compares arr[j] to arr[i].
	 *  Increments num_unique when a repeated occurrence of an element at i is encountered.
	 *  Increments i by num_unique so that it skips to the next unique element, and resets num_unique to 0 so that it can count occurrences of the next unique element.
	 */
	while(i < size) {
		for(j = i; j < size; j++) {
			if(arr[i] == arr[j]) num_unique++; // increments num_unique
		}

		printf("Number of unique occurrences of %d: %d\n", arr[i], num_unique);
		i += num_unique; // increments i by num_unique
		num_unique = 0; // resets num_unique to 0
	}
}


