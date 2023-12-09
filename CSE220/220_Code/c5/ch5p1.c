#include <stdio.h>

int main(void) {
  int num = 0, num_of_digits = 0;

  printf("Enter a number: ");
  scanf("%d", &num);
  
  if(num >= 0 && num <= 9) num_of_digits = 1;
  else if(num >= 10 && num <= 99) num_of_digits = 2;
  else if(num >= 100 && num <= 999) num_of_digits = 3;
  else if(num >= 1000 && num <= 9999) num_of_digits = 4;

  if(num_of_digits != 1) printf("The number %d has %d digits\n", num, num_of_digits);
  else printf("The number %d has %d digit\n", num, num_of_digits);

  return 0;
}
