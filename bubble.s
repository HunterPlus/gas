/*
#include <stdio.h>
void swap (int *x, int *y) { int t = *x; *x = *y; *y = t; }
void bubble(int v[], int n)
{
	int i, j;
	
	for (j = n - 1; j > 0; j--) 
        	for (i = 0; i < j; i++)
			if (v[i] > v[i + 1])
				swap(&v[i], &v[i + 1]);
}

int main()
{
    int arr[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arr)/sizeof(arr[0]);
    bubble(arr, n);
    printf("Sorted array: \n");
    printArray(arr, n);

    return 0;
}
*/
