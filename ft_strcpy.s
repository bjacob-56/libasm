global _ft_strcpy
section .text

copy_char:
		mov		R8,[rsi + rcx]
		mov		[rax + rcx],R8
		inc		rcx
		jmp		while

_ft_strcpy:
		mov		rax,rdi
		mov		rcx,0
		jmp		while

while:
		cmp		BYTE [rsi + rcx],0
		jnz		copy_char
		mov		BYTE [rax + rcx],0
		ret