/* Takes a %2d as an input and converts it into its English representation using switch-case statements. */

#include <stdio.h>

int main(void) {
  int num, tens_digit, ones_digit;
  
  printf("Enter a two digit number: ");
  scanf("%2d", &num);  

  tens_digit = num / 10;
  ones_digit = num % 10;
  
  printf("You entered the number ");

  if(tens_digit == 1) {
    switch(ones_digit) {
      case 9: 
        printf("nineteen.");
        break;
      case 8: 
        printf("eighteen.");
        break;
      case 7: 
        printf("seveteen.");
        break;
      case 6: 
        printf("sixteen.");
        break;
      case 5: 
        printf("fifteen.");
        break;
      case 4: 
        printf("fourteen.");
        break;
      case 3: 
        printf("thirteen.");
        break;
      case 2: 
        printf("twelve.");
        break;
      case 1: 
        printf("eleven.");
        break;
      case 0:
        printf("ten.");
        break;
      default:       
        break;  
    }   

    printf("\n");

    return 0;

  } else if(tens_digit != 0) {

    switch(tens_digit) {
    case 9: 
      printf("ninety");
      break;
    case 8:
      printf("eighty");
      break;
    case 7:
      printf("seventy");
      break;
    case 6:
      printf("sixty");
      break;
    case 5:
      printf("fifty");
      break;
    case 4:
      printf("forty");
      break;
    case 3:
      printf("thirty");
      break;
    case 2:
      printf("twenty");
      break;
    default:
      break;
    }
    
     if(ones_digit == 0) {
       printf(".\n");
       return 0;
     } else if(ones_digit != 0) printf("-");
  }

  switch(ones_digit) {
    case 9: 
      printf("nine.");
      break;
    case 8:
      printf("eight.");
      break;
    case 7:
      printf("seven.");
      break;
    case 6:
      printf("six.");
      break;
    case 5:
      printf("five.");
      break;
    case 4:
      printf("four.");
      break;
    case 3:
      printf("three.");
      break;
    case 2:
      printf("two.");
      break;
    case 1:
      printf("one.");
      break;
    case 0:
      printf("zero.");
      break;
    default:
      break;
  }
  
  printf("\n");  

  return 0;
}
