#include <stdio.h>

void *hello(void *arg)
{
        printf("Hello from thread #%ld\n", (long)arg);
}
