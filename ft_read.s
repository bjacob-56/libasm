global	_ft_read
extern ___error
section	.text

error:
		push	qword rax		; save error code
		call	___error		; put errno address in rax
		pop		qword [rax]		; *errno = error code
		mov		rax,-1			; rax = -1
		ret

_ft_read:
		mov		rax,0x2000003	; syscall for read
		syscall
		jc		error			; if read fails
		ret