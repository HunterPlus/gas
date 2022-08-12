#include <stdio.h>
#include <stdlib.h>

struct node {
	int	key;
	struct node *left;
	struct node *right;
};

struct node *newnode(int);
void preorder(struct node *);
