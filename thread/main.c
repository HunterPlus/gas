/* 
int pthread_create(pthread_t *restrict thread,
                        const pthread_attr_t *restrict attr,
                        void *(*start_routine)(void *),
                        void *restrict arg);

int pthread_detach(pthread_t thread);
int pthread_join(pthread_t thread, void **retval);
*/
#include <pthread.h>

void Pthread_create(pthread_t *thread, pthread_attr_t *attr, void *(*start)(void *), void *arg);
void *hello(void *arg);

int main()
{
        int     i;
        pthread_t tid[3];
        long    arg[3] = { 0, 1, 2};
        
        for (i = 0; i < 3; i++) 
                Pthread_create(&tid[i], NULL, hello, (void *)arg[i]);
        for (i = 0; i < 3; i++)
                pthread_join(tid[i], NULL);
        return 0;
}

