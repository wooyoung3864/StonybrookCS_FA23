/* Reads in a %5d input and determines whether it is a palindrome or not. */

#include <stdio.h>

int main(void) {
	int input;
	int d1, d2, d3, d4, d5;
	int is_palindrome;

	printf("Enter a 5-digit number: ");
	scanf("%5d", &input);

	d1 = input / 10000;
	d2 = (input % 10000) / 1000;
	d3 = (input % 1000) / 100;
	d4 = (input % 100) / 10;
	d5 = input % 10;

	is_palindrome = ( ((d1 == d5) && (d2 == d4)) ? 1 : 0);

	printf("%s", "Is the number a palindrome? ");
	if(is_palindrome == 1) printf("%s", "true\n");
	else if(is_palindrome == 0) printf("%s", "false\n");

	return 0;
}
