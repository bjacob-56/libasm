global	_ft_strcmp
section .text

_ft_strcmp:
		push	r15
		push	r11
		push	r12

		mov		rax,0
		mov		r15,0
		jmp		while

while:
		cmp		BYTE [rdi + r15],0
		jz		end
		cmp		BYTE [rsi + r15],0
		jz		end
		movzx	r11,BYTE [rdi + r15]
		movzx	r12,BYTE [rsi + r15]
		cmp		r11,r12
		jnz		end
		inc		r15
		jmp		while

end:
		movzx	rax,BYTE [rdi + r15]
		movzx	r12,BYTE [rsi + r15]
		sub		rax,r12
		
		pop		r12
		pop		r11
		pop		r15
		ret