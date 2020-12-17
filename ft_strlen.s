global _ft_strlen
section .text

inc_nb:
		inc		rax
		inc		rcx
		jmp		while

_ft_strlen:
		mov		rax,0
		mov		rcx,0
		jmp		while

while:
		cmp		BYTE [rdi + rcx],0
		jnz		inc_nb
		ret
