#include <stdio.h>
#define N 10

int max_min_diff(int arr[], int n);
int rec_max(int arr[], int n);
int rec_min(int arr[], int n);
int rec_diff(int arr[], int n);

int main(void) {
	int arr[] = {4, 5, 6, -7, 9, -69, 420, 77, -2, 68};
	//printf("Max - min: %d\n", max_min_diff(arr, N));
	//printf("Max: %d\n", rec_max(arr, N));
	//printf("Min: %d\n", rec_min(arr, N));
	printf("Difference: %d\n", rec_diff(arr, N)); // weird recursion error what the fuck

	return 0;
}

int max_min_diff(int arr[], int n) {
	int max, min, i;
	
	max = arr[0];
	min = arr[n-1];

	for(i = 0; i < n; i++) {
		if(arr[i] > max) max = arr[i];
		if(arr[i] < min) min = arr[i];
	}

	if(min < 0) return max + min;
	return max - min;
}

int rec_max(int arr[], int n) {
	int max, prev;

	max = arr[n];

	if(n == 1) return 0;

	prev = rec_max(arr, n-1);

	if(prev > max) max = prev;

	return max;
}

int rec_min(int arr[], int n) {
	int min, prev;
	min = arr[n];

	if(n == 1) return 0;

	prev = rec_min(arr, n-1);

	if(prev < min) min = prev;

	return min;
}

int rec_diff(int arr[], int n) {
	int max = rec_max(arr, n);
	int min = rec_min(arr, n);

	if(min < 0) return max + min;
	return max - min;
}
