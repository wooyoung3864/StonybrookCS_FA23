/* Reads 10 lower-case characters and prints their upper-case counterparts mechanically, without any library functions. */

#include <stdio.h>

int main(void) {
	char ch;
	int i;

	printf("Enter 10 characters: ");

	for(i = 0; i < 10; i++) {
		scanf("%c", &ch);
		
		if('a' <= ch && ch <= 'z') ch = ch - 'a' + 'A';
		/* No need to compute ASCII codes manually here. 
		 * First, compute how much ch deviates from 'a',
		 * and then add the ASCII code of 'A', which can be
		 * expressed as just 'A' here.
		 */

		printf("%c", ch);
	}

	printf("\n");

	return 0;
}

