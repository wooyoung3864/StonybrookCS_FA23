/* 5. Write a program that prints a table of the binary, octal, and hexadecimal equivalents of decimal numbers in the 
 * range of 1 to N, where N is user input and less than 256.
 */

#include <stdio.h>

int main(void) {
	int n, bin, dec, oct, hex;
	int exp = 1;

	printf("Enter any number N less than 256: ");
	scanf("%d", &n);

	if(n >= 256) {
		do {
			printf("Input error. Please enter a number less than 256.");
			scanf("%d", &n);
		} while (n >= 256);
	}

	for (dec = 1; dec <= n; dec++) {
		int num;
		int remainder, digit = 1;
		bin = 0, oct = 0, hex = 0;
	
		for (num = dec; num > 0; num /= 2) {
			remainder = num % 2;
			bin += (remainder * digit);
			digit *= 10;
		}
		remainder = 1, digit = 1;
		
		for (num = dec; num > 0; num /= 8) {
			remainder = num % 8;
			oct += (remainder * digit);
			digit *= 10;
		}
		remainder = 1, digit = 1;	
		
		for(num = dec; num > 0; num /= 16) {
			remainder = num % 16;
			hex += (remainder * digit);
			digit *= 10;
		}
		remainder = 1, digit = 1;
		
		printf("Decimal: %03d\n", dec);
		printf("Binary: %08d\n", bin);
		printf("Octal: %03d\n", oct);
		printf("Hexadecimal: %03d\n\n", hex);
	}
 
	return 0;
}

