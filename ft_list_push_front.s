global	_ft_list_push_front
extern	_malloc
section	.text

err_malloc:
		ret

_ft_list_push_front:
		push	rdi
		push	rsi
		mov		rdi,16
		call	_malloc
		cmp		rax,0
		jz		err_malloc
		pop		qword [rax]
		pop		rdi
		mov		r8,[rdi]
		mov		[rax + 8],r8
		mov		[rdi],rax