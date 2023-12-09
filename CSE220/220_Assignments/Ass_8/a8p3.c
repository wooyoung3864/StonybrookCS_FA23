// Homemade strcmp function in C

#include <stdio.h>

int strcmp(char* s1, char* s2);

int main(void) {
	char str1[] = "Hellong";
	char str2[] = "Hello";
	char *p = str1, *q = str2;

	printf("%d\n", strcmp(p, q));

	return 0;
}

/* "Mom, can we get strcmp?"
 * "No, we have strcmp at home"
 * "strcmp at home:"  */
int strcmp(char* s1, char* s2) {
	while(*s1 || *s2) {
		if(*s1 > *s2) return 1;
		else if(*s1 < *s2) return -1;

		if(*s1) s1++;
		if(*s2) s2++;
	}
	return 0;
}
