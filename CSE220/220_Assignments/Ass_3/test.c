#include <stdio.h>
#define N 10

int main(void) {
	int arr[N] = { -3, 3, 3, 4, 4, 5, 5, 8, 8, 9 }, i = 0, j, num_unique = 0;

	while(i < N) {
		for(j = i; j < N; j++) {
			if(arr[i] == arr[j]) num_unique++;
		}

		printf("Number of unique occurrences of %d: %d\n", arr[i], num_unique);
		i += num_unique;
		num_unique = 0;
	}

	return 0;
}
