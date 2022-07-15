#include <stdio.h>

int f(int);             /* for loop */
int w(int);             /* while loop */
int main()
{
        printf("sum 1...3: %d\n", f(3));
        printf("sum 1...4: %d\n", w(4));
        return 0;
}