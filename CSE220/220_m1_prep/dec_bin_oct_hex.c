/* Problem 5, Assignment 2, CSE220
 * Write a program that prints a table of the binary, octal, and hexadecimal equivalents of decimal numbers in the range 1 to N, where N is user input and less than 256.
 */

#include <stdio.h>
#define DIGIT 10
#define LIMIT 256
#define DEC 10
#define BIN 2
#define OCT 8
#define HEX 16

int main(void) {
	int n;
	int dec;

	printf("Enter a number between 1 and 255, inclusive: ");
	scanf("%d", &n);
	if(n >= LIMIT) return 0;
	printf("\n");

	for(dec = 0; dec <= n; dec++) {
		int num;
		int digit = 1, remainder = 1;
		int bin = 0, oct = 0, hex = 0;

		for(num = dec; num > 0; num /= BIN) {
			remainder = num % BIN;
			bin += (remainder * digit);
			digit *= DIGIT;
		}
		remainder = 1, digit = 1;

		for(num = dec; num > 0; num /= OCT) {
			remainder = num % OCT;
			oct += (remainder * digit);
			digit *= DIGIT;
		}
		remainder = 1, digit = 1;

		for(num = dec; num > 0; num /= HEX) {
			remainder = num % HEX;
			hex += (remainder * digit);
			digit *= DIGIT;
		}
		remainder = 1, digit = 1;

		printf("Decimal: \t%3d\nBinary: \t%8d\nOctal: \t\t%3d\nHexadecimal: \t%3d\n\n", dec, bin, oct, hex);
	}
	
	return 0;
}
