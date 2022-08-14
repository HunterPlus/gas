#include <stdio.h>
#include <unistd.h>

extern char buffer[];

void copy(int old, int new)
{
        int     n;

        while ((n = read(old, buffer, BUFSIZ)) > 0)
                write(new, buffer, n);
}