#include <stdio.h>

int main(void) {
  int num, d1, d2 = 0;
  printf("Enter a two-digit number: ");
  scanf("\n%d", &num);
  d1 = num / 10;
  d2 = num % 10;
  printf("The reversal is: %d%d\n", d2, d1);

  return 0;
}
