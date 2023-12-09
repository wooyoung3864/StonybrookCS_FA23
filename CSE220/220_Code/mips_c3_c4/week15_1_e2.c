#include <stdio.h>
#include <stdlib.h>

// 2. Recursive C program to print a string in reverse

void print_rev(char* str);

int main(void) {
	char* str = "Hello World!";
	print_rev(str);
	printf("\n");

	return 0;
}

void print_rev(char* str) {
	if(!*str) return; // base case: *str is the null terminator
	print_rev(str+1); // recursive case: 
			// print character at the next index, beginning from 0
	printf("%c", *str);
}

