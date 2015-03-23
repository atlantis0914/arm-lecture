#include <stdio.h>
#include <time.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  clock_t start_t, end_t;
  float total_t = 0;

  scanf("%d",&number);
  start_t = clock();
  result = fibonacci(number); 
  end_t = clock();
  total_t = (float)(end_t - start_t)/CLOCKS_PER_SEC;
  
  printf("The fibonacci sequence at %d is: %d\n", number, result);
  printf("Time cost: %f second\n", total_t);
  return 0;
}

