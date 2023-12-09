/*
3. A polynomial may be implemented as a linked list in which each node represents a term. 
    That is, each node consists of 
        (a) a data item that is the coefficient of the term,
        (b) a data item that is the exponent, and
        (c) a pointer to the next term.

    (i) Write a function that, as arguments, takes a polynomial list and a term (i.e., coefficient value and exponent value) and adds the term to the polynomial.

        If a term with the same exponent is already in the list, then it should be combined with the new one. For example, if the list already has the representation of 3x^2,
        and the new term is 4x^2, then there should be a single entry, for 7x^2.

    (ii) Write a function that builds a polynomial by repeatedly calling the function in (i). The arguments of the function should include the number of terms to be read.
    (iii) Write a function that takes a polynomimal and a value for x, and returns the result of the evaluation of the polynomial.
*/

#include <stdio.h>
#include <stdlib.h>

struct Term {
    int coeff;
    int exp;
    struct Term *next;
};

struct Polynomial {
    struct Term *head;
};

void add_term(struct Polynomial *list, int coeff, int exp);
struct Polynomial *build_polynomial(int num_terms);

float eval(struct Polynomial *list, float x);
float power(float x, int n); // helper function for eval

void print_list(struct Polynomial *list); // for debugging purposes

int main(void) {
    int exp, coeff, num_terms;
    float x;

    printf("Enter number of terms: ");
    scanf("%d", &num_terms);
    printf("\n");

    struct Polynomial *list = build_polynomial(num_terms);

    print_list(list);

    printf("Enter a value for x: ");
    scanf("%f", &x);
    printf("%f", eval(list, x));

    struct Term *del = list->head;
    while(del != NULL) {
        struct Term *temp = del;
        del = del->next;
        free(temp);
    }
    free(list);

    return 0;
}

void add_term(struct Polynomial *list, int coeff, int exp) {
    struct Term *term = malloc(sizeof(struct Term));
    term->coeff = coeff;
    term->exp = exp;
    term->next = NULL;

    struct Term *curr = list->head;
    if(list->head == NULL) {
        list->head = term;
    } else {
        while(curr->next != NULL) {
            if(term->exp == curr->exp) { 
                /*if a term with an identical exponent to that of an element in the list is encountered, 
                    add their coeffs and return. */
                (curr->coeff) += (term->coeff);
                return;
            }
            curr = curr->next;
        }
        curr->next = term; // add term to the tail of the list
    }
}

struct Polynomial *build_polynomial(int num_terms) {
    struct Polynomial *list = malloc(sizeof(struct Polynomial));
    list->head = NULL;

    for(int i = 0; i < num_terms; i++) {
        int coeff, exp;

        printf("Enter the coefficient: ");
        scanf("%d", &coeff);

        printf("Enter the exponent: ");
        scanf("%d", &exp);
        printf("\n");

        add_term(list, coeff, exp);
    }

    return list;
}

float eval(struct Polynomial *list, float x) {
    float sum;
    struct Term *curr = list->head;

    while(curr != NULL) {
        sum += ((curr->coeff) * power(x, curr->exp));
        curr = curr->next;
    }

    return sum;
}

float power(float x, int n) {
    if(x == 0.0f && n > 0) return 0.0f;
    else if(x == 0.0f && n <= 0) EXIT_FAILURE;
    else if(n == 0) return 1;
    else if(n < 0) return 1.0f / (x * power(x, abs(n)-1)); 
    return x * power(x, n-1);
}

void print_list(struct Polynomial *list) {
    struct Term *term = list->head;

    for( ; term != NULL; term = term->next) {
        printf("Coefficient: %d\nExponent: %d\n\n", term->coeff, term->exp);
    }
}

