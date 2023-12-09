/** Caesar Cipher in C
 * Take an input string, and shift each letter 3 places to the right in the alphabet, 
 * wrapping around to the beginning of the alphabet if necessary.
 * 
 * Sentence Title Case Verification in C
 *  Your task is to write a C function that checks whether a sentence is in 'Title Case'. In
 *   other words, the function should return true if each word in the sentence starts with a
 *  capital letter and continues with lowercase letters. Here are the specific requirements:
 *   • The function should take a single argument - a string, representing the sentence to
 *  check. This string consists only of letters and blank spaces.
 *   • The function should return a boolean value (in C, typically represented as an int with
 *  0 for false and non-zero for true).
 *  • The function should return true if and only if each word in the sentence starts with a
 *   capital letter and continues with lowercase letters. Otherwise, it should return false.
 *   • Write the function as described above. Test your function with several test sentences to
 *   ensure that it works correctly.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_INPUT_SIZE 100

int is_uppercase(char c);
void caesar_cipher(char* str);
void caesar_decipher(char* str);
int str_length(char* str);
int is_title_case(char* str);
int is_palindrome(char* str);

int main(void) {
    
    char* str = malloc(MAX_INPUT_SIZE);
    if(!str) {
        printf("Not enough memory!\n");
        return 1;
    }
    

    //char* str = "Title Case Here";

    printf("Enter a string: ");
    fgets(str, MAX_INPUT_SIZE, stdin);

    //caesar_cipher(str);
    //puts(str);

    //caesar_decipher(str);
    //puts(str);

    printf("The length of the string is: %d\n", str_length(str));

    printf("%d\n", is_title_case(str));

    printf("%d\n", is_palindrome(str));

    free(str);

    return 0;
}

int is_uppercase(char c) { // helper function that returns 1 if the input character is in uppercase, 0 otherwise
    if(c >= 'A' && c <= 'Z') return 1;
    return 0;
}

// f: [A, Z] -> [A, Z]. Maps distinct characters in the domain [A-Z] to distinct characters in the codomain [A-Z].
void caesar_cipher(char* str) { // Assume all input characters are uppercase alphabets; shift +3 ASCII digits for each character.
    char* c = str;
    while(*c) {
        if(*c == '\n') { // The newline character terminates input during stdin, so assume this as the terminator
            *c = *(c+1); // Assuming '\0' comes right after the '\n', copy '\0' into the index of '\n',
        } 
        if(*c >= 'X') {
            *c -= 26;
        }
        *c += 3;
        c++;
    }
}
/*
Inverse function for caesar_cipher. 
Injective as it maps distinct inputs to distinct outputs, and surjective as every element in the codomain is covered.
The fact that this function works proves its bijectivity.
*/
void caesar_decipher(char* str) {   
    char* c = str;
    while(*c) {
        if(*c <= 'C') {
            *c += 26;
        }
        *c -= 3;
        c++;
    }
}

int str_length(char* str) {
    char* p = str;
    while(*p++);

    return p - str - 2;
}

/* 
Checks whether a sentence is in 'Title Case'. 
In other words, the function should return true if each word in the sentence starts with a capital letter 
and continues with lowercase letters.
    @param
        char *str: a char pointer to an input string
    @return
        1: if the input string is in Title Case
        0: if the input string is NOT in Title Case
*/

int is_title_case(char* str) {
    int length = str_length(str); // str.length
    if(length <= 1) return 0; // return 0 if the input string is less than 2 characters long
    char *p = str; // initializes a pointer to &str[0]

    while(*p) { // iterate until the last non-null character of the string
        if(is_uppercase(*p) == 0) return 0; // return 0 if the first character of a word is in lowercase
        while(*++p != ' ' && *p) { // traverses the string until a whitespace character is encountered 
                                    // && the next character is not null
            if(is_uppercase(*p) == 1) return 0; // return 0 if any char other than the first in a word is in uppercase
        }
        while(*p == ' ') p++; // skip any whitespace characters; continue otherwise
    }

    return 1; // return 1 if str has passed all test cases
}

/* 
Checks whether a sentence is a palindrome. 
    @param
        char *str: a char pointer to an input string
    @return
        1: if the input string is a palindrome
        0: if the input string is NOT a palindrome
*/
int is_palindrome(char* str) {
    int front = 0, back = str_length(str) - 1;

    while(front++ < back--) {
        if(str[front] != str[back]) return 0;
    }

    return 1;
}
