#include "tree.h"

void levelorder(struct node *node)
{
        while(node) {
                printf("%d ", node->key);
                if (node->left)
                        enqueue(node->left);
                if (node->right)
                        enqueue(node->right);
                node = dequeue();
        }
}