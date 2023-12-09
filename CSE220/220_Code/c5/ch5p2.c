#include <stdio.h>
#include <stdbool.h>

int main(void) {
  int hour, min = 0;
  bool is_am = true; 

  printf("Enter a 24-hour time: ");
  scanf("%d:%d", &hour, &min);
  
  if(hour == 0)  hour = 12;
  else if(hour > 12) {
    hour -= 12;
    is_am = false;
  }
  
  if(is_am) printf("Equivalent 12-hour time: %d:%02d AM\n", hour, min);
  else printf("Equivalent 12-hour time: %d:%02d PM\n", hour, min);

  return 0;
}
    
