#include "tree.h"

struct node *newnode(int key)
{
	struct node *node;
	
	if ((node = malloc(sizeof(struct node))) == NULL) {
		fprintf(stderr, "newnode: error");
		exit(1);
	}
	node->key = key;
	node->left = node->left = NULL;
	return node;
}