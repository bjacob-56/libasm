global	_ft_read
extern ___error
section	.text

errno:
	; __errno_location
_ft_read:
		mov		rax,0x2000003
		syscall
		cmp		rax,0
		jz		errno
		ret