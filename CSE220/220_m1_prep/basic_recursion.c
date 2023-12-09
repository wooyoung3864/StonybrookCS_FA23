/* CYKA BLYAT basic recursion in C. factorial, power, taylor, you name it blyat */

#include <stdio.h>
#define N 10

int factorial(int n);
float power(float x, int n);
float iterative_taylor_e(int n);
float recursive_taylor(float x, int n);
float epsilon_taylor_e(float epsilon);
float recursive_taylor_pi(int n);

int rec_arr_max(int arr[], int n);
int rec_arr_min(int arr[], int n);
void selection_sort(int arr[], int n);

int main(void) {
	for(int i = 0; i <= 10; i++) printf("%d! = %d\n", i, factorial(i));
	for(int i = 0; i <= 10; i++) printf("%.2f^%d = %.3f\n", (float) i, i, power(i, i));	
	printf("%f\n", iterative_taylor_e(100));
	printf("%f\n", recursive_taylor(0.1, 10));
	printf("%f\n", epsilon_taylor_e(0.001));

	int arr[N] = {0, -69, 420, 32, 22, 13, -5, 6, -39, 51};
	printf("%d\n", rec_arr_max(arr, N));
	printf("%d\n", rec_arr_min(arr, N));
	selection_sort(arr, N);

	printf("{");
	for(int i = 0 ; i < N; i++) {
		if(i == N-1) printf("%d", arr[i]);
		else printf("%d, ", arr[i]);
	}
	printf("}\n");

	return 0;
}

int factorial(int n) {
	if (n == 0) return 1;
	return n * factorial(n-1);
}

float power(float x, int n) {
	if(n == 0) return 1;
	return x * power(x, n-1);
}

float iterative_taylor_e(int n) {
	int i;
	float term = 1.0f, sum = 1.0f;

	for(i = 1; i <= n; i++) {
		term *= 1.0f / i;
		sum += term;
	}

	return sum;
}

float recursive_taylor(float x, int n) {
	if(n == 1) return 1.0f;
	return ( power(x, n-1) / factorial(n-1) ) + recursive_taylor(x, n-1);
}

float epsilon_taylor_e(float epsilon) {
	float term = 1.0f, sum = 1.0f;
	int i = 1;

	do {
		term *= 1.0f / i++;
		sum += term;
	} while(term > epsilon);

	return sum;
}

int rec_arr_max(int arr[], int n) {
	int max, prev;

	max = arr[n];

	if(n == 1) return 0;

	prev = rec_arr_max(arr, n-1);

	if(prev > max) max = prev;
	
	return max;
}

int rec_arr_min(int arr[], int n) {
	int min, prev;

	min = arr[n];

	if(n == 1) return 0;

	prev = rec_arr_min(arr, n-1);

	if(prev < min) min = prev;

	return min;
}

void selection_sort(int arr[], int n) {
	if(n == 1) return;

	int max_idx = 0, temp, i;

	for(i = 0; i < n; i++) {
		if(arr[i] > arr[max_idx]) max_idx = i;
	}

	temp = arr[n-1];
	arr[n-1] = arr[max_idx];
	arr[max_idx] = temp;

	selection_sort(arr, n-1);
}

float recursive_taylor_pi(int n) {
	if(n == 0) return 4;
	else return ( 4 * power(-1, n)  / 2 * n + 1) + recursive_taylor_pi(n-1);
}
