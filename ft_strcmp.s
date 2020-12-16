global	_ft_strcmp
section .text

inc_count:
		inc		rcx
		jmp		while

is_above:
		mov		rax,1
		jmp		done

is_below:
		mov		rax,-1
		jmp		done

_ft_strcmp:
		mov		rax,0
		mov		rcx,0
		jmp		while

while:
		mov		R8,[rdi + rcx]
		cmp		R8,[rsi + rcx]
		jz		is_end
		ja		is_above
		jb		is_below

is_end:
		cmp		BYTE [rdi + rcx],0
		jnz		inc_count
		
done:
		ret