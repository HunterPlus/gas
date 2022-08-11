/* gcc newnode.c newnode.s printlink.s  */

#include <stdio.h>
#include <stdlib.h>

struct node {
    	int data;
    	struct node *next;
};

void printlink(struct node *);
struct node *newnode(int);
int main()
{
    	struct node *p;
    
   	p = newnode(10);
    	p->next = newnode(20);
    	printf("node data: %d\n", p->data);
    	printf("next node data: %d\n", p->next->data);

        printlink(p);


    	return 0;
}
