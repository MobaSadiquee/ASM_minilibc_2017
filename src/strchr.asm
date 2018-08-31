	BITS 64
	GLOBAL strchr:function

	SECTION .text

strchr:
	CMP     BYTE[RDI], SIL
	JE      end
	CMP     BYTE[RDI], 0
	JE      end_null
	JMP	loop
	
loop:	
	INC     RDI
	JMP     strchr

end_null:
	MOV     RAX, 0
	RET

end:
	MOV     RAX, RDI
	RET
