/* Computes the largest and smallest of four integers entered by the user. */

#include <stdio.h>

int main(void) {
  int n1, n2, n3, n4, temp_min_1, temp_min_2, temp_max_1, temp_max_2, min, max;
  
  printf("Enter four integers: ");
  scanf("%d %d %d %d", &n1, &n2, &n3, &n4);
  
  if(n1 > n2) {
    temp_max_1  = n1;
    temp_min_1  = n2;
  } else {
    temp_max_1 = n2;
    temp_min_1  = n1;
  }

  if(n3 > n4) {
    temp_max_2  = n3;
    temp_min_2 = n4;
  } else {
    temp_max_2 = n4;
    temp_min_2 = n3;
  }
 
  if(temp_max_1 > temp_max_2) 
    max = temp_max_1;
  else max = temp_max_2;

  if(temp_min_1 < temp_min_2) 
    min = temp_min_1;
  else min = temp_min_2;
  
  printf("Largest: %d\n", max);
  printf("Smallest: %d\n", min);

  return 0;
}
