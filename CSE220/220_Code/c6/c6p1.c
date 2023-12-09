/* Takes in a series of %f inputs and returns the largest value read so far until user enters a nonpositive value. */

#include <stdio.h>

int main(void) {
  float input;
  float max; 

  do {
    printf("Enter a number: ");
    scanf("%f", &input);
    if(input > max) max = input;
  } while(input != 0.0f);
 
  printf("The largest number entered was %f\n", max);

  return 0;
}
