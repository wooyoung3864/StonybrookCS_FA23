/** 1. Declare a structure suitable for a queue (of int) and corresponding variables
 *  2. Write code to:
 *  	(a) initialize the q
 *  	(b) do an insertion (void insert(...))
 *  	(c) do a deletion
 *  	(d) print the contents, one node per line
 *  3. Write a main() to test it
 */

#include <stdio.h>
#include <stdlib.h>

struct node {
	int value;
	struct node *next;
};

struct queue {
	struct node *head;
	struct node *tail;
};

void init_q(struct queue *queue); // quite lovely, innit?
void enqueue(struct queue *queue, int value);
void dequeue(struct queue *queue);
void print_entries(struct queue *queue);

int main(void) {
	struct queue *queue;
	init_q(queue);

	enqueue(queue, 27);
	enqueue(queue, 94);
	enqueue(queue, -6);
	enqueue(queue, -42960);
	enqueue(queue, 18);
	dequeue(queue);

	print_entries(queue);

	return 0;
}

void init_q(struct queue *queue) {
	queue = malloc(sizeof(struct queue));
	queue->head = NULL;
	queue->tail = NULL;
}

void enqueue(struct queue *queue, int value) {
	struct node *new_node;

	if(new_node == NULL) exit(EXIT_FAILURE);

	new_node = malloc(sizeof(struct node)); /* sizeof() computes the amount of space occupied by an instance of struct node, 
												and allocates that much memory for new_node. */

	new_node->value = value;
	new_node->next = NULL;

	if(queue->head == NULL) {
		queue->head = new_node;
		queue->tail = new_node;
	} else {
		queue->tail->next = new_node;
		queue->tail = new_node;
	}
}

/*
	Feedback for attempt 1:
	First, remove from HEAD, not TAIL. I had it mixed up with stacks.
	Second, ChatGPT says not to free the tail right after setting it to NULL. Freeing null pointers is not only unncessary, but wrong.
	Third, sever the head of the queue (yikes) by declaring the next node of that to be the new head.
	Lastly, free whatever space that used to contain the previous head.

void dequeue(struct queue *queue) {
	queue->tail = NULL;
	free(queue->tail);

	struct node *node;
	for(node = queue->head; node->next != NULL; node = node->next);
	node->next = NULL;
	queue->tail = node;
}
*/

void dequeue(struct queue *queue) { 
	if(queue->head == NULL) return; /* note the double equality operator; if queue->head points to nothing, that implies an empty queue, 
										and therefore nothing to dequeue. */

	struct node *old_head = queue->head;

	queue->head = old_head->next;

	free(old_head);
}

void print_entries(struct queue *queue) {
	struct node *node;

	for(node = queue->head; node != NULL; node = node->next) { 
		// initialize node to queue->head, step in by assigning node to node->next, terminate when node = NULL.
		printf("%d\n", node->value);
	}
}

