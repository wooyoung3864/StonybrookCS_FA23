/* struct student
 * Student Info.
 * 	- Surname
 * 	- First name
 * 	- ID number
 * 	- GPA.
 *
 * 1. Declare a variable of a corresponding structure.
 * 2. Read info for a single entry.
 * 3. Print back the info read.
 */

#include <stdio.h>
#define N 50

struct Student {
	char *surname;
	char *first_name;
	int id_number;
	float gpa;
};

int main(void) {
	struct Student wooyoung;
	char f_name[N];
	printf("Enter first name: ");
	scanf("%49s", f_name);
	wooyoung.first_name = f_name;
	puts(wooyoung.first_name);
	
	return 0;
}
