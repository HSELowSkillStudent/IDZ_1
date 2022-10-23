	.file	"main.c"
	.intel_syntax noprefix
	.text
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
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 104			# выделили память на хранение локальных переменных
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	
	lea	rax, -108[rbp]			# n
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT		# scanf("%ud", &n);
	
	mov	eax, DWORD PTR -108[rbp]	# n
	mov	edx, eax			
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx		# usigned int i = n - 1
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
.L2:
	cmp	rsp, rdx
	je	.L3
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L2
.L3:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L4
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L4:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax		# a[0]
	mov	eax, DWORD PTR -108[rbp]	# n
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
.L5:
	cmp	rsp, rdx
	je	.L6
	sub	rsp, 4096
	or	QWORD PTR 4088[rsp], 0
	jmp	.L5
.L6:
	mov	rdx, rax
	and	edx, 4095
	sub	rsp, rdx
	mov	rdx, rax
	and	edx, 4095
	test	rdx, rdx
	je	.L7
	and	eax, 4095
	sub	rax, 8
	add	rax, rsp
	or	QWORD PTR [rax], 0
.L7:
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax		# b[0]
	mov	DWORD PTR -104[rbp], 1		# flag = 1
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -100[rbp], 0		# i из цикла 1
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -100[rbp]	# i из цикла 1 ->
	lea	rdx, 0[0+rax*4]			# -> смещение по i -> 
	mov	rax, QWORD PTR -80[rbp]		# a[0]
	add	rax, rdx			# a[i]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT		# -> scanf("%d", &a[i]);
	add	DWORD PTR -100[rbp], 1		# i++ (i из цикла 1)
	
	
.L8:
	mov	eax, DWORD PTR -108[rbp]	# n
	cmp	DWORD PTR -100[rbp], eax	# i < n ?
	jb	.L9				# продолжаем цикл 1
	mov	DWORD PTR -96[rbp], 0		# i из цикла 2 = 0
	jmp	.L10				# конец цикла 1


.L14:						# цикл 2
	mov	rax, QWORD PTR -80[rbp]		# a[0]
	mov	edx, DWORD PTR -96[rbp]		# i из цикла 2
	mov	eax, DWORD PTR [rax+rdx*4]	# a[i]
	test	eax, eax
	jle	.L11				# a[i] ? 0
	mov	DWORD PTR -104[rbp], 0		# a[i] > 0 -> flag = 0
.L11:						# if(flag)
	cmp	DWORD PTR -104[rbp], 0		# flag ? 0
	je	.L12
	mov	rax, QWORD PTR -80[rbp]		# a[0]
	mov	edx, DWORD PTR -96[rbp]		# i из цикла 2
	mov	eax, DWORD PTR [rax+rdx*4]	# a[i]
	lea	ecx, -5[rax]
	mov	rax, QWORD PTR -64[rbp]		# b[0]
	mov	edx, DWORD PTR -96[rbp]		# i из цикла 2
	mov	DWORD PTR [rax+rdx*4], ecx	# b[i]
	jmp	.L13
.L12:						# if (!flag)
	mov	rax, QWORD PTR -80[rbp]		# a[0]
	mov	edx, DWORD PTR -96[rbp]		# i из цикла 2 
	mov	ecx, DWORD PTR [rax+rdx*4]	# a[i]
	mov	rax, QWORD PTR -64[rbp]		# b[0]
	mov	edx, DWORD PTR -96[rbp]		# i из цикла 2
	mov	DWORD PTR [rax+rdx*4], ecx	# b[i]
.L13:
	add	DWORD PTR -96[rbp], 1		# i++ (i из цикла 2)
.L10:
	mov	eax, DWORD PTR -108[rbp]
	cmp	DWORD PTR -96[rbp], eax		# i из цикла 2 ? n
	jb	.L14
						# printf("Array b:\n");
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -92[rbp], 0
	jmp	.L15

.L16:						# цикл 3
	mov	rax, QWORD PTR -64[rbp]		# b[0]
	mov	edx, DWORD PTR -92[rbp]		# i из цикла 3
	mov	eax, DWORD PTR [rax+rdx*4]	# b[i]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT			# printf("%d ", b[i]);
	add	DWORD PTR -92[rbp], 1		# i++ (i из цикла 3)
.L15:
	mov	eax, DWORD PTR -108[rbp]	# n
	cmp	DWORD PTR -92[rbp], eax		# i (из цикла 3) ? n
	jb	.L16
	mov	edi, 10
	call	putchar@PLT
	mov	eax, 0
	mov	rsp, rbx
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L18
	call	__stack_chk_fail@PLT
.L18:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
