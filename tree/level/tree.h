#include <stdio.h>
#include <stdlib.h>

struct node {
	int	key;
	struct node *left;
	struct node *right;
};

struct node *newnode(int);
void enqueue(void *);
void *dequeue();
void levelorder(struct node *node);