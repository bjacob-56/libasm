global	_ft_strcmp
section .text

_ft_strcmp:
		mov		rax,0
		mov		rcx,0
		jmp		while

while:
		cmp		BYTE [rdi + rcx],0
		jz		end
		cmp		BYTE [rsi + rcx],0
		jz		end
		movzx	r11,BYTE [rdi + rcx]
		movzx	r12,BYTE [rsi + rcx]
		cmp		BYTE r11,r12
		jnz		end
		inc		rcx
		jmp		while

end:
		movzx	rax,BYTE [rdi + rcx]
		movzx	r12,BYTE [rsi + rcx]
		sub		BYTE rax,r12
		ret