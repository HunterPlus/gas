#include "tree.h"

void preorder(struct node *node)
{
	if (node == NULL)
		return;
	printf("%d ", node->key);	/* visit this node */
	preorder(node->left);		/* visit left */
	preorder(node->right);		/* visit right */
}