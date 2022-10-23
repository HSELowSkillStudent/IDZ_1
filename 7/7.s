	.extern aToB
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%d"
.LC2:
	.string	"w"
.LC3:
	.string	"Size: %d\n"
.LC4:
	.string	"%d "
	.align 8
.LC5:
	.string	"the result is written to a file \"%s\"\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 136
	mov	DWORD PTR -132[rbp], edi
	mov	QWORD PTR -144[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	
	mov	rax, QWORD PTR -144[rbp]	# argv[0]
	add	rax, 8				# argv[1] - имя входного файла
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC0[rip]			# "r"
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT			# fopen(argv[1], "r");
	mov	QWORD PTR -104[rbp], rax	# input_file = fopen(argv[1], "r");
	
	lea	rdx, -116[rbp]
	mov	rax, QWORD PTR -104[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	
	mov	eax, DWORD PTR -116[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -96[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -160[rbp], rdx
	mov	QWORD PTR -152[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -176[rbp], rdx
	mov	QWORD PTR -168[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L8:
	cmp	rsp, rdx
	je	.L9
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L8
.L9:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L10
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L10:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -88[rbp], rax
	mov	eax, DWORD PTR -116[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -80[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	mov	rcx, rax
	and	rcx, -4096
	mov	rdx, rsp
	sub	rdx, rcx
.L11:
	cmp	rsp, rdx
	je	.L12
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L11
.L12:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L13
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L13:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -72[rbp], rax
	mov	DWORD PTR -112[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -112[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -88[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -104[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -112[rbp], 1
.L14:
	mov	eax, DWORD PTR -116[rbp]
	cmp	DWORD PTR -112[rbp], eax
	jl	.L15
	mov	rax, QWORD PTR -104[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, DWORD PTR -116[rbp]
	movsx	rcx, eax
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -88[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	aToB
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	edx, DWORD PTR -116[rbp]
	mov	rax, QWORD PTR -64[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	DWORD PTR -108[rbp], 0
	jmp	.L16
.L17:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -108[rbp]
	mov	edx, DWORD PTR [rax+rdx*4]
	mov	rax, QWORD PTR -64[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -108[rbp], 1
.L16:
	mov	eax, DWORD PTR -116[rbp]
	cmp	DWORD PTR -108[rbp], eax
	jb	.L17
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	mov	rax, QWORD PTR -144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	mov	rsp, rbx
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
