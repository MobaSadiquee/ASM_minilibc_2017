	BITS 64
	GLOBAL strcasecmp:function

	SECTION .text

strcasecmp:
	MOV	R8B, byte[rdi]	;recup av1 et av2;
	MOV 	R9B, byte[rsi]
	
func:
	CMP	R8B, 65		;si R8B < 'A' 
	JL 	minus		; go to minus 
	CMP 	R8B, 90		;si R8B > 'Z' 
	JG 	minus		; go to minus
	ADD 	R8B, 32		; sinon R8B +=32 (minuscule) 

minus:
	CMP 	R9B, 65		; si R9B < 'A'
	JL 	maj
	CMP 	R9B, 90		; si R9B > 'Z'  
	JG 	maj
	ADD 	R9B, 32		; sinon R9B+=32 

maj:
	CMP 	byte[rdi], 0	; strcmp classique 
	JZ 	end		; compare arg1 à NULL
	CMP 	byte[rsi], 0
	JZ 	end

	CMP	R8B, R9B
	JNZ 	end		; si == 0 return end
	JMP 	loop

loop:				; ++ func;
	INC 	rdi
	INC 	rsi
	JMP 	func

end:
	MOVZX 	eax, R8B
	MOVZX 	ecx, R9B
	SUB 	eax, ecx
	RET

end_null:
	MOV     eax, 0		;return null;
	RET
