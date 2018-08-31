	BITS 64
	GLOBAL strcmp:function

	SECTION .text

strcmp:
	MOV	RCX, 0		;RAX = registre general, rax = 0;

func:
	MOV	R8B, [RDI + RCX] ;R8B = registre 8 bit, r8b = get current byte of s1;
	MOV	R9B, [RSI + RCX] ;r9b = get current byte of s2;
	CMP	R8B, R9B	 ;Compare s1 avec s2;
	JNE	end		 ;If not equal jump end;
	CMP	R9B, 0		 ;Compare s2 a null;
	JE	end_null	 ;si oui return null sinon ++;
	JMP	loop

loop:	
	INC	RCX
	JMP	func

end:
	SUB	R8B, R9B
	MOVSX	RAX, R8B
	RET

end_null:
	MOV	RAX, 0		;return NULL;
	RET
