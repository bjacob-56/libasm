global	_ft_list_sort
section	.text

	; rdi = **begin_list
	; rsi = int (*cmp)()

_ft_list_sort:
		sub		rsp,8			; align stack

		mov		r8,[rdi]		; r8 = *begin_list
		cmp		r8,0
		jz		end				; if(!(*begin_list)) --> exit
		mov		r9,[r8 + 8]		; r9 = r8->next
		mov		r10,rsi			; r10 = cmp
		jmp		while

while:
		cmp		r9,0
		jz		next_elem		; if(!r9) --> next_elem
		mov		rdi,[r8]		; rdi = r8->data
		mov		rsi,[r9]		; rsi = r9->data

		push	r8				; save r8, r9, r10
		push	r9
		push	r10
		call	r10				; call cmp
		pop		r10				; get back r8, r9, r10
		pop		r9
		pop		r8

		cmp		rax,0
		jg		switch_data		; if(cmp(r8->data, r9->data) > 0) --> switch data
		mov		r9,[r9 + 8]		; else r9 = r9->next
		jmp		while

next_elem:
		mov		r8,[r8 + 8]		; r8 = r8->next
		cmp		r8,0
		jz		end				; if(!r8) --> exit
		mov		r9,[r8 + 8]		; else r9 = r8->next
		jmp		while

switch_data:
		mov		r11,[r9]
		mov		rcx,[r8]
		mov		[r8],r11		; r8->data = r9->data
		mov		[r9],rcx		; r9->data = r8->data

		mov		r9,[r9 + 8]		; r9 = r9->next
		jmp		while

end:		
		add		rsp,8			; realign stack
		ret