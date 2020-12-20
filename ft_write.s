global	_ft_write
extern ___error
section	.text

error:
		push	qword rax		; save error code
		call	___error		; put errno address in rax
		pop		qword [rax]		; *errno = error code
		mov		rax,-1			; rax = -1
		ret

_ft_write:
		mov		rax,0x2000004	; syscall for write
		syscall
		jc		error			; if write fails
		ret