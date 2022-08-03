/*
int binsearch(int arr[], int n, int key)
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
# %rdi - int *arr
# %esi - int n -> high
# %edx - int key
# %ecx - int low
# %eax - mid -> return index

	.data
	.text
	.globl binsearch
binsearch:
	push	%rbp
	mov	%rsp, %rbp
	
	xor	%ecx, %ecx		# low = 0
	dec	%esi			# high = n - 1
while:
	cmp	%esi, %ecx
	jg	notfound
	mov	%ecx, %eax
	add	%esi, %eax
	shr	$1, %eax		# mid = (low + high) / 2
	cltq
	cmp	(%rdi, %rax, 4), %edx
	je	end			# key found
	jg	right
	mov	%eax, %esi
	dec	%esi
	jmp	while
right:
	mov	%eax, %ecx
	dec	%ecx
	jmp 	while
	
notfound:
	mov	$-1, %eax		# return -1
end:
	mov	%rbp, %rsp
	pop	%rbp
	ret
	
