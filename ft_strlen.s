global _ft_strlen
section .text

_ft_strlen:
		mov		rax,0				;	res = 0
		mov		rcx,0				;	i = 0
		jmp		while

while:
		cmp		BYTE [rdi + rcx],0
		jz		end					;	if (str[i] == 0) --> ret
		inc		rax					;	res++
		inc		rcx					;	i++
		jmp		while

end:
		ret