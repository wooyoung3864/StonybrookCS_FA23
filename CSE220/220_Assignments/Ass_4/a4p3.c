/** 3. Consider a function, StrRev, whose argument is a string and whose actions are to reverse the elements in the string.
 * 	
 * 	Write two versions of StrRev: one that uses array indexing and one that uses pointers. 
 *
 * 	The use of an additional array or string is not permitted.
 */

#include <stdio.h>

void idx_str_rev(char str[]);
void ptr_str_rev(char *str);

int main(void) {
	char str[] = "String cheese";
	char ptr[] = "Abcdef ghijkle";
	
	idx_str_rev(str);
	printf("Original string: \"String cheese\"\nReversed string using array indexing: %s", str);

	ptr_str_rev(ptr);
	printf("\nString cheeseOriginal string: \"Abcdef ghijkle\"\nReversed string using pointers: %s", ptr);

	return 0;
}

void idx_str_rev(char str[]) {
	int i = 0, n = 0;

	while(str[n]) n++;
	int j = n-1;

	do {
		char temp = str[i];
		str[i] = str[j];
		str[j] = temp;
	} while(i++ < j--);
}

void ptr_str_rev(char *str) {
	char *p = str, *q = str;

	while(*q) q++;
	q -= 1;

	do {
		char temp = *q;
		*q = *p;
		*p = temp;
	} while(p++ < q--);
}

