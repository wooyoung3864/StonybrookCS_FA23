/* Problem 2, CSE220 Midterm SP23
 * (a) Write a C function that takes an integer n and for a result returns an approximation to pi calculated from n terms of the formula
 * 	pi = 4 - (4/3) + (4/5) - (4/7) + (4/9) - (4/11) + (4/13) + ... + 4*(-1)^n / 2n+1
 * (b) Write a "main" that reads a value for n, calls the function, and prints the result. */

#include <stdio.h>
#define N 100

float pi(int n);
void debug_pi(int n);
float recursive_pi(int n);
float power(float x, int n);

int main(void) {
	printf("Approximation of pi up to %d iterations: %f\n", N, pi(N));
	//debug_pi(N);
	printf("Approximation of pi up to %d recursions: %f\n", N, recursive_pi(N));
	return 0;
}

float pi(int n) {
	float pi = 0.0f, term = 0.0f;
	int i;

	for(i = 0; i < n+1; i++){
		float num, denom;
	
		if(i % 2 == 1) num = -4.0f;
		else if(i % 2 == 0) num = 4.0f;

		denom = (2 * i) + 1;
		term = num / denom;
		pi += term;
	}

	return pi;
}

float recursive_pi(int n) {
	if(n == 0) return 4.0f;
	return ( (4.0f * power(-1.0, n)) / ( (2 * n) + 1) ) + recursive_pi(n-1);
}

float power(float x, int n) {
	if(n == 0) return 1;
	return x * power(x, n-1);
}
