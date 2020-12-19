global	_ft_list_remove_if
extern	_free
section	.text


_ft_list_remove_if:
		push	r8
		push	r9
		push	r13
		push	r14
		push 	rcx
		; mov		r13,0
		mov		r16,rcx
		jmp		check_first

remove_first_elem:
		mov		r12,[r8 + 8]
		mov		[r9],r12
		; mov		rdi,[r8]
		; call	rcx
		mov		rdi,r8
		call	_free
		mov		rdi,r9
		jmp		check_first

remove_elem:
		mov		r12,[r8 + 8]
		mov		[r13 + 8],r12
		; mov		rdi,[r8]
		; call	rcx
		mov		rdi,r8
		call	_free
		mov		r8,r13
		jmp		while

check_first:
		; inc		r13
		; jmp end
		; cmp		r13,2
		; jz		end

		mov		r9,rdi
		mov		r8,[rdi]
		cmp		r8,0
		jz		end
		mov		rdi,[r8]

		push	rcx
		call	rdx
		pop		rcx

		cmp		rax,0
		jz		remove_first_elem
		jmp		while

while:
		mov		r13,r8
		mov		r8,[r8 + 8]
		cmp		r8,0
		jz		end
		mov		rdi,[r8]

		push	rcx
		call	rdx
		pop		rcx

		cmp		rax,0
		; jz		end

		jz		remove_elem
		jmp		while

end:
	pop		r14
	pop		r13
	pop		r9
	pop		r8
	; mov		rax,r13
	ret