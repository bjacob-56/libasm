global	_ft_strcmp
section .text

_ft_strcmp:
		mov		rax,0				; res = 0
		mov		r8,0				; i = 0
		jmp		while

while:
		cmp		BYTE [rdi + r8],0
		jz		end					; if(s1[i] == 0) --> end
		cmp		BYTE [rsi + r8],0
		jz		end					; if(s2[i] == 0) --> end
		movzx	r9,BYTE [rdi + r8]
		movzx	r10,BYTE [rsi + r8]
		cmp		r9,r10				; if(s1[i] != s2[i]) --> end
		jnz		end
		inc		r8					; else --> i++
		jmp		while

above:
		mov		rax,1
		ret

below:
		mov		rax,-1
		ret

end:
		movzx	r9,BYTE [rdi + r8]
		movzx	r10,BYTE [rsi + r8]
		cmp		r9,r10
		ja		above				; if (s1[i] > s2[i]) / unsigned
		jb		below				; if (s1[i] < s2[i]) / unsigned
		ret