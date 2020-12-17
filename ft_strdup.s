global	_ft_strdup
extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy
section	.text

err_malloc:
		ret

_ft_strdup:
		call	_ft_strlen
		inc		rax
		push	rdi
		mov		rdi,rax
		call	_malloc
		cmp		rax,0
		jz		err_malloc
		pop		rsi
		mov		rdi,rax
		call	_ft_strcpy
		ret
