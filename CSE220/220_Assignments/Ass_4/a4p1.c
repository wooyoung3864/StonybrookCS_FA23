/** 1. Write a function, StrEnd, that takes as its arguments a string and a character and returns a 1 if the argument character is the last non-null character in the string and returns a 0 
 *	otherwise. 
 */

#include <stdio.h>

int str_end(char *str, char ch);

int main(void) {
	char *str = "String cheese", ch = 'g';
	printf("Sample string: ");
	puts(str);
	printf("Is %c the end of this string? %d\n", ch, str_end(str, ch));

	return 0;
}

int str_end(char *str, char ch) {	
	while(*str) {
		char prev = *str;
		if(!*++str && prev == ch) return 1;
		else continue;
	}

	return 0;
}

