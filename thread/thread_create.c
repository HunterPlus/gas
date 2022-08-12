#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void Pthread_create(pthread_t *thread, pthread_attr_t *attr, void *(*start)(void *), void *arg)
{
	if (pthread_create(thread, attr, start, arg) != 0) {
		fprintf(stderr, "thread create error.\n");
		exit(1);
	}
}
