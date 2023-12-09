#include <stdio.h>

#define PI 3.14f
#define FOUR_OVER_THREE 4.0f/3.0f

int main(void) {
  float radius, radius_squared, radius_cubed,  volume = 0.0f;
  
  printf("Enter radius: ");
  scanf("%f", &radius);;

  radius_squared = radius * radius;
  radius_cubed = radius_squared * radius;
  
  volume = FOUR_OVER_THREE * PI * radius_cubed;

  printf("Volume of sphere: %.2f\n", volume);

  return 0;
}

