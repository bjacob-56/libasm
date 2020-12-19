global	_ft_atoi_base
extern	_ft_strlen
section	.text

_ft_atoi_base:
		mov		r15,rdi
		jmp		check_base_len

check_base_len:
		mov		rdi,rsi
		call	_ft_strlen
		cmp		rax,2
		jl		wrong_base_len
		mov		r12,rax	;	base length
		mov		rcx,-1	; compteur 1
		mov		rax,0
		jmp		check_base_char

check_base_char:
		mov		r11,0	; compteur 2
		inc		rcx
		cmp		BYTE [rsi + rcx],0
		jz		check_white_space
		mov		r8,1
		movzx	r9, BYTE [rsi + rcx]
		jmp		check_base_tail


check_base_tail:
		mov		r14,rcx
		add		r14,r8
		cmp		BYTE [rsi + r14],0
		jz		check_base_char
		movzx	r10, BYTE [rsi + r14]
		cmp		r9,r10
		jz		end
		inc		r8
		jmp		check_base_tail

check_white_space:
		cmp		BYTE [rsi + r11],0
		jz		base_ok
		movzx	r9, BYTE [rsi + r11]
		jmp		is_white_space_base

is_white_space_base:
		cmp		r9,32
		jz		end
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
		jmp		is_sign_base

is_sign_base:
		cmp		r9,43
		jz		end
		cmp		r9,45
		jz		end
		inc		r11
		jmp		check_white_space



base_ok:
		mov		rcx,-1
		mov		rax,0
		mov		r13,1	; signe
		mov		rdi,r15
		cmp		rdi,0
		jz		end
		jmp		skip_white_space
		jmp		while

skip_white_space:
		inc		rcx
		movzx	r9, BYTE [rdi + rcx]
		cmp		r9,32
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
		dec		rcx
		jmp		find_sign

find_sign:
		inc		rcx
		movzx	r9, BYTE [rdi + rcx]
		cmp		r9,43	; signe +
		jz		find_sign
		cmp		r9,45	; signe -
		jz		minus_sign
		dec		rcx
		jmp		while

minus_sign:
		imul	r13,-1
		jmp		find_sign

find_place_base:
		cmp		BYTE [rsi + r11],0
		jz		end
		movzx	r10, BYTE [rsi + r11]
		cmp		r9,r10
		jz		add_char
		inc		r11
		jmp		find_place_base

add_char:
		imul	r11,r13	;	r13 signe
		imul	rax,r12
		add		rax,r11
		jmp		while

while:
		inc		rcx
		movzx	r9, BYTE [rdi + rcx]	; char de str a verifier
		mov		r11,0	; compteur 2
		jmp		find_place_base

wrong_base_len:
		mov		rax,0
		ret

end:
		ret