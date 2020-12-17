global	_ft_write
extern ___error
section	.text

erreur:
		push	rax
		call	___error
		pop		qword [rax]
		mov		rax,-1
		ret

_ft_write:
		mov		rax,0x2000004
		syscall
		jc		erreur
		ret