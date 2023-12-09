#include <stdio.h>
#define SIX 6

int main(void) {
  int x, result = 0;
  printf("Enter a value for x: \n");
  scanf("%d", &x);

  int x_squared = x*x;
  int three_x_squared = 3*(x_squared);
  int two_x_four = 2*(x*x*x*x);
  int five_x_cubed = 5*(x*x*x);
  int seven_x = 7*x;

  result = three_x_squared + two_x_four - five_x_cubed - x_squared + seven_x - SIX;

  printf("\n3x^5 + 2x^4 - 5x^3 - x^2 + 7x - 6 = %d\n ", result);

  return 0;
}
