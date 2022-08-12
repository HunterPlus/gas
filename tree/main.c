/* 
        gcc main.c newnode.c preorder.c      

                1
            2       3
        4
*/

#include "tree.h"
int main()
{
	struct node *root;
	
	root = newnode(1);
	root->left =newnode(2);
	root->right = newnode(3);
	root->left->left = newnode(4);

        preorder(root);
        printf("\n");
	return 0;
}