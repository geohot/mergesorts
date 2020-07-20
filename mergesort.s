	.text
	.globl	my_mergesort
my_mergesort:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
  // check if array length == 1
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	cmpl	$1, -60(%rbp)
	je	.L13
  // check if array length == 2
	cmpl	$2, -60(%rbp)
	jne	.L4
	movq	-56(%rbp), %rax
	movl	(%rax), %edx
	movq	-56(%rbp), %rax
	addq	$4, %rax
	movl	(%rax), %eax
  // check if arr[1] less than arr[0]; if not swap the two 
	cmpl	%eax, %edx
	jle	.L4
	movq	-56(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -40(%rbp)
	movq	-56(%rbp), %rax
	leaq	4(%rax), %rdx
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movq	-56(%rbp), %rax
	movl	-40(%rbp), %edx
	movl	%edx, (%rax)
.L4:
	movl	-60(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -36(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	my_mergesort
	movl	-60(%rbp), %eax
	subl	-36(%rbp), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	my_mergesort
	movl	-60(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
.L12:
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -32(%rbp)
	jnb	.L5
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L5
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jg	.L6
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	addq	$4, -32(%rbp)
	jmp	.L8
.L6:
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	addq	$4, -24(%rbp)
	jmp	.L8
.L5:
	movl	-36(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -32(%rbp)
	jnb	.L9
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	addq	$4, -32(%rbp)
	jmp	.L8
.L9:
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	cmpq	%rax, -24(%rbp)
	jnb	.L14
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, (%rax)
	addq	$4, -24(%rbp)
.L8:
	addq	$4, -16(%rbp)
	jmp	.L12
.L14:
	nop
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L1
.L13:
	nop
.L1:
	leave
	ret

	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
        // push array elements to stack and call my_mergesort
	movl	$5, -48(%rbp)
	movl	$9, -44(%rbp)
	movl	$1, -40(%rbp)
	movl	$3, -36(%rbp)
	movl	$4, -32(%rbp)
	movl	$6, -28(%rbp)
	movl	$6, -24(%rbp)
	movl	$3, -20(%rbp)
	movl	$2, -16(%rbp)
	movl	$9, -52(%rbp)
	leaq	-48(%rbp), %rax
	movl	$9, %esi
	movq	%rax, %rdi
	call	my_mergesort
	movl	$0, -56(%rbp)
	jmp	.L16
.L17:
        // print sorted array
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -56(%rbp)
.L16:
	movl	-56(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L17
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L19
.L19:
	leave
	ret
