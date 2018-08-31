	BITS 64
	GLOBAL strncmp:function

	SECTION .text
	
strncmp:
	CMP 	byte[rdi], 0 	; compare arg1 à NULL
	JZ 	end  		; si == 1; return

	CMP 	byte[rsi], 0 	; compare arg2 à NULL
	JZ	end  		; si == 1; return

	MOV 	cl, byte[rdi]
	CMP 	cl, byte[rsi] 	; compare byte[av1] et byte[av2]
	JNZ 	end		; si == 0 return end

	DEC 	rdx
	JZ 	end

	JMP	loop

loop:	
	INC 	rdi         	; rdi++
	INC 	rsi		; rsi++
	JMP 	strncmp     	; loop

end:
	MOVZX 	ecx, byte[rsi] 	; extension avec des 0 dans ecx
	MOVZX 	eax, byte[rdi] 	; extension avec des 0 dans eax
	SUB 	eax, ecx 	; eax = eax - ecx
	RET
