#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

#define PERMS 0666      /* RW for owner, group, others */

void copy(int old, int new);

char    buffer[BUFSIZ];

int main(int argc, char *argv[])
{
        int     fdold, fdnew;

        if (argc != 3) {
                fprintf(stderr, "need 2 arguments for copy program\n");
                exit(1);
        }
        if ((fdold = open(argv[1], O_RDONLY)) == -1) {
                fprintf(stderr, "cannot open file %s\n", argv[1]);
                exit(1);
        }
        if ((fdnew = creat(argv[2], PERMS)) == -1) {
                fprintf(stderr, "cannot create file %s\n", argv[2]);
                exit(1);
        }
        copy(fdold, fdnew);
        return 0;
}
