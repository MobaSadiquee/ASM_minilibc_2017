	BITS 64
	GLOBAL rindex:function

	SECTION .text

rindex:	
	MOV 	rax, 0

func:
	CMP     BYTE[RDI], SIL
	JE      found

	CMP     BYTE[RDI], 0
	JE      end
	JMP	loop

found:
	MOV     RAX, RDI
	CMP     BYTE[RDI], 0
	JE      end
	JMP	loop

loop:
	INC     RDI
	JMP     func

end:
	RET
