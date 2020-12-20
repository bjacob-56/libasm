global	_ft_atoi_base
extern	_ft_strlen
section	.text

_ft_atoi_base:
		push	r12						; save r12
		push	r13						; save r13
		push	r14						; save r14
		mov		r12,rdi
		jmp		check_base_len

check_base_len:
		mov		rdi,rsi
		call	_ft_strlen
		cmp		rax,2
		jl		wrong_base_len			; if(strlen(base) < 2) --> ret 0
		mov		rdx,rax					; rdx = strlen(base)
		mov		rcx,-1					; i = -1
		mov		rax,0
		jmp		check_base_char

check_base_char:
		mov		r11,0					; k = 0 --> count to check white spaces afterward
		inc		rcx						; i++
		cmp		BYTE [rsi + rcx],0
		jz		check_white_space		; if(str[i] == 0) --> double char OK --> check_white_space in base
		mov		r8,1					; else --> j = 1
		movzx	r9, BYTE [rsi + rcx]	; r9 = str[i]
		jmp		check_base_tail


check_base_tail:
		mov		r14,rcx
		add		r14,r8
		cmp		BYTE [rsi + r14],0
		jz		check_base_char			; if(str[i + j] == 0) --> check_base_char with i++
		movzx	r10, BYTE [rsi + r14]	; r10 = str[i + j]
		cmp		r9,r10
		jz		end						; if str[i] == srt[i + j] --> ret 0
		inc		r8						; else --> j++
		jmp		check_base_tail

check_white_space:
		cmp		BYTE [rsi + r11],0
		jz		base_ok					; if(str[k] == 0) --> base ok
		movzx	r9, BYTE [rsi + r11]	; r9 = str[k]
		jmp		is_white_space_or_sign_base

is_white_space_or_sign_base:
		cmp		r9,32
		jz		end						; if str[k] == ' ' --> ret 0
		cmp		r9,9
		jz		end
		cmp		r9,10
		jz		end
		cmp		r9,11
		jz		end
		cmp		r9,12
		jz		end
		cmp		r9,13
		jz		end
		cmp		r9,43
		jz		end
		cmp		r9,45
		jz		end
		inc		r11						; k++
		jmp		check_white_space

base_ok:
		mov		rcx,-1					; i = 0
		mov		rax,0					; res = 0
		mov		r13,1					; sign = 1
		mov		rdi,r12
		cmp		rdi,0
		jz		end
		jmp		skip_white_space
		jmp		while

skip_white_space:
		inc		rcx						; i++
		movzx	r9, BYTE [rdi + rcx]
		cmp		r9,32					; if str[k] == ' ' --> next char
		jz		skip_white_space
		cmp		r9,9
		jz		skip_white_space
		cmp		r9,10
		jz		skip_white_space
		cmp		r9,11
		jz		skip_white_space
		cmp		r9,12
		jz		skip_white_space
		cmp		r9,13
		jz		skip_white_space
		dec		rcx						; else i--
		jmp		find_sign

find_sign:
		inc		rcx						; i++
		movzx	r9, BYTE [rdi + rcx]
		cmp		r9,43
		jz		find_sign				; if str[k] == '+' --> next char
		cmp		r9,45
		jz		minus_sign				; if str[k] == '-' --> minus_sign
		dec		rcx						; else i--
		jmp		while

minus_sign:
		imul	r13,-1					; sign *= -1
		jmp		find_sign

while:
		inc		rcx						; i++
		movzx	r9, BYTE [rdi + rcx]	; r9 = str[i]
		mov		r11,0					; j = 0
		jmp		find_place_in_base

find_place_in_base:
		cmp		BYTE [rsi + r11],0
		jz		end						; if(base[j] == 0) --> ret res
		movzx	r10, BYTE [rsi + r11]
		cmp		r9,r10
		jz		add_char				; if(str[i] == base[j]) --> add char
		inc		r11						; else j++
		jmp		find_place_in_base

add_char:	; formula : res = res * strlen(base) + sign * j
		imul	r11,r13					; j *= sign
		imul	rax,rdx					; res *= strlen(base)
		add		rax,r11					; res += j
		jmp		while

wrong_base_len:
		mov		rax,0
		pop		r14						; get r14 back
		pop		r13						; get r13 back
		pop		r12						; get r12 back
		ret

end:
		pop		r14						; get r14 back
		pop		r13						; get r13 back
		pop		r12						; get r12 back
		ret