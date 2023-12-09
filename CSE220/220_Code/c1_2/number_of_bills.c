#include <stdio.h>

#define TWENTY 20
#define TEN 10
#define FIVE 5
#define ONE 1

int main(void) {
  int amt, twenty, twenty_remainder, ten, ten_remainder, five, five_remainder, one = 0;

  printf("Enter a dollar amount: ");
  scanf("%d", &amt);
 
  twenty = amt / TWENTY;
  twenty_remainder = amt % TWENTY;
  ten = twenty_remainder / TEN;
  ten_remainder = twenty_remainder % TEN;
  five = ten_remainder / FIVE;
  five_remainder = ten_remainder % FIVE;
  one = five_remainder / ONE;

  printf("$20 bills: %d\n", twenty);
  printf("\n$10 bills: %d\n", ten);
  printf("\n$5 bills: %d\n", five);
  printf("\n$1 bills: %d\n", one);

  return 0;
}
