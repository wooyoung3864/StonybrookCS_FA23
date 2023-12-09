// C algorithm to reverse a string in-place

#include <stdio.h>
#include <string.h>

void rev_helper(char* str, int start, int end);;
void reverse_string(char* str);

int main(void) {
	char str[] = "Hello World";
	char* p = str;

	puts(str);

	reverse_string(p);

	printf("\n");
	puts(str);

	return 0;
}

void rev_helper(char* str, int start, int end) { 
	if(start < end) {
		char temp = str[start];
		str[start] = str[end];
		str[end] = temp;

		rev_helper(str, start+1, end-1);
	}
}

void reverse_string(char* str) {
	int length = strlen(str);
	rev_helper(str, 0, length-1);
}
