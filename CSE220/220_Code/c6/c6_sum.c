/* Takes int n as an input, computes its summation from i=1 to i=n, and prints the result. */

#include <stdio.h>

int main(void) {
  int n;
  int sum = 0;;
  
  printf("Enter a number n: ");
  scanf("%d", &n);
  
  for(int i = 1; i < n+1; i++) sum += i;

  printf("Summation of i=1 to i=n: %d\n", sum);

  return 0;
}
