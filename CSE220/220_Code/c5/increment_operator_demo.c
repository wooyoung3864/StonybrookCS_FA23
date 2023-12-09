#include <stdio.h>

int main(void) {
  int i = 1;
  printf("%d ", i++ -1);
  printf("%d", i);

  i = 10;
  int j = 5;
  printf("%d ", i++ - ++j);
  printf("%d %d", i, j);

  i = 7;
  j = 8;
  printf("%d ", i++ - --j);
  printf("%d %d", i, j);

  i = 3;
  j = 4;
  int k = 5;
  printf("%d ", i++ - j++ + --k);
  printf("%d %d %d", i, j, k);
 
  return 0;
}
