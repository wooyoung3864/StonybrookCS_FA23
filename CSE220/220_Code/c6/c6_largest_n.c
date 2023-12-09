/* Reads N integers and prints the largest value. */

#include <stdio.h>

int main(void) {
  int n, input, max;
  printf("Specify number of values to input: ");
  scanf("%d", &n);

  printf("Enter %d values:\n", n);

  for(int i = 0; i < n; i++) {
    scanf("%d", &input);
    if(input > max) max = input;
  }

  printf("The largest value is: %d\n", max);
 
  return 0;
}    
