	.extern aToB
	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	aToBNO
	.type	aToBNO, @function
aToBNO:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -12[rbp], 1
	mov	QWORD PTR -8[rbp], 0
	jmp	.L2
.L6:
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jle	.L3
	mov	DWORD PTR -12[rbp], 0
.L3:
	cmp	DWORD PTR -12[rbp], 0
	je	.L4
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rcx
	sub	edx, 5
	mov	DWORD PTR [rax], edx
	jmp	.L5
.L4:
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR -8[rbp]
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -40[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
.L5:
	add	QWORD PTR -8[rbp], 1
.L2:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jb	.L6
	nop
	nop
	pop	rbp
	ret
	.size	aToBNO, .-aToBNO
	.globl	random_array
	.type	random_array, @function
random_array:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L8
.L10:
	call	rand@PLT
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -8[rbp]
	add	rcx, rdx
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	esi, eax
	sar	esi, 31
	sub	edx, esi
	imul	esi, edx, 100
	sub	eax, esi
	mov	edx, eax
	mov	DWORD PTR [rcx], edx
	call	rand@PLT
	and	eax, 1
	test	eax, eax
	jne	.L9
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rcx
	neg	edx
	mov	DWORD PTR [rax], edx
.L9:
	add	DWORD PTR -12[rbp], 1
.L8:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L10
	mov	rax, QWORD PTR -8[rbp]
	leave
	ret
	.size	random_array, .-random_array
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L13
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L13:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L14
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	print_array, .-print_array
	.section	.rodata
.LC1:
	.string	"test %d\n"
	.align 8
.LC2:
	.string	"\tunoptimized function time:\t%lld\n"
	.align 8
.LC3:
	.string	"\toptimized function time:  \t%lld\n\n"
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
	sub	rsp, 72
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -112[rbp], 0
	jmp	.L16
.L24:
	mov	rax, rsp
	mov	rbx, rax
	mov	eax, DWORD PTR -112[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1125899907
	shr	rdx, 32
	sar	edx, 18
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	DWORD PTR -100[rbp], edx
	mov	edx, DWORD PTR -100[rbp]
	imul	edx, edx, 1000000
	sub	eax, edx
	mov	DWORD PTR -100[rbp], eax
	mov	eax, DWORD PTR -100[rbp]
	mov	edi, eax
	call	random_array
	mov	QWORD PTR -96[rbp], rax
	mov	eax, DWORD PTR -100[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
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
.L17:
	cmp	rsp, rdx
	je	.L18
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L17
.L18:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L19
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L19:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	DWORD PTR -108[rbp], 0
	jmp	.L20
.L21:
	mov	eax, DWORD PTR -100[rbp]
	movsx	rcx, eax
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	aToBNO
	add	DWORD PTR -108[rbp], 1
.L20:
	cmp	DWORD PTR -108[rbp], 9999
	jle	.L21
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	sub	rax, QWORD PTR -72[rbp]
	mov	rcx, rax
	movabs	rdx, 2361183241434822607
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	mov	rdx, rcx
	sar	rdx, 63
	sub	rax, rdx
	imul	rdx, rax, 1000
	mov	rax, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -72[rbp], rax
	mov	DWORD PTR -104[rbp], 0
	jmp	.L22
.L23:
	mov	eax, DWORD PTR -100[rbp]
	movsx	rcx, eax
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	aToB
	add	DWORD PTR -104[rbp], 1
.L22:
	cmp	DWORD PTR -104[rbp], 9999
	jle	.L23
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	sub	rax, QWORD PTR -72[rbp]
	mov	rcx, rax
	movabs	rdx, 2361183241434822607
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	mov	rdx, rcx
	sar	rdx, 63
	sub	rax, rdx
	imul	rdx, rax, 1000
	mov	rax, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rsp, rbx
	add	DWORD PTR -112[rbp], 1
.L16:
	cmp	DWORD PTR -112[rbp], 9
	jle	.L24
	mov	eax, 0
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
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
