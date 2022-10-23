	.extern aToB
	.file	"main.c"
	.intel_syntax noprefix
	.section	.rodata
	.align 8
.LC0:
	.string	"The size of the array should be from 0 to 10000"
	.text
	.globl	check_len
	.type	check_len, @function
check_len:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	cmp	DWORD PTR -4[rbp], 0
	js	.L8
	cmp	DWORD PTR -4[rbp], 10000
	jle	.L10
.L8:
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, -1
	call	exit@PLT
.L10:
	nop
	leave
	ret
	.size	check_len, .-check_len
	.section	.rodata
.LC1:
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
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L13
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	print_array, .-print_array
	.section	.rodata
.LC2:
	.string	"r"
.LC3:
	.string	"%d"
.LC4:
	.string	"w"
.LC5:
	.string	"Size: %d\n"
	.align 8
.LC6:
	.string	"the result is written to a file \"%s\"\n"
	.text
	.globl	file_input
	.type	file_input, @function
file_input:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 136
	mov	QWORD PTR -136[rbp], rdi
	mov	QWORD PTR -144[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	mov	rax, QWORD PTR -136[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -104[rbp], rax
	lea	rdx, -116[rbp]
	mov	rax, QWORD PTR -104[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -116[rbp]
	mov	edi, eax
	call	check_len
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
.L15:
	cmp	rsp, rdx
	je	.L16
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L15
.L16:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L17
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L17:
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
.L18:
	cmp	rsp, rdx
	je	.L19
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L18
.L19:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L20
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L20:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -72[rbp], rax
	mov	DWORD PTR -112[rbp], 0
	jmp	.L21
.L22:
	mov	eax, DWORD PTR -112[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -88[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -104[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -112[rbp], 1
.L21:
	mov	eax, DWORD PTR -116[rbp]
	cmp	DWORD PTR -112[rbp], eax
	jl	.L22
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
	lea	rdx, .LC4[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -64[rbp], rax
	mov	edx, DWORD PTR -116[rbp]
	mov	rax, QWORD PTR -64[rbp]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	DWORD PTR -108[rbp], 0
	jmp	.L23
.L24:
	mov	rax, QWORD PTR -72[rbp]
	mov	edx, DWORD PTR -108[rbp]
	mov	edx, DWORD PTR [rax+rdx*4]
	mov	rax, QWORD PTR -64[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -108[rbp], 1
.L23:
	mov	eax, DWORD PTR -116[rbp]
	cmp	DWORD PTR -108[rbp], eax
	jb	.L24
	mov	rax, QWORD PTR -64[rbp]
	mov	rsi, rax
	mov	edi, 10
	call	fputc@PLT
	mov	rax, QWORD PTR -144[rbp]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -64[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rsp, rbx
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	file_input, .-file_input
	.section	.rodata
.LC7:
	.string	"Enter n: "
.LC8:
	.string	"%ud"
.LC9:
	.string	"Enter array a:"
.LC10:
	.string	"Array b:"
	.text
	.globl	def_input
	.type	def_input, @function
def_input:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -96[rbp]
	mov	rsi, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -96[rbp]
	mov	edi, eax
	call	check_len
	mov	eax, DWORD PTR -96[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -112[rbp], rdx
	mov	QWORD PTR -104[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
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
.L27:
	cmp	rsp, rdx
	je	.L28
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L27
.L28:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L29
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L29:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -96[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
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
.L30:
	cmp	rsp, rdx
	je	.L31
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L30
.L31:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L32
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L32:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -92[rbp], 0
	jmp	.L33
.L34:
	mov	eax, DWORD PTR -92[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -80[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -92[rbp], 1
.L33:
	mov	eax, DWORD PTR -96[rbp]
	cmp	DWORD PTR -92[rbp], eax
	jb	.L34
	mov	eax, DWORD PTR -96[rbp]
	movsx	rcx, eax
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	aToB
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edx, DWORD PTR -96[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	print_array
	mov	rsp, rbx
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L35
	call	__stack_chk_fail@PLT
.L35:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	def_input, .-def_input
	.globl	arg_input
	.type	arg_input, @function
arg_input:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 104
	mov	DWORD PTR -100[rbp], edi
	mov	QWORD PTR -112[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	mov	eax, DWORD PTR -100[rbp]
	sub	eax, 1
	mov	edi, eax
	call	check_len
	mov	eax, DWORD PTR -100[rbp]
	sub	eax, 1
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -144[rbp], rdx
	mov	QWORD PTR -136[rbp], 0
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
.L37:
	cmp	rsp, rdx
	je	.L38
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L37
.L38:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L39
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L39:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -100[rbp]
	sub	eax, 1
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
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
.L40:
	cmp	rsp, rdx
	je	.L41
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L40
.L41:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L42
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L42:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax
	mov	DWORD PTR -92[rbp], 1
	jmp	.L43
.L44:
	mov	eax, DWORD PTR -92[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -112[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atof@PLT
	mov	eax, DWORD PTR -92[rbp]
	lea	edx, -1[rax]
	cvttsd2si	ecx, xmm0
	mov	rax, QWORD PTR -80[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], ecx
	add	DWORD PTR -92[rbp], 1
.L43:
	mov	eax, DWORD PTR -92[rbp]
	cmp	eax, DWORD PTR -100[rbp]
	jl	.L44
	mov	eax, DWORD PTR -100[rbp]
	sub	eax, 1
	movsx	rcx, eax
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	aToB
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, DWORD PTR -100[rbp]
	lea	edx, -1[rax]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	print_array
	mov	rsp, rbx
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	arg_input, .-arg_input
	.section	.rodata
.LC11:
	.string	"Array a:"
	.text
	.globl	random_input
	.type	random_input, @function
random_input:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 104
	mov	DWORD PTR -100[rbp], edi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	mov	eax, DWORD PTR -100[rbp]
	mov	edi, eax
	call	check_len
	mov	eax, DWORD PTR -100[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -144[rbp], rdx
	mov	QWORD PTR -136[rbp], 0
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
.L47:
	cmp	rsp, rdx
	je	.L48
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L47
.L48:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L49
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L49:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -100[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
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
.L50:
	cmp	rsp, rdx
	je	.L51
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L50
.L51:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L52
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L52:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax
	mov	DWORD PTR -92[rbp], 0
	jmp	.L53
.L55:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	mov	rax, QWORD PTR -80[rbp]
	mov	ecx, DWORD PTR -92[rbp]
	movsx	rcx, ecx
	mov	DWORD PTR [rax+rcx*4], edx
	call	rand@PLT
	and	eax, 1
	test	eax, eax
	jne	.L54
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -92[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	neg	eax
	mov	ecx, eax
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -92[rbp]
	movsx	rdx, edx
	mov	DWORD PTR [rax+rdx*4], ecx
.L54:
	add	DWORD PTR -92[rbp], 1
.L53:
	mov	eax, DWORD PTR -92[rbp]
	cmp	eax, DWORD PTR -100[rbp]
	jl	.L55
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edx, DWORD PTR -100[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	print_array
	mov	eax, DWORD PTR -100[rbp]
	movsx	rcx, eax
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	aToB
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edx, DWORD PTR -100[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	print_array
	mov	rsp, rbx
	nop
	mov	rax, QWORD PTR -56[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L56
	call	__stack_chk_fail@PLT
.L56:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	random_input, .-random_input
	.section	.rodata
.LC12:
	.string	"-h"
.LC13:
	.string	"--help"
	.align 8
.LC14:
	.string	"keys:\n-h (--help)  - displays a list of keys\n-r [int] (--random [int])  - sets a random data set. \n-f [string] [string] (--file [string] [string])  - the program works with files entered by the following two arguments"
.LC15:
	.string	"-r"
.LC16:
	.string	"--random"
.LC17:
	.string	"-f"
.LC18:
	.string	"--file"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	mov	QWORD PTR -16[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	DWORD PTR -4[rbp], 1
	jne	.L58
	mov	eax, 0
	call	def_input
	jmp	.L59
.L58:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L60
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L61
.L60:
	lea	rax, .LC14[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L59
.L61:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC15[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L62
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC16[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L63
.L62:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atof@PLT
	cvttsd2si	eax, xmm0
	mov	edi, eax
	call	random_input
	jmp	.L59
.L63:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC17[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	je	.L64
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC18[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L65
.L64:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 24
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	file_input
	jmp	.L59
.L65:
	mov	rdx, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	arg_input
.L59:
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
