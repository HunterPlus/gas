#include <stdio.h>
char *stringcpy(char *, char *);
int main()
{
        char    dest[20];
        char    *s = "hello world";

        
        printf("%s\n", stringcpy(dest, s));
}