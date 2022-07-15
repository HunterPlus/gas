#include <stdio.h>

struct data {
        char    x;
        int     y;
};
struct ldata {
        char    x;
        int     y;
        long    z;
};

void f1(int *);
void f2(int *, int);
void f3(struct data *);
void f4(struct ldata *, int);
int main()
{
        int x = 1;
        int a[4] = {1, 1, 1, 1};
        struct data s = {'a', 1};
        struct ldata sa[4] = {};

        f1(&x);
        printf("f1-x: %d\n", x);

        f2(a, 2);
        printf("f2-a[2]: %d\n", a[2]);

        f3(&s);
        printf("f3-s.y: %d\n", s.y);

        f4(sa, 3);
        printf("f4-sa[3].y: %d\n", sa[3].y);

        return 0;

}