#include <stdio.h>

int main(void) {
  int d1, d2 = 0;
  
  printf("Print a two-digit number: ");
  scanf("\n%1d%1d", &d1, &d2);
  printf("The reversal is: %d%d\n ", d2, d1);

  return 0;
}
