/* A) 1. Write a function to compute Fibonacci numbers
 *    2. Write a main to test it and print result
 * B) 1. Write a function find_max that takes two arguments (array and array size), 
 * 	 finds (using recursion) the largest element.
 *    2. Write a main to test it.
 */

#include <stdio.h>
#define N 10

/* n! = n * (n-1)! if n != 1
 *      = 1 if n = 1 */
int factorial(int n); 

/* f(0) = 0
 * f(1) = 1
 * f(n) = f(n-1) + f(n-2) if n >= 2
 * */
int fib(int n); 
int find_max(int arr[], int n);
int find_min(int arr[], int n);
void selection_sort(int arr[], int n);
float power(float x, int n);

int main(void) {
	for(int i = 0; i < N; i++) printf("%d! = %d\n", i, factorial(i));
	printf("\nFibonacci numbers up to %d:\n", N);
	for(int i = 0; i <= N; i++) printf("%d\n", fib(i));

	int arr[N] = { 567, 45, 67, -9, 789, -77, 77, 1, 5, 420 };
	int arr2[N] =  { 567, 45, 67, -9, 789, -77, 77, 1, 5, 420 };
	int arr3[N] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

	printf("\nMax in array: %d", find_max(arr, N));
	printf("\nMin in array: %d\n", find_min(arr2, N));
	printf("\nMax in zero array: %d\n", find_max(arr3, N));
	
	selection_sort(arr2, N);
	printf("\nArray after selection sort: \n{ ");
	for(int i = 0; i < N; i++) {
		if(i == N-1) printf("%d", arr2[i]);
		else printf("%d, ", arr2[i]);
	}

	printf("\nZero array after selection sort: \n{ ");
	for(int i = 0; i < N; i++) {
		if(i == N-1) printf("%d", arr3[i]);
		else printf("%d, ", arr3[i]);
	}

	printf(" }\n\n");

	float input = 3.0f;
	for(int i = 0; i <= N; i++) printf("%.2f to the power of %d: %.10f\n", input, i, power(input, i));

	return 0;
}

int factorial (int n) {
	if (n == 0) return 1;
	return n * factorial (n-1);
}

int fib (int n) {
	if (n == 0) return 0;
	if (n == 1) return 1;
	return fib (n-1) + fib (n-2);
}

int find_max(int arr[], int n) {
	int max, prev;

	max = arr[n-1];

	if(n == 1) return max;

	prev = find_max(arr, n-1);

	if(prev > max) max = prev;

	return max;
}

int find_min(int arr[], int n) {
	int min, prev;

	min = arr[n-1];

	if(n==1) return min;

	prev = find_min(arr, n-1);

	if(prev < min) min = prev;

	return min;
}

void selection_sort(int arr[], int n) {
	if(n == 1) return; // return if size of recursive sub-array is 1

	int max_idx = 0, temp, i; // unique local variables for each (base & recursive) call

	for(i = 0; i < n; i++) { // iteratively searches for max element in array
		if(arr[i] > arr[max_idx]) max_idx = i; // updates index of max if new max encountered @ i+1
	}

	temp = arr[n-1]; // temporarily stores last element in array
	arr[n-1] = arr[max_idx]; // replaces last element with max element
	arr[max_idx] = temp; // replaces max element with last element

	selection_sort(arr, n-1); // recurse with sub-array of size n-1
}

float power(float x, int n) {
	if(n == 0) return 1;
	if(n % 2 == 0) return power(x, n/2) * power(x, n/2);
	return x * power(x, n-1);
}
