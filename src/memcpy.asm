	BITS 64
	GLOBAL memcpy:function

	SECTION .text

memcpy:
	MOV     RCX, 0

func:
	CMP    	RCX, RDX
	JE     	end		;if RCX cmp RDX == 0 return
	MOV    	R10B, byte[RSI + RCX]
	MOV	byte[RDI + RCX], R10B
	JMP	loop		;jump to the loop function

loop:				;++ function that jump to func
	INC    	RCX
	JMP	func

end:
	MOV     RAX, RDI	;return RDI with RAX
	RET
