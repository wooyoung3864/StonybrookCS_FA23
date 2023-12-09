/* Reads two values, x and epsilon, and computes e^x using the formula
 *  e^x = 1 + (x/1!) + (x^2/2!) + (x^3/3!) + ... + (x^n/n!) < epsilon,
 *  where epsilon represents the error tolerance.
 */

#include <stdio.h>

float epsilon_approx_ex(int x, float epsilon);

int main(void) {
	int x;
	float epsilon;

	float sum = 1.0f, term = 1.0f;
	int i, num, denom;

	printf("Enter exponent x and error tolerance epsilon to approximate e^x: ");
	scanf("%d %f", &x, &epsilon);

	for(i = 1, num = 1, denom = 1; term > epsilon; i++) {
		num = (i == 1) ? x : (num * x);
		denom *= i;
		term = (float) num / denom;
		sum += term;
	}

	printf("Approximation of e^%d up to epsilon: %f\n", x, sum);
	
	printf("%f", epsilon_approx_ex(x, sum));

	return 0;
}

float epsilon_approx_ex(int x, float epsilon) {
	float sum = 1.0f, term = 1.0f;
	int i = 1;

	do { 
		term *= (float) x / (float) i++;
		sum += term;
		printf("Term: %f, Sum: %f\n", term, sum);
	} while (term > epsilon);

	return sum;
}
