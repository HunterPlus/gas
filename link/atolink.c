/* gcc atolink.c newnode.s printlink.s atolink.s */

#include <stdio.h>
#include <stdlib.h>

struct node {
    	int data;
    	struct node *next;
};

void printlink(struct node *);
struct node *newnode(int);
struct node *atolink(int *, int);

int main()
{
        int arr[] = { 10, 20, 30, 40, 50 };
    	struct node *head;
    
        head = atolink(arr, sizeof(arr)/sizeof(arr[0]));
    	printlink(head);
    	return 0;
}
