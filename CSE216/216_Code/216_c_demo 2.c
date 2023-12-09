/*
extern ... : variable declarations; memory is not allocated
int ... : variable definitions
*/

# include <stdio.h> // < _ > looks inside system files
// #include "stdio.h" looks inside current directory

# define N 10 // preprocessor for defining constants

extern int c; // only defines the variable; does not DECLARE it
                // it will compile, but NOT LINK

int main() {
    int c = 0;
    const int co = 34;
    
    printf("6. Hello, \aWorld!\n");
    printf("7. Hello, \bWorld!\n");
    printf("8. Hello, \fWorld!\n");
    printf("9. Hello, \rWorld!\n"); // overwrites World on top of Hello
    printf("10. Hello, \vWorld!\n");
    printf("11. Hello, \x48World!\n");
    printf("12. Hello, \101World!\n");
    printf("13. Hello, \u03B1World!\n");

    return 0;
}