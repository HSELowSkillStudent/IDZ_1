	.file	"6.1.c"
	.intel_syntax noprefix
	.text
	.globl	aToB
	.type	aToB, @function
aToB:						# void aToB(const int *a, size_t size, int *result)
	push	rbp
	mov	rbp, rsp
	push	r12
	push	r13
	push	r14
	
	
	# mov	QWORD PTR -24[rbp], rdi		# replaced by rdi (const int *a)
	# mov	QWORD PTR -32[rbp], rsi		# replaced by rsi (size_t size)
	# mov	QWORD PTR -40[rbp], rdx		# replaced by r14 (int *result)
	mov	r14, rdx
	
	
	# mov	DWORD PTR -12[rbp], 1		# replaced by r13 (int flag = 1)
	mov	r13, 1
	
	
	# mov	QWORD PTR -8[rbp], 0		# replaced by r12 (size_t i)
	mov	r12, 0				# size_t i = 0
	
	jmp	.L2
.L6:
	# mov	rax, QWORD PTR -8[rbp]		# replaced by r12
	lea	rdx, 0[0+r12*4]
	
	# mov	rax, QWORD PTR -24[rbp]		# replaced by rdi
	mov	rax, rdi
	
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jle	.L3				# if(a[i] <= 0) goto .L3
	# mov	DWORD PTR -12[rbp], 0		# replaced by r13 (flag = 0)
	mov	r13, 0
.L3:
	# cmp	DWORD PTR -12[rbp], 0		# replaced by r13
	cmp	r13, 0
	je	.L4				# flag == 0 ?
						# if (flag)
	# mov	rax, QWORD PTR -8[rbp]		# replaced by r12
	lea	rdx, 0[0+r12*4]
	
	# mov	rax, QWORD PTR -24[rbp]		# replaced by rdi
	mov	rax, rdi
	
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	
	# mov	rax, QWORD PTR -8[rbp]		# replaced by r12
	lea	rcx, 0[0+r12*4]
	
	# mov	rax, QWORD PTR -40[rbp]		# replaced by r14
	mov	rax, r14
	
	add	rax, rcx
	sub	edx, 5
	mov	DWORD PTR [rax], edx		# result[i] = a[i] - 5
	jmp	.L5
.L4:						# else
	
	# mov	rax, QWORD PTR -8[rbp]		# replaced by r12
	lea	rdx, 0[0+r12*4]
	
	# mov	rax, QWORD PTR -24[rbp]		# replaced by rdi
	mov	rax, rdi
	
	add	rax, rdx
	
	# mov	rdx, QWORD PTR -8[rbp]		# replaced by r12
	lea	rcx, 0[0+r12*4]
	
	# mov	rdx, QWORD PTR -40[rbp]		# replaced by r14
	mov	rdx, r14
	
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax		# result[i] = a[i]
.L5:
	# add	QWORD PTR -8[rbp], 1		# replaced by r12
	add	r12, 1				# i++		
.L2:
	# mov	rax, QWORD PTR -8[rbp]		# replaced by r12
	# cmp	rax, QWORD PTR -32[rbp]		# replaced by rsi for (size_t i = 0; i < size; i++)
	cmp	r12, rsi
	
	jb	.L6
	nop
	nop
	
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	ret	


	.size	aToB, .-aToB
	.section	.rodata
.LC0:
	.string	"Enter n: "
.LC1:
	.string	"%ud"
.LC2:
	.string	"Enter array a:"
.LC3:
	.string	"%d"
.LC4:
	.string	"Array b:"
.LC5:
	.string	"%d "


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
	sub	rsp, 104
	mov	rax, QWORD PTR fs:40		# канарейка
	mov	QWORD PTR -56[rbp], rax		# закинули канарейку на стек
	
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	
	# scanf("%d", &n);
	lea	rax, -100[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	
	mov	eax, DWORD PTR -100[rbp]
	mov	edx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	mov	edx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
	mov	edx, eax
	mov	QWORD PTR -144[rbp], rdx
	mov	QWORD PTR -136[rbp], 0
	mov	eax, eax
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
	mov	QWORD PTR -80[rbp], rax
	mov	eax, DWORD PTR -100[rbp]
	mov	edx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	mov	edx, eax
	mov	r14, rdx
	mov	r15d, 0
	mov	edx, eax
	mov	r12, rdx
	mov	r13d, 0
	mov	eax, eax
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
	mov	QWORD PTR -64[rbp], rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -96[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -96[rbp]
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -80[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -96[rbp], 1
.L14:
	mov	eax, DWORD PTR -100[rbp]	
	cmp	DWORD PTR -96[rbp], eax
	jb	.L15
	mov	eax, DWORD PTR -100[rbp]	# n
	mov	ecx, eax
	mov	rdx, QWORD PTR -64[rbp]		# b
	mov	rax, QWORD PTR -80[rbp]		# a
	mov	rsi, rcx			# n
	mov	rdi, rax			# a
	call	aToB				# aToB(a, n, b);
						# aToB - функция типа void, так как возвращаемый результат (массив b), изменяется внутри функции и адрес на этот массив переходит в качестве аргумента
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -92[rbp], 0
	jmp	.L16
.L17:
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, DWORD PTR -92[rbp]
	mov	eax, DWORD PTR [rax+rdx*4]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -92[rbp], 1
.L16:
	mov	eax, DWORD PTR -100[rbp]
	cmp	DWORD PTR -92[rbp], eax
	jb	.L17
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
	mov	rsp, rbx
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40		# канарейка
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
