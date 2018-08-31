        BITS 64
	GLOBAL strlen:function

	SECTION .text

strlen:
        MOV rax, 0		;RAX = registre general, rax = 0;

loop:
	MOV cl,byte[rdi]	;Cl = byte de rdi;
	CMP cl, 0		;Compare cl, si 0 inc sinon end;
	JNZ inc
	JMP end

inc:
	INC rax			;Incrémentation rax et rdi;
	INC rdi
	JMP loop		;Jump sur loop;
end:
	RET
