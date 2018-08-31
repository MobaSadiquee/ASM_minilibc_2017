	BITS 64
	GLOBAL memset:function

	SECTION .text

memset:
	MOV	RCX, 0			;Registre init = 0

func:
	CMP	RDX, RCX		;si rdx (3eme param) vaut 0
	JE	end			;jump end
	MOV	BYTE[RDI + RCX], SIL
	JMP	loop		     	;inc fonction
	
loop:	
        INC     RCX
	JMP     func
	
end:
	MOV	RAX, RDI		;return
	RET
