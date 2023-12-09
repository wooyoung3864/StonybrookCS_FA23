/*
2. A doubly-linked list is one in which each node has three components:
    (a) a pointer to the preceding node (except for the first node),
    (b) some data, and
    (c) a pointer to the next node (except for the last node).
    The complete list itself has a single pointer pointing to the first item.

    Write a program that
    (i)     reads an integer N,
    (ii)    reads N integers and enters them into a doubly-linked list, ensuring that the contents of the list are always in ascending order,
    (iii)   and print the final list.
*/

#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node *next;
    struct Node *prev;
};

struct LinkedList {
    struct Node *head;
};

void print_list(struct LinkedList *list);
void build_list();

int main(void) {
    build_list();
}

void print_list(struct LinkedList *list) {
    struct Node *node = list->head;
    for( ; node != NULL; node = node->next) {
        printf("%d ", node->data);
    }
    printf("\n");
}

void build_list() {
    struct LinkedList *list = malloc(sizeof(struct LinkedList));
    list->head = NULL;

    int n;
    printf("Enter number of integers to enter: ");
    scanf("%d", &n);
    for(int i = 0; i < n; i++) {
        int val;
        printf("Enter an integer: ");
        scanf("%d", &val);

        struct Node *curr = malloc(sizeof(struct Node));
        curr->data = val;
        curr->prev = NULL;
        curr->next = NULL;

        if(list->head == NULL || val <= list->head->data) { 
            curr->next = list->head; // link curr to head
            if(list->head != NULL) { // if val is smaller than the value of the first element
                list->head->prev = curr; // prepend curr to head
            }
            list->head = curr; // set curr as the new head
        } else {
            struct Node *temp = list->head; // temporary pointer to traverse the LL

            while(temp->next != NULL && val >= temp->next->data) { // traverse the LL while it has a next element, 
                                                                    // and the value to be entered is >= but < than that of the next node
                temp = temp->next;
            }

            curr->next = temp->next; // once the correct insertion index is found, link curr->next to temp->next

            if(temp->next != NULL) {
                temp->next->prev = curr; // if insertion occurs somewhere in the middle, link curr to (temp->next)->prev
                                            // I like to imagine it as wedging curr between temp and temp->next.
            }

            curr->prev = temp; // establish bidirectional link between temp and curr
            temp->next = curr;
        }
    }

    print_list(list);

    struct Node *del = list->head;
    while(del != NULL) {
        struct Node *temp = del;
        del = del->next;
        free(temp);
    }
    free(list);
}