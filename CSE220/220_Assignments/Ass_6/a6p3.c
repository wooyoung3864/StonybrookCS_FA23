#include <stdio.h>
#define AST '*'
#define SPC ' '
#define NEWL '\n'

int main(void) {
    int n, i = 1;

    printf("Enter a positive integer: ");
    scanf("%d", &n);
    printf("%c", NEWL);
    int m = n-1, k = n;

    while(i++ <= n) {
        for(int j = 1; j <= k; j++) {
            if(j > m) printf("%c", AST);
            else printf("%c", SPC);
        }
        printf("%c", NEWL);
        m--;
        k++;
    }

    return 0;
}

