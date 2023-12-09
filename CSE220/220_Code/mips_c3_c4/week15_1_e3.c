/*
 * 3. Write and test a recursive function that goes through a string and replaces instances of a given character
 *    with instances of another character.
 */

#include <stdio.h>

void replace(char* str, char operand, char operator);

int main(void) {
	char str[] = "Luck Lock Lick", operand = 'L', operator = 'S';
	
	printf("\nOriginal string: ");
	puts(str);

	replace(str, operand, operator);

	printf("\nModified string: ");
	puts(str);

	return 0;
}

void replace(char* str, char operand, char operator) {
	if(!*str) return; // base case
	if(*str == operand) *str = operator;

	replace(str+1, operand, operator); // recursive case
}
	

