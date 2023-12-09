/**
 * 1. Write a function, Sort, that takes three parameters-- an array, the size of the array, and the number of the actual elements in the array-- reads in some integers, and sorts them:
 * 	void Sort(int a[], int n, int m)
 *    Call the function from main to test it; n should be greater than m, and the elements read should be sorted into the first m slots of the array.
 */

#include <stdio.h>

void sort(int a[], int n, int m);

int main(void) {
	int m, n, i;
	printf("Enter size of array: ");
	scanf("%d", &n);
	printf("Enter number of elements in array: ");
	scanf("%d", &m);
	
	int a[n];

	for(i = 0; i < m; i++) {
		printf("Enter a number: ");
		scanf("%d", &a[i]);
	}

	sort(a, n, m);

	printf("Sorted array: ");
	for(i = 0; i < m; i++) printf("%d ", a[i]);
	printf("\n");

	return 0;
}

void sort(int a[], int n, int m) {
	int i, j;

	for(i = 0; i < n; i++) {
		for(j = i+1; j < n; j++) {
			if(a[j] < a[i]) {
				int temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}
	}
}


