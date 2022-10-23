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
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
