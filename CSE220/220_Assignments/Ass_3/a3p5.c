/** 5. Write a function whose arguments are an integer N and a matrix (i.e., two-dimensional array), of N by N integers and whose actions are to transpose the matrix. 
 *  Write a main to test the function with a small matrix.
 */

#include <stdio.h>
#define N 3

void transpose(int n, int arr[n][n]);

int main(void) {
	int arr[N][N] = { {2, 1, 2}, {3, 5, 7}, {-13, -9, 0} }; // transpose(arr) should be { {2, 3, -13}, {1, 5, -9}, {2, 7, 0} }

	printf("Original matrix: \n");
	for(int i = 0; i < N; i++) {
		for(int j = 0; j < N; j++) {
			printf("%d\t", arr[i][j]);
		}
		printf("\n");
	}
	
	transpose(N, arr);
	printf("Transposed matrix: \n");
	for(int i = 0; i < N; i++) {
		for(int j = 0; j < N; j++) {
			printf("%d\t", arr[i][j]);
		}
		printf("\n");
	}

	return 0;
}

void transpose(int n, int arr[n][n]) {
	int i, j, temp;

	for(i = 0; i < n; i++) {
		for(j = i; j < n; j++) {
			if(i == j) continue; // elements on the main diagonal do not have to be swapped.
			temp = arr[i][j];
			arr[i][j] = arr[j][i];
			arr[j][i] = temp;
		}
	}
}

