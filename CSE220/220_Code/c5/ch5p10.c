/* Computes a letter grade from a numerical grade input using switch-case statements. */

#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int numerical_grade, tens_digit;
  char letter_grade;

  printf("Enter numerical grade: ");
  scanf("%d", &numerical_grade);
  
  if(numerical_grade > 100 || numerical_grade < 0) { 
    printf("Invalid input. Enter a numerical grade between 0 and 100\n.");
    exit(1);
  }

  tens_digit = numerical_grade / 10;

  switch(tens_digit) {
    case 10: 
    case 9: 
      letter_grade = 'A';
      break;
    case 8: 
      letter_grade = 'B';
      break;
    case 7:
      letter_grade = 'C';
      break;
    case 6:
      letter_grade = 'D';
    default:
      letter_grade = 'F';
      break;
   }   
  
  printf("Letter grade: %c\n", letter_grade);
  return 0;
}
