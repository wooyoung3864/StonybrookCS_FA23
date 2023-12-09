/** 4. Modify the read_line function in each of the following ways:
 * 	(a) Have it skip white space before beginning to store input characters.
 * 	(b) Have it stop reading at the first white-space character.
 * 		Hint: To determine whether or not a character is white space, call the isspace function. 
 */

#include <stdio.h>
#include <ctype.h>
#define N 15

int read_line(char str[], int n);
int main(void) {
	char str[N+1];
	
	printf("%d\n", read_line(str, N));
	puts(str);

	return 0;
}

int read_line(char str[], int n) {
	int ch, i = 0, is_space = 1;

	while( isspace((ch = getchar())) ); 
	/* (a) keep reading and discarding a character until it is no longer whitespace, and store the non-whitespace char */
	
	while(i < n && !isspace(ch)) {
		str[i++] = ch;
		ch = getchar();
	}
	
	if(i < n-1 && ch == '\n') str[i++] = '\n';

	str[i] = '\0';
	return i;
}
