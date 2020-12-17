global _ft_strlen
section .text

segfault:

inc_nb:
		inc		rax
		inc		rcx
		jmp		while

_ft_strlen:
		mov		rax,0
		mov		rcx,0
		cmp		rdi,0
		jz		segfault
		jmp		while

while:
		cmp		BYTE [rdi + rcx],0
		jnz		inc_nb
		jmp		end

end:
		ret