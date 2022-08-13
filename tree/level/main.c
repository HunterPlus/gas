#include "tree.h"

/*
                1
            2       3
        4       5

*/
int main()
{
        struct node *root;

        root = newnode(1);
        root->left = newnode(2);
        root->right = newnode(3);
        root->left->left = newnode(4);
        root->left->right = newnode(5);

        printf("level order traversal:\n");
        levelorder(root);
        printf("\n");
        return 0;
}