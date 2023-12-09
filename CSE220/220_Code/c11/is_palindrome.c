/* Prgramming Project 2, Chapter 12
 * (a) Write a program that reads a message, then checks whether it's a palindrome 
 * 	(the letters in the message are the same from left to right as from right to left) :
 *	
 *	Enter a message: "He lived as a devil, eh?
 *	Palindrome
 *
 *	Enter a message: "Madam, I am Adam."
 *	Not a palindrome
 *
 *	Ignore all characters that aren't letters. Use integer variables to keep track of positions in the array.
 *
 * (b) Revise the program to use pointers instead of integers to keep track of positions in the array.
 */

#include <stdio.h>
#define N 10
#define CASE ' '

int is_palindrome(char str[]);
void print_bool(int bool_value);

int main(void) {
	char str[] = "He lived as a devil, eh?", str2[] = "Madam, I am Adam.", str3[] = "?@HehE.!\"eHeh", str4[] = "r Ace+-=,  c  ./?!@#(    a R";
	int str_palindrome = is_palindrome(str), str2_palindrome = is_palindrome(str2), str3_palindrome = is_palindrome(str3), str4_palindrome = is_palindrome(str4);
	print_bool(str_palindrome);
	printf("\n");
	print_bool(str2_palindrome);
	printf("\n");
	print_bool(str3_palindrome);
	printf("\n");
	print_bool(str4_palindrome);

	return 0;
}

int is_palindrome(char str[]) {
	char *p, *q, *r; // pointer p to be set initially to str[0]
	p = str;
	q = p;

	int size = 0; // str.length

	while(*q != 0) {
		q++;
		size++;
	} // computes str.length

	for( ; p < str + size; p++) {
		if(*p >= 65 && *p <= 90) *p += CASE; // converts *p = a[p] to lowercase if *p is an uppercase char
	}

	p = str; // resets p to str[0]
	r = str + size - 1; // equivalent to str[size]; valid in the case of pointers

	while(p < r) {
		while(*p < 97 || *p > 122) p++;
		while(*r < 97 || *r > 122) r--;

		if(*p != *r) return 0;
		
		p++;
		r--;
	}

	return 1;
}

void print_bool(int bool_value) {
	(bool_value == 1) ? printf("true") : printf("false");
}
