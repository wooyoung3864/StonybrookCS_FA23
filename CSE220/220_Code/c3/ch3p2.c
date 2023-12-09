#include <stdio.h>

int main(void) {
  int item_number = 0;
  float unit_price = 0.0f;
  int month, day, year = 0;
  
  printf("Enter item number: ");
  scanf("%d", &item_number);
  printf("Enter unit price: ");
  scanf("%f", &unit_price);
  printf("Enter purchase date (mm/dd/yyyy): ");
  scanf("%d/%d/%d", &month, &day, &year);

  printf("Item\t\tUnit\t\tPurchase\n\t\tPrice\t\tDate\n");
  printf("%-5d\t\t$ %4.2f\t%d/%d/%d", item_number, unit_price, month, day, year);
 
  return 0;
}
