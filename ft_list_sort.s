global	_ft_list_sort
section	.text

next_elem:
		mov		r8,[r8 + 8]
		cmp		r8,0
		jz		end
		mov		r9,[r8 + 8]
		jmp		while

switch_data:
		mov		r11,[r9]
		mov		r13,[r8]

		mov		[r8],r11
		mov		[r9],r13

		mov		r9,[r9 + 8]

		jmp		while

while:
		cmp		r9,0
		jz		next_elem
		mov		rdi,[r8]
		mov		rsi,[r9]

		call	r10

		cmp		rax,0
		jg		switch_data

		mov		r9,[r9 + 8]

		jmp		while

_ft_list_sort:
		mov		r8,[rdi]
		cmp		r8,0
		jz		end
		mov		r9,[r8 + 8]

		mov		r10,rsi

		jmp		while

end:
