// Recursive C program to reverse a string in-place

#include <stdio.h>
#include <string.h>

void rev_helper(char* p, char* q);
void rev_str(char* str);

int main(void) {
	char str[] = "Hellong Racecar World!", *p = str;

	puts(str);
	rev_str(p);
	puts(str);

	return 0;
}

void rev_helper(char* p, char* q) {
	if(p < q) {
		char temp = *p;
		*p = *q;
		*q = temp;

		rev_helper(p+1, q-1);
	}
}

void rev_str(char* str) {
	int length = strlen(str);
	char *p = str, *q = str + length - 1;

	rev_helper(p, q);
}
