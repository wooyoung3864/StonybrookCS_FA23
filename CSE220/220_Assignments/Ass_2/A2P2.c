/* Reads in a %1d %d input as a pair of integers, where the first item represents the Product Number, and the latter the quantity of said product sold in the day. Computes the total value of items sold and returns the product. */

#include <stdio.h>

int main(void) {
	int product_number, quantity, price;
	int total_value;

	for(int i = 0; i < 5; i++) {
		printf("Enter product number and quantity sold in the day: ");
		scanf("%1d%d", &product_number, &quantity);

		switch(product_number) {
			case 1: 
				price = 2980;
				break;
			case 2:
				price = 450;
				break;
			case 3:
				price = 990;
				break;
			case 4:
				price = 400;
				break;
			case 5:
				price = 750;
				break;
			default:
				price = 0;
				break;
		}
		
		total_value += price * quantity;	
	}

printf("Total value of items sold in the day: %d won.\n", total_value);

	return 0;
}


