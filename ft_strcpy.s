global	_ft_strcpy
extern	_ft_strlen
section .text

_ft_strcpy:
		mov		rax,rdi			;	res = dest
		mov		rcx,0			;	i = 0
		jmp		while

copy_char:
		mov		r8,[rsi + rcx]
		mov		[rax + rcx],r8	;	dest[i] = src[i]
		inc		rcx				;	i++
		jmp		while

while:
		cmp		BYTE [rsi + rcx],0
		jnz		copy_char			;	if (src[i] != 0) --> copy_char
		mov		BYTE [rax + rcx],0	;	dest[len] = '\0'
		ret