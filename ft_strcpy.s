global	_ft_strcpy
extern	_ft_strlen
section .text

copy_char:
		mov		r9,[rsi + rcx]
		mov		[rax + rcx],r9
		inc		rcx
		jmp		while

_ft_strcpy:
		push	rdi
		mov		rdi,rsi
		call	_ft_strlen
		mov		r8,rax
		pop		rax
		mov		rcx,0
		jmp		while

while:
		cmp		rcx,r8
		jb		copy_char
		mov		BYTE [rax + rcx],0
		ret

; copy_char:
; 		mov		r8,[rsi + rcx]
; 		mov		[rax + rcx],r8
; 		inc		rcx
; 		jmp		while

; _ft_strcpy:
; 		mov		rax,rdi
; 		mov		rcx,0
; 		jmp		while

; while:
; 		cmp		BYTE [rsi + rcx],0
; 		jnz		copy_char
; 		mov		BYTE [rax + rcx],0
; 		ret