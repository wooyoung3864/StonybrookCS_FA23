/*
1. A string may be implemented, somewhat inefficiently, as a linked list.
    (i) Write a function that reads a sequence of characters and builds such a list.
    (ii) Write a function that takes such a list and prints the chracter string.
    (iii) Write a function that takes two strings represented in this manner and returns the result of concatenating them.
*/

#include <stdio.h>
#include <stdlib.h>

struct Node {
    char ch;
    struct Node *next;
};

struct LinkedList {
    struct Node *head;
};

struct LinkedList *build_string();
void print_string(struct LinkedList *str);
struct LinkedList *concat(struct LinkedList *str1, struct LinkedList *str2);

int main(void) {
    print_string(concat(build_string(), build_string()));
}

struct LinkedList *build_string() {
    struct LinkedList *string = malloc(sizeof(struct LinkedList)); // initalizes a LL and allocates memory for it

    printf("Enter string: ");

    char ch;
    while((ch = getchar()) != '\n') { // takes in user input by each character; input is terminated when the newline character is entered
        struct Node *curr = malloc(sizeof(struct Node)); // initializes a Node and allocates memory for it
        curr->ch = ch; // assigns ch to the value of node curr
        curr->next = NULL; // set curr->next as NULL for now

        if(string->head == NULL) {
            string->head = curr;
        } else {
            struct Node *temp = string->head;
            while(temp->next != NULL) temp = temp->next; // traverses the list from head to tail and points temp to tail
            temp->next = curr; // assign curr at tail->next
        }
    }

    return string;
}

void print_string(struct LinkedList *str) {
    struct Node *curr;
    for(curr = str->head; curr != NULL; curr = curr->next) {
        printf("%c", curr->ch);
    }
    printf("\n");
}

struct LinkedList *concat(struct LinkedList *str1, struct LinkedList *str2) {
    struct LinkedList *res = malloc(sizeof(struct LinkedList));

    if(str1 == NULL) return str2;
    if(str2 == NULL) return str1;

    struct Node *temp;
    for(temp = str1->head; temp->next != NULL; temp = temp->next);
    temp->next = str2->head;

    res = str1;

    return res;
}

