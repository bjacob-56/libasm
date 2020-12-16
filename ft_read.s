global	_ft_read
section	.text

errno:

_ft_read:
		mov		rax,0
		xor		rdi,rdi
		xor		rsi,rsi
		xor		rdx,rdx
		syscall
		; cmp		rax,0
		; jz		errno
		ret