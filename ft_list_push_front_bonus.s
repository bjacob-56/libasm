global	_ft_list_push_front
extern	_malloc
section	.text

_ft_list_push_front:
		sub		rsp,8			; align stack

		push	rdi
		push	rsi

		mov		rdi,16			; size of t_list
		call	_malloc			; lst = malloc(16)

		pop rsi
		pop		rdi
		cmp		rax,0
		jz		err_malloc		; if malloc failed
		
		mov		[rax],rsi
		mov		r8,[rdi]
		mov		[rax + 8],r8	; lst->next = *begin_list
		mov		[rdi],rax		; *begin_list = lst

err_malloc:
		add		rsp,8			; realign stack
		ret
