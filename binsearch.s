/*
int binsearch(int key, int arr[], int n)
{
        int     low, high, mid;
        
        low = 0;
        high = n - 1;
	while (low <= high) {
		mid = (low + high) / 2;
		if (arr[mid] == key)
			return mid;
		if (arr[mid] < key)
			low = mid + 1;
		else
			high = mid - 1;
	}
	return -1;
}
*/

	.data
	.text
	.globl binsearch
binsearch:
	push	%rbp
	mov	%rsp, %rbp
	
	
	mov	%rbp, %rsp
	pop	%rbp
	ret
	
