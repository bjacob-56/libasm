global _ft_strlen
section .text

inc_nb:
		inc		rax
		inc		rdi
		jmp		while

_ft_strlen:
		mov		rax,0
		jmp		while

while:
		cmp		BYTE [rdi],0
		jnz		inc_nb
		ret
