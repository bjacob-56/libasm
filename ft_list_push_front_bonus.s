global	_ft_list_push_front
extern	_malloc
section	.text

_ft_list_push_front:
		push	qword rdi
		push	qword rsi
		mov		rdi,16			; size of t_list
		call	_malloc			; lst = malloc(16)
		cmp		rax,0
		jz		err_malloc		; if malloc failed
		pop		qword [rax]		; lst->data = data
		pop		qword rdi		; rdi = begin_list
		mov		r8,[rdi]
		mov		[rax + 8],r8	; lst->next = *begin_list
		mov		[rdi],rax		; *begin_list = lst

err_malloc:
		ret