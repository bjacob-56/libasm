global	_ft_list_size
section .text

_ft_list_size:
		mov		rax,0			; res = 0
		cmp		rdi,0
		jz		list_null		; if(!begin_list) --> ret 0
		mov		r8,rdi
		jmp		while

while:
		inc		rax				; res++
		mov		r8,[r8 + 8]		; lst = lst->next
		cmp		r8,0
		jz		end				; if(!lst) --> ret
		jmp		while

list_null:
		ret

end:
		; mov		rdi,r8
		ret