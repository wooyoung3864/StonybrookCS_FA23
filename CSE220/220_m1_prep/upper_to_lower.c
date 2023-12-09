#include <stdio.h>
#define N 6
#define CASE 'a' - 'A'

void upper_to_lower(char str[], int size);

int main(void) {
	int i;
	char upper[N] = { 'H', 'E', 'L', 'L', 'O', '\0' };
	
	upper_to_lower(upper, N);

	return 0;
}

void upper_to_lower(char str[], int size) {
	int i;
	
	for(i = 0; i < size; i++) printf("%c", str[i] += CASE);
	
	printf("\n");
}
