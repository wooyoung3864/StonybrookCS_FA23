/* 4. A Pythagorean triangle is a right triangle in which the sum of the squares of two of the sides is equal to the
 * hypotenuse. We may represent such a triangle with a triplet of the three sides; e.g., <3, 4, 5>.
 *
 * Assuming the sides are all of integer values, write a program to determine and list (one per line) all Pythagorean triangles for which the sum of the three sides is less than N, where N is user input.
 */

#include <stdio.h>

int main(void) {
	int a, b, c;
	int a2, b2, c2;
	int n;

	printf("Enter an integer N to list all Pythagorean triangles where sum of all three sides is < N: ");
	scanf("%d", &n);

	printf("List of all Pythagorean triangles where sum of all three sides is < N: \n ");

	for(c = 3; c < n; c++) { // We know that in a Pythagorean triangle, a < b < c, so I set arbitrary initial values.
		for(b = 2; b < c; b++) {
			for(a = 1; a < b; a++) {
				a2 = a * a;
				b2 = b * b;
				c2 = c * c;

				if( (c2 == (a2 + b2)) && ( (a + b + c) < n)) 
					printf("<%d, %d, %d>\n", a, b, c);
			}
		}
	}

	return 0;
}
