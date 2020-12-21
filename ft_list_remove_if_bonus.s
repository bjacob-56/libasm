global	_ft_list_remove_if
extern	_free
section	.text

	; rdi = **begin_list
	; rsi = void *data_ref
	; rdx = int (*cmp)()
	; rcx = void (*free_fct)(void *)

_ft_list_remove_if:
		sub		rsp,8				; align stack
		push	r12
		push	r13
		push	r14

		jmp		check_first

check_first:
		mov		r13,rdi				; r13 = begin_list
		mov		r12,[rdi]			; r12 = *begin_list
		cmp		r12,0
		jz		end					; if(!(*begin_list)) --> exit
		mov		rdi,[r12]			; rdi = (*begin_list)->data

		push	rdi					; save registers before call
		push	rsi
		push	rdx
		push	rcx
		call	rdx
		pop		rcx					; get registers back after call
		pop		rdx
		pop		rsi
		pop		rdi

		cmp		rax,0
		jz		remove_first_elem	; if (cmp(*begin_list->data, data_ref) == 0)
		jmp		while

remove_first_elem:
		mov		r8,[r12 + 8]
		mov		[r13],r8			; *begin_list = (*begin_list)->next

		push	rsi
		push	rdx
		push	rcx
		mov		rdi,[r12]
		call	rcx					; free_data(*old_begin_list)
		mov		rdi,r12
		call	_free				; free(*old_begin_list)
		pop		rcx
		pop		rdx
		pop		rsi

		mov		rdi,r13
		jmp		check_first

remove_elem:
		mov		r8,[r12 + 8]
		mov		[r14 + 8],r8		; previous_elem->next = elem->next

		push	rsi
		push	rdx
		push	rcx
		mov		rdi,[r12]
		call	rcx					; free_data(elem)
		mov		rdi,r12
		call	_free				; free(elem)
		pop		rcx
		pop		rdx
		pop		rsi

		mov		r12,r14				; elem = previous_elem
		jmp		while

while:
		mov		r14,r12
		mov		r12,[r12 + 8]		; elem = *begin_list->next
		cmp		r12,0
		jz		end					; if (!elem) --> exit

		push	rsi
		push	rdx
		push	rcx
		mov		rdi,[r12]
		call	rdx
		pop		rcx
		pop		rdx
		pop		rsi

		cmp		rax,0

		jz		remove_elem			; if (cmp(elem->data, data_ref) == 0)
		jmp		while

end:
		pop		r14
		pop		r13
		pop		r12
		add		rsp,8				; realign stack
		ret