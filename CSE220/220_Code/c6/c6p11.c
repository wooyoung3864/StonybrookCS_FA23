/* Computes the infinite series approximation of e up to n iterations, where n is an integer value entered by the user. 
   e = 1/0! + 1/1! + 1/2! + 1/3! + ... + 1/n!
*/

#include <stdio.h>

int recursive_factorial(int n) {
  if(n < 1) return 1;
  return n * recursive_factorial(n-1);
}

int factorial(int n) {
  int factorial = 1;
  for(int i = 1; i <= n; i++) factorial *= i;
  return factorial;
}

float infinite_series_approx_e(int n) {
  float sum = 1.0f, term = 1.0f;
  for(int i = 1; i <= n; i++) {
	  term *= 1.0 / i;
	  sum += term;
  }
  return sum;
}


float epsilon_approx_e(float epsilon) {
  float sum = 1.0f, term = 1.0f;
  int i = 1, denom = 1;

  do {
	  term *= 1.0 / i++;
	  sum += term;
  } while(term > epsilon);

  return sum;
}

int main(void) {
  float e, e2 = 0.0f;
  int i, n , denom;
  float epsilon;
  
  printf("Enter number of iterations to approximate the value of e: ");
  scanf("%d", &n);
 
  printf("Enter value of epsilon to approximate e to: ");
  scanf("%f", &epsilon);

  e = infinite_series_approx_e(n);
  e2 = epsilon_approx_e(epsilon);

  printf("Approximation of e up to %d iterations: %f\n", n, e); 
  printf("Approximation of e up to epsilon %f: %f\n", epsilon, e2);

  return 0;
}


