global	_ft_write
extern ___error
section	.text

errno:
		; a ajouter

_ft_write:
		mov		rax,0x2000004
		syscall
		cmp		rax,0
		jz		errno
		ret