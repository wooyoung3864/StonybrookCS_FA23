/** 2. Write a function, Insert, that takes the same parameters as in (1) plus an additional integer, x, and inserts x in the correct position in a sorted array. 
 *     
 *     Write test code that first calls Sort to sort the array and then calls Insert to do an insertion.
 */

#include <assert.h>
#include <stdio.h>

void sort(int a[], int m, int n);
void insert(int a[], int m, int n, int x);

int main(void) {
	int i, m, n, x;
	
	printf("Enter size of array: ");
	scanf("%d", &n);

	printf("Enter number of elements in array: ");
	scanf("%d", &m);
	assert(n > m);

	int a[n];

	for(i = 0; i < m; i++) {
		printf("Enter a number: ");
		scanf("%d", &a[i]);
	}

	sort(a, m, n);

	printf("Enter number to insert into array: ");
	scanf("%d", &x);
	insert(a, m, n, x);

	printf("Array with inserted number: ");
	for(i = 0; i <= m; i++) printf("%d ", a[i]);
	
	printf("\n");

	return 0;
	}

void sort(int a[], int m, int n) { // I thought of this sorting algorithm in my head and used it because it was simple. 
					// Suboptimal time complexity; could be improved by implementing a more efficient algorithm such as Merge Sort.
	int i, j;

	for(i = 0; i < m; i++) {
		for(j = i+1; j < m; j++) {
			if(a[j] < a[i]) {
				int temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}
	}
}

void insert(int a[], int m, int n, int x) { // precondition: a is sorted using sort(), 
						// n > m; this suggests that there is always extra space to shift elements to the right by 1 and insert x
	int insert_index, i; // insertion index and i as for-loop index

	if(x <= a[0]) insert_index = 0; // if x <= min, insert x at 0
	else if(x>= a[m-1]) insert_index = m; // if x >= max, insert x at m
	else {
		for(i = 0; i < m-1; i++) {
			if( (x >= a[i]) && (x < a[i+1]) ) { // find an index such that x is >= current element and < next element
				insert_index = i+1;
				break;
			}
		}
	}

	for(i = m; i > insert_index - 1; i--) { // shift all elements after insert_index to the right by 1
		a[i] = a[i-1]; 
	}

	a[insert_index] = x; // insert x at insert_index after shifting everything else to the right by 1
}
