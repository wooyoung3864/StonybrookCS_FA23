#include <stdio.h>

int main(void) {
  int num, d1, d2, d3 = 0;
  printf("Enter a three-digit number: ");
  scanf("\n%d", &num);
  d1 = num / 100;
  d2 = (num - (d1 * 100)) / 10;
  d3 = num % 10;
  printf("The reversal is: %d%d%d\n", d3, d2, d1);  

  return 0;
}
