/* A demo of assignment operator behaviors in C */

#include <stdio.h>

int main(void) {
  int j;
  int i = 1;
  int k = 1 + (j = i);
  printf("%d %d %d\n", i, j, k);
    /* prints "1 1 2" */

  return 0;

  /* v += e isn't "equivalent" to v = v + e
   * One problem is operator precedence: i *= j + k isn't the same as i = i * j + k
   * There are also rare cases in which v += e differs from v = v+e because v itself
   * has a side effect.
   * Similar remarks apply to the other compound assignment operators. */
}
