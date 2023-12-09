/** strcmp compares the strings s1 and s2, returning a value less than, equal to, or greater than 0, depending on whether s1 is less than, equal to, or greater than s2. */

#include <stdio.h>

int strcmp(const char *s1, const char *s2);

int main(void) {
	const char *p1 = "abcd";
	const char *p2 = "abzd";

	printf("%d\n", strcmp(p1, p2));

	return 0;
}

int strcmp(const char *s1, const char *s2) {
	if(*s1 == *s2) return 0;
	while(*s1 != '\0' && *s2 != '\0') {
		if(*s1 != *s2) {
			return *s1 - *s2;
		}

		s1++;
		s2++;
	}
	return 0;
}

