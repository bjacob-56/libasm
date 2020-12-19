global	_ft_list_size
section .text

list_null:
		ret

loop:
		inc		rax
		mov		rdi,[rdi + 8]
		cmp		rdi,0
		jz		end
		jmp		loop

_ft_list_size:
		mov		rax,0
		cmp		rdi,0
		jz		list_null
		mov		r8,rdi
		jmp		loop

end:
		mov		rdi,r8
		ret