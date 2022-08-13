#include <stdio.h>

static void *buf[BUFSIZ];               /* BUFSIZ * 8 bytes */
static int front, rear, size;

void enqueue(void *x)
{
        if (size == BUFSIZ)
                return;
        buf[rear] = x;
        rear = (rear + 1) % BUFSIZ;
        size++;
}

void *dequeue()
{
        void    *x;

        if (size == 0)
                return NULL;
        x = buf[front];
        front = (front + 1) % BUFSIZ;
        size--;
        return x;
}