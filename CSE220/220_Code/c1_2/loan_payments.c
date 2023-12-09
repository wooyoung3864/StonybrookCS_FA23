#include <stdio.h>

#define PERCENT_COEFF 0.01f
#define MONTHS 12.0f

int main(void) {
  float loan_amount, interest_rate_percentage, monthly_interest_rate,  monthly_payment = 0.0f;
  float first_balance, second_balance, third_balance = 0.0f;
  
  printf("Enter amount of loan: \n");
  scanf("%f", &loan_amount);
  printf("Enter interest rate: \n");
  scanf("%f", &interest_rate_percentage);
  printf("Enter monthly payment: \n");
  scanf("%f", &monthly_payment);
  
  monthly_interest_rate = 1 + ( (interest_rate_percentage * PERCENT_COEFF) / MONTHS);
  
  first_balance = (loan_amount - monthly_payment) * monthly_interest_rate;
  second_balance = (first_balance - monthly_payment) * monthly_interest_rate;
  third_balance = (second_balance - monthly_payment) * monthly_interest_rate;

  printf("\nBalance remaining after first payment: $%.2f", first_balance);
  printf("\nBalance remaining after second payment: $%.2f", second_balance);
  printf("\nBalance remaining after third payment: $%.2f", third_balance);

  return 0;
}
