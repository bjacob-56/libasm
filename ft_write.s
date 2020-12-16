global	_ft_write
section	.text

errno:
		; a ajouter

_ft_write:
		; mov		rdi,1
		; xor		rdi,rdi
		; xor		rsi,rsi
		; xor		rdx,rdx
		mov		rax,1
		syscall
		cmp		rax,0
		; jz		errno
		
		; mov rdi, 0
        ; mov rax, 60
        ; syscall
		ret