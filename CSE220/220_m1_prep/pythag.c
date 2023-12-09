/* Problem 4, Assignment 2, CSE 220
 * A Pythagorean triangle is a right triangle in which the sum of the squares of two of the sides is equal to the square of the hypotenuse. 
 * We may represent such a triangle with a triple of the three sides; e.g., <3, 4, 5>.
 *
 * Assuming the sides are all of integer values, write a program to determine and list (one per line) all Pythagorean triangles for which the sum of the three sides is less than N, where N is user input.
 */

#include <stdio.h>

int main(void) {
	int a, b, c, n; // (a^2 + b^2 + c^2) < n
	int a2, b2, c2;
	int p, q;	

	printf("Enter an integer N to list all Pythagorean triangles whose sum of sides is < N: ");
	scanf("%d", &n);
	
	printf("All Pythagorean triples where a + b + c < N: \n");

	p = 2; // p > q

	do {
		for(q = 1; q < p; q++) {
			a = (p * p) - (q * q);
			a2 = a * a;

			b = 2 * p * q;
			b2 = b * b;

			c = (p * p) + (q * q);
			c2 = c * c;

			if (c > n) break;
			
			printf("<%d, %d, %d>\n", a, b, c);
		}
			p++;
	} while (c < n);

	return 0;
}

	
