#include <stdio.h>

int main(void) {
  int gs1, grp_id, pub_code, item_num, chk_digit = 0;
 
  printf("Enter ISBN: ");
 
  scanf("%d-%d-%d-%d-%d", &gs1, &grp_id, &pub_code, &item_num, &chk_digit);
 
  printf("GS1 prefix: %3d", gs1);
  printf("\nGroup identifier: %1d", grp_id);
  printf("\nPublisher code: %3d", pub_code);
  printf("\nItem number: %5d", item_num);
  printf("\nCheck digit: %1d\n", chk_digit);

  return 0;
}
