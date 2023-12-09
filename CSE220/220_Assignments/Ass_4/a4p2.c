/** 2. strncmp is a version of strcmp that has an additional argument, an integer N, and which compares only the first N characters of the two argument strings. 
 * 	
 * 	Write two versions of strncmp: one that uses array indexing and one that uses only pointers. 
 */

#include <stdio.h>

int idx_strncmp(char str1[], char str2[], int n);
int ptr_strncmp(char *str1, char *str2, int n);

int main(void) {
	char str1[] = "Test1234", str2[] = "Test1235";
	char *ptr1 = "Test1234", *ptr2 = "Test1235";

	printf("Test: index-based strncmp of test strings \"Test1234\" and \"Test1235\" up to index 7: ");
	printf("%d\n", idx_strncmp(str1, str2, 7));
	printf("Test: pointer-based strncmp of test strings \"Test1234\" and \"Test1235\" up to index 8: ");
	printf("%d\n", ptr_strncmp(ptr1, ptr2, 8));
	
	return 0;
}

int idx_strncmp(char str1[], char str2[], int n) {
	int i = 0;

	while(i++ < n-1) {
		if(!(str1[i] && str2[i])) break; /* terminates loop if a null character is encountered in either string;
						the enclosed conditional !(str1[i] && str2[i]) is an application of De Morgan's Law. */
		if(str1[i] < str2[i]) return -1;
		else if(str1[i] > str2[i]) return 1;
	}

	return 0;
}

int ptr_strncmp(char *str1, char *str2, int n) {
	int i = 0;

	while(i++ < n-1) {
		if(!(*str1++ && *str2++)) break; // terminates loop if a null character is encountered in either string

		if(*str1 < *str2) return -1;
		else if(*str1 > *str2) return 1;
	}

	return 0;
}
