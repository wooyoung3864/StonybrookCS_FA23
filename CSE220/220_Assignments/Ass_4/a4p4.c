/** 4. Programming Project 1 on Page 311 of the textbook.
 * 	1. Write a program that finds the "smallest" and "largest" in a series of words. After the user enters the words, the program will determine which words would come first and last if
 * 	   the words were listed in dictionary order. The program must stop accepting input when the user enters a four-letter word. Assume that no word is more than 20 letters long. 
 * 	   An interactive session with the program might look like this:
 *
 * 	   Enter word: dog
 * 	   Enter word: zebra
 * 	   Enter word: rabbit
 * 	   Enter word: catfish
 * 	   Enter word: walrus
 * 	   Enter word: cat
 * 	   Enter word: fish
 *
 * 	   Smallest word: cat
 * 	   Largest word: zebra
 *
 * 	   Hint: Use two strings named smallest_word and largest_word to keep track of the "smallest" and "largest" words entered so far. 
 * 	   	 Each time the user enters a new word, use strcmp to compare it with smallest_word; if the word is "smaller", use strcpy to save it in smallest_word. 
 * 	   	 Do a similar comparison with largest_word. 
 * 	   	 Use strlen to determine when the user has entered a four-letter word.
 */

#include <stdio.h>
#include <string.h>
#define N 20

void smallest_and_largest();

int main(void) {
	smallest_and_largest();
}

void smallest_and_largest() {
	char input[N], smallest_word[N], largest_word[N];

	for(int i = 0; i < N; i++) {
		smallest_word[i] = 'z';
		largest_word[i] = 'a';
	}

	do {
		printf("Enter word: ");
		scanf("%20s", input);
		if(strcmp(input, smallest_word) <= 0) strcpy(smallest_word, input);
		if(strcmp(input, largest_word) >= 0) strcpy(largest_word, input);
	} while(strlen(input) != 4);

	printf("\nSmallest word: %s\n", smallest_word);
	printf("Largest word: %s\n", largest_word);
}
