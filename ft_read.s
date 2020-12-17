global	_ft_read
extern ___error
section	.text

erreur:
		push	rax
		call	___error
		pop		qword [rax]
		mov		rax,-1
		ret

_ft_read:
		mov		rax,0x2000003
		syscall
		jc		erreur
		ret