/** Struct tags- struct part part1, part2, ...
 * Explict type definition- typedef { } Part;
 
  Midterm P3 solution to be posted this afternoon

  Arrays of structures - struct part inventory[100]

  The relationship between arrays and pointers in C, 
  dynamic memory allocation (malloc(), calloc(), realloc(), free(), etc)
  necessary to manipulate more advanced data structures such as linked lists and trees

  Through dynamic memory allocation, we can design data structures that grow (and shrink) as needed

  Used for strings, arrays, lists, etc

  The <stdlib.h> library contains the memory allocation functions
  malloc() always returns a generic pointer to the allocated memory:
  	p = malloc(n+1); // p is a char * variable.
	p = (char *) malloc(n+1); // some programmers prefer to cast malloc's return value to a char * variable.

	Pointers test true or false in the same way as numbers: if (p) == if (p != NULL) and vice versa.

	void *malloc(size_t size); // malloc allocates a block of size bytes and returns a pointer to it.
				   // size_t is an unsinged integer type defined in the library.
	
When allocating memory for a string of size n, where n is an unsigned integer, call malloc(n+1) to account for the null character.

Can be used to write the concat function; malloc (strlen(str1) + strlen(str2) + 1)

Heap memory problems: pointers that point to nothing, or pointers that point to a free (but allocated) block of memory.
	Example: say two blocks of memory with size m and n are allocated at non-contiguous addresses, but are free.

	malloc(m+n) would return an error, although there is enough contiguous space that can be freed by deallocating &m and &n.

sizeof(int) - an int variable usually occupies four bytes of memory. Call sizeof() along with n once n, the length of the array, is concretized at runtime.

calloc() - allocates space for an array with nmemb elements, each of with length of size bytes
	 - returns a null pointer if the requested space isn't available
	 - initializes allocated memory by setting all bits to 0

Problem 1: p = malloc(...);
	   q = malloc(...);
	   p = q;

	   Since now p and q both point to the same memory location, the original location denoted by p is no longer reachable.
	   This causes UB, and potentially, memory leaks. We need to run GC to properly free that space.
	   free(p) deallocates the memory block that p points to but doesn't change p itself.

Problem 2: p = malloc(...);
	   q = malloc(...);
	   free(p);
	   p = q; // omitting this line will cause p to point to nothing, which is an entry point for undefined behavior.
			// also, malloc() must be called before pointing a pointer to that address.

Linked Lists
- first, declare a node type.
- last node in the list contains a null pointer.

struct node {
	int value;
	struct node *next;
	struct node *prev; // for doubly linked lists
}; // node must be a tag, not a typedef name, or there will be no way to declare the type of next.

The -> operator
- Accessing a member of a struct using a pointer is so common that C provides a special operator.
- aka right arrow selection: ->
- new_node -> value = 10; instead of (*new_node).value = 10;
- example: scanf("%d", &new_node->value);

Searching a linked list:
	for(p = first; p != NULL; p = p->next) { ... }

Queue- LIFO
	[f]...[l] -> queue.dequeue() = [l]

Stack- FIFO
	[f]...[l] -> stack.pop() = [f]

*/
