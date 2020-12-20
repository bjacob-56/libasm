global	_ft_strdup
extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy
section	.text

_ft_strdup:
		push	qword rdi
		push	qword rsi

		call	_ft_strlen	; rax = ft_strlen(src)
		inc		rax			; rax++

		push	rdi

		mov		rdi,rax
		call	_malloc		; dest = malloc(ft_strlen(src) + 1)
		cmp		rax,0
		jz		err_malloc	; if malloc failed --> ret

		pop		rsi			; rsi = src

		mov		rdi,rax		; rdi = dest
		call	_ft_strcpy	; ft_strcpy(dest, src)

		pop		qword rsi
		pop		qword rdi
		ret

err_malloc:
		pop		rdi
		pop		rsi
		pop		rdi
		ret