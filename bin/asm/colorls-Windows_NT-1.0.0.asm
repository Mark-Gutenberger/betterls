	.file	"colorls.cpp"
	.text
	.section	.text$_Z6printfPKcz,"x"
	.linkonce discard
	.globl	_Z6printfPKcz
	.def	_Z6printfPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6printfPKcz
_Z6printfPKcz:
.LFB4566:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.text
	.def	_wopendir;	.scl	3;	.type	32;	.endef
	.seh_proc	_wopendir
_wopendir:
.LFB4605:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	$0, -8(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L4
	movq	16(%rbp), %rax
	movzwl	(%rax), %eax
	testw	%ax, %ax
	jne	.L5
.L4:
	movl	$2, %ecx
	call	dirent_set_errno
	movl	$0, %eax
	jmp	.L6
.L5:
	movl	$1168, %ecx
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L7
	movq	-8(%rbp), %rax
	movq	$-1, 1152(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 1160(%rax)
	movq	-8(%rbp), %rax
	movl	$0, 1144(%rax)
	movl	$0, %r9d
	movl	$0, %r8d
	movl	$0, %edx
	movq	16(%rbp), %rcx
	movq	__imp_GetFullPathNameW(%rip), %rax
	call	*%rax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	addq	$8, %rax
	addq	%rax, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 1160(%rax)
	movq	-8(%rbp), %rax
	movq	1160(%rax), %rax
	testq	%rax, %rax
	je	.L8
	movq	-8(%rbp), %rax
	movq	1160(%rax), %rdx
	movl	-28(%rbp), %eax
	movl	$0, %r9d
	movq	%rdx, %r8
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	movq	__imp_GetFullPathNameW(%rip), %rax
	call	*%rax
	movl	%eax, -28(%rbp)
	cmpl	$0, -28(%rbp)
	je	.L9
	movq	-8(%rbp), %rax
	movq	1160(%rax), %rdx
	movl	-28(%rbp), %eax
	addq	%rax, %rax
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	1160(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jbe	.L10
	movq	-24(%rbp), %rax
	subq	$2, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	subl	$47, %eax
	cmpl	$45, %eax
	seta	%dl
	testb	%dl, %dl
	jne	.L11
	movabsq	$35184372090881, %rdx
	movl	%eax, %ecx
	shrq	%cl, %rdx
	movq	%rdx, %rax
	andl	$1, %eax
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	jne	.L16
.L11:
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movw	$92, (%rax)
	jmp	.L10
.L16:
	nop
.L10:
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movw	$42, (%rax)
	movq	-24(%rbp), %rax
	movw	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	dirent_first
	testq	%rax, %rax
	setne	%al
	testb	%al, %al
	je	.L13
	movl	$0, -12(%rbp)
	jmp	.L14
.L13:
	movl	$1, -12(%rbp)
	movl	$2, %ecx
	call	dirent_set_errno
	jmp	.L14
.L9:
	movl	$2, %ecx
	call	dirent_set_errno
	movl	$1, -12(%rbp)
	jmp	.L14
.L8:
	movl	$1, -12(%rbp)
	jmp	.L14
.L7:
	movl	$1, -12(%rbp)
.L14:
	cmpl	$0, -12(%rbp)
	je	.L15
	cmpq	$0, -8(%rbp)
	je	.L15
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	_wclosedir
	movq	$0, -8(%rbp)
.L15:
	movq	-8(%rbp), %rax
.L6:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_wreaddir;	.scl	3;	.type	32;	.endef
	.seh_proc	_wreaddir
_wreaddir:
.LFB4606:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	_wreaddir_r
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_wreaddir_r;	.scl	3;	.type	32;	.endef
	.seh_proc	_wreaddir_r
_wreaddir_r:
.LFB4607:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rcx
	call	dirent_next
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L20
	movq	$0, -8(%rbp)
	jmp	.L21
.L23:
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$16, %rdx
	movzwl	12(%rax,%rdx,2), %edx
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rcx
	addq	$8, %rcx
	movw	%dx, 12(%rax,%rcx,2)
	addq	$1, -8(%rbp)
.L21:
	cmpq	$259, -8(%rbp)
	ja	.L22
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$16, %rdx
	movzwl	12(%rax,%rdx,2), %eax
	testw	%ax, %ax
	jne	.L23
.L22:
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	$8, %rdx
	movw	$0, 12(%rax,%rdx,2)
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	andl	$64, %eax
	testl	%eax, %eax
	je	.L24
	movq	24(%rbp), %rax
	movl	$8192, 24(%rax)
	jmp	.L25
.L24:
	movl	-20(%rbp), %eax
	andl	$16, %eax
	testl	%eax, %eax
	je	.L26
	movq	24(%rbp), %rax
	movl	$16384, 24(%rax)
	jmp	.L25
.L26:
	movq	24(%rbp), %rax
	movl	$32768, 24(%rax)
.L25:
	movq	24(%rbp), %rax
	movl	$0, (%rax)
	movq	24(%rbp), %rax
	movl	$0, 4(%rax)
	movq	24(%rbp), %rax
	movw	$552, 8(%rax)
	movq	32(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L27
.L20:
	movq	32(%rbp), %rax
	movq	$0, (%rax)
.L27:
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_wclosedir;	.scl	3;	.type	32;	.endef
	.seh_proc	_wclosedir
_wclosedir:
.LFB4608:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L30
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	cmpq	$-1, %rax
	je	.L31
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	movq	%rax, %rcx
	movq	__imp_FindClose(%rip), %rax
	call	*%rax
	movq	16(%rbp), %rax
	movq	$-1, 1152(%rax)
.L31:
	movq	16(%rbp), %rax
	movq	1160(%rax), %rax
	testq	%rax, %rax
	je	.L32
	movq	16(%rbp), %rax
	movq	1160(%rax), %rax
	movq	%rax, %rcx
	call	free
	movq	16(%rbp), %rax
	movq	$0, 1160(%rax)
.L32:
	movq	16(%rbp), %rcx
	call	free
	movl	$0, -4(%rbp)
	jmp	.L33
.L30:
	movl	$9, %ecx
	call	dirent_set_errno
	movl	$-1, -4(%rbp)
.L33:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_wrewinddir;	.scl	3;	.type	32;	.endef
	.seh_proc	_wrewinddir
_wrewinddir:
.LFB4609:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L38
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	cmpq	$-1, %rax
	je	.L37
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	movq	%rax, %rcx
	movq	__imp_FindClose(%rip), %rax
	call	*%rax
.L37:
	movq	16(%rbp), %rcx
	call	dirent_first
.L38:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	dirent_first;	.scl	3;	.type	32;	.endef
	.seh_proc	dirent_first
dirent_first:
.LFB4610:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	leaq	552(%rax), %rdx
	movq	16(%rbp), %rax
	movq	1160(%rax), %rax
	movl	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movl	$0, %r9d
	movq	%rdx, %r8
	movl	$0, %edx
	movq	%rax, %rcx
	movq	__imp_FindFirstFileExW(%rip), %rax
	call	*%rax
	movq	16(%rbp), %rdx
	movq	%rax, 1152(%rdx)
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	cmpq	$-1, %rax
	je	.L40
	movq	16(%rbp), %rax
	addq	$552, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$1, 1144(%rax)
	jmp	.L41
.L40:
	movq	16(%rbp), %rax
	movl	$0, 1144(%rax)
	movq	$0, -8(%rbp)
.L41:
	movq	-8(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	dirent_next;	.scl	3;	.type	32;	.endef
	.seh_proc	dirent_next
dirent_next:
.LFB4611:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movl	1144(%rax), %eax
	testl	%eax, %eax
	je	.L44
	movq	16(%rbp), %rax
	addq	$552, %rax
	movq	%rax, -8(%rbp)
	movq	16(%rbp), %rax
	movl	$0, 1144(%rax)
	jmp	.L45
.L44:
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	cmpq	$-1, %rax
	je	.L46
	movq	16(%rbp), %rax
	leaq	552(%rax), %rdx
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	movq	%rax, %rcx
	movq	__imp_FindNextFileW(%rip), %rax
	call	*%rax
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L47
	movq	16(%rbp), %rax
	addq	$552, %rax
	movq	%rax, -8(%rbp)
	jmp	.L45
.L47:
	movq	16(%rbp), %rax
	movq	1152(%rax), %rax
	movq	%rax, %rcx
	movq	__imp_FindClose(%rip), %rax
	call	*%rax
	movq	16(%rbp), %rax
	movq	$-1, 1152(%rax)
	movq	$0, -8(%rbp)
	jmp	.L45
.L46:
	movq	$0, -8(%rbp)
.L45:
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	opendir;	.scl	3;	.type	32;	.endef
	.seh_proc	opendir
opendir:
.LFB4612:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$608, %rsp
	.seh_stackalloc	608
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 496(%rbp)
	cmpq	$0, 496(%rbp)
	je	.L50
	movq	496(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L51
.L50:
	movl	$2, %ecx
	call	dirent_set_errno
	movl	$0, %eax
	jmp	.L52
.L51:
	movl	$304, %ecx
	call	malloc
	movq	%rax, 472(%rbp)
	cmpq	$0, 472(%rbp)
	je	.L53
	leaq	-80(%rbp), %rdx
	leaq	456(%rbp), %rax
	movq	$261, 32(%rsp)
	movq	496(%rbp), %r9
	movl	$261, %r8d
	movq	%rax, %rcx
	call	dirent_mbstowcs_s
	movl	%eax, 468(%rbp)
	cmpl	$0, 468(%rbp)
	jne	.L54
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_wopendir
	movq	472(%rbp), %rdx
	movq	%rax, 296(%rdx)
	movq	472(%rbp), %rax
	movq	296(%rax), %rax
	testq	%rax, %rax
	je	.L55
	movl	$0, 468(%rbp)
	jmp	.L57
.L55:
	movl	$1, 468(%rbp)
	jmp	.L57
.L54:
	movl	$1, 468(%rbp)
	jmp	.L57
.L53:
	movl	$1, 468(%rbp)
.L57:
	cmpl	$0, 468(%rbp)
	je	.L58
	cmpq	$0, 472(%rbp)
	je	.L58
	movq	472(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	$0, 472(%rbp)
.L58:
	movq	472(%rbp), %rax
.L52:
	addq	$608, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	readdir;	.scl	3;	.type	32;	.endef
	.seh_proc	readdir
readdir:
.LFB4613:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	leaq	-8(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	readdir_r
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	readdir_r;	.scl	3;	.type	32;	.endef
	.seh_proc	readdir_r
readdir_r:
.LFB4614:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	16(%rbp), %rax
	movq	296(%rax), %rax
	movq	%rax, %rcx
	call	dirent_next
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L62
	movq	-16(%rbp), %rax
	leaq	44(%rax), %rcx
	movq	24(%rbp), %rax
	leaq	28(%rax), %rdx
	leaq	-32(%rbp), %rax
	movq	$261, 32(%rsp)
	movq	%rcx, %r9
	movl	$261, %r8d
	movq	%rax, %rcx
	call	dirent_wcstombs_s
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L63
	movq	-16(%rbp), %rax
	movzwl	564(%rax), %eax
	testw	%ax, %ax
	je	.L63
	movq	-16(%rbp), %rax
	leaq	564(%rax), %rcx
	movq	24(%rbp), %rax
	leaq	28(%rax), %rdx
	leaq	-32(%rbp), %rax
	movq	$261, 32(%rsp)
	movq	%rcx, %r9
	movl	$261, %r8d
	movq	%rax, %rcx
	call	dirent_wcstombs_s
	movl	%eax, -4(%rbp)
.L63:
	cmpl	$0, -4(%rbp)
	jne	.L64
	movq	-32(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	24(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	andl	$64, %eax
	testl	%eax, %eax
	je	.L65
	movq	24(%rbp), %rax
	movl	$8192, 24(%rax)
	jmp	.L66
.L65:
	movl	-20(%rbp), %eax
	andl	$16, %eax
	testl	%eax, %eax
	je	.L67
	movq	24(%rbp), %rax
	movl	$16384, 24(%rax)
	jmp	.L66
.L67:
	movq	24(%rbp), %rax
	movl	$32768, 24(%rax)
.L66:
	movq	24(%rbp), %rax
	movl	$0, (%rax)
	movq	24(%rbp), %rax
	movl	$0, 4(%rax)
	movq	24(%rbp), %rax
	movw	$296, 8(%rax)
	jmp	.L68
.L64:
	movq	24(%rbp), %rax
	movb	$63, 28(%rax)
	movq	24(%rbp), %rax
	movb	$0, 29(%rax)
	movq	24(%rbp), %rax
	movq	$1, 16(%rax)
	movq	24(%rbp), %rax
	movl	$0, 24(%rax)
	movq	24(%rbp), %rax
	movl	$0, (%rax)
	movq	24(%rbp), %rax
	movl	$-1, 4(%rax)
	movq	24(%rbp), %rax
	movw	$0, 8(%rax)
.L68:
	movq	32(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	%rdx, (%rax)
	jmp	.L69
.L62:
	movq	32(%rbp), %rax
	movq	$0, (%rax)
.L69:
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	closedir;	.scl	3;	.type	32;	.endef
	.seh_proc	closedir
closedir:
.LFB4615:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L72
	movq	16(%rbp), %rax
	movq	296(%rax), %rax
	movq	%rax, %rcx
	call	_wclosedir
	movl	%eax, -4(%rbp)
	movq	16(%rbp), %rax
	movq	$0, 296(%rax)
	movq	16(%rbp), %rcx
	call	free
	jmp	.L73
.L72:
	movl	$9, %ecx
	call	dirent_set_errno
	movl	$-1, -4(%rbp)
.L73:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	rewinddir;	.scl	3;	.type	32;	.endef
	.seh_proc	rewinddir
rewinddir:
.LFB4616:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	296(%rax), %rax
	movq	%rax, %rcx
	call	_wrewinddir
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	scandir;	.scl	3;	.type	32;	.endef
	.seh_proc	scandir
scandir:
.LFB4617:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	addq	$-128, %rsp
	.seh_stackalloc	128
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	movq	$0, -24(%rbp)
	movq	$1, -72(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -32(%rbp)
	movl	$0, -44(%rbp)
	movq	16(%rbp), %rcx
	call	opendir
	movq	%rax, -80(%rbp)
	cmpq	$0, -80(%rbp)
	je	.L77
.L89:
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jb	.L78
	cmpq	$0, -16(%rbp)
	jne	.L79
	movq	$1, -56(%rbp)
	jmp	.L80
.L79:
	movq	-16(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, -56(%rbp)
.L80:
	movq	-56(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	realloc
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	je	.L81
	movq	-88(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L78
.L81:
	movl	$-1, -44(%rbp)
	jmp	.L90
.L78:
	cmpq	$0, -32(%rbp)
	jne	.L83
	movl	$296, %ecx
	call	malloc
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L83
	movl	$-1, -44(%rbp)
	jmp	.L90
.L83:
	leaq	-96(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	readdir_r
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L84
	movq	-96(%rbp), %rax
	testq	%rax, %rax
	je	.L85
	cmpq	$0, 32(%rbp)
	je	.L86
	movq	32(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	*%rdx
	movl	%eax, -60(%rbp)
	jmp	.L87
.L86:
	movl	$1, -60(%rbp)
.L87:
	cmpl	$0, -60(%rbp)
	je	.L89
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %r8
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, -16(%rbp)
	salq	$3, %rax
	addq	%r8, %rax
	movq	%rdx, (%rax)
	movq	$0, -32(%rbp)
	addl	$1, -44(%rbp)
	jmp	.L89
.L85:
	movq	40(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rcx, %r9
	movl	$8, %r8d
	movq	%rax, %rcx
	call	qsort
	jmp	.L90
.L84:
	movl	$-1, -44(%rbp)
	jmp	.L90
.L77:
	movl	$-1, -44(%rbp)
.L90:
	cmpq	$0, -32(%rbp)
	je	.L91
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	free
.L91:
	cmpl	$0, -44(%rbp)
	jns	.L92
	movq	$0, -40(%rbp)
	jmp	.L93
.L94:
	movq	-40(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	addq	$1, -40(%rbp)
.L93:
	movq	-40(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.L94
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	$0, -8(%rbp)
.L92:
	cmpq	$0, -80(%rbp)
	je	.L95
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	closedir
.L95:
	cmpq	$0, 24(%rbp)
	je	.L96
	movq	24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
.L96:
	movl	-44(%rbp), %eax
	subq	$-128, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	alphasort;	.scl	3;	.type	32;	.endef
	.seh_proc	alphasort
alphasort:
.LFB4618:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	leaq	28(%rax), %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	addq	$28, %rax
	movq	%rax, %rcx
	call	strcoll
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	versionsort;	.scl	3;	.type	32;	.endef
	.seh_proc	versionsort
versionsort:
.LFB4619:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	alphasort
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	dirent_mbstowcs_s;	.scl	3;	.type	32;	.endef
	.seh_proc	dirent_mbstowcs_s
dirent_mbstowcs_s:
.LFB4620:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	mbstowcs
	movq	%rax, -16(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L103
	movq	-16(%rbp), %rax
	cmpq	48(%rbp), %rax
	jnb	.L104
.L103:
	cmpq	$0, 24(%rbp)
	je	.L105
	cmpq	$0, 32(%rbp)
	je	.L105
	movq	-16(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L106
	movq	32(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
.L106:
	movq	-16(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movw	$0, (%rax)
.L105:
	cmpq	$0, 16(%rbp)
	je	.L107
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
.L107:
	movl	$0, -4(%rbp)
	jmp	.L108
.L104:
	movl	$1, -4(%rbp)
.L108:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	dirent_wcstombs_s;	.scl	3;	.type	32;	.endef
	.seh_proc	dirent_wcstombs_s
dirent_wcstombs_s:
.LFB4621:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rdx
	movq	24(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	wcstombs
	movq	%rax, -16(%rbp)
	cmpq	$0, 24(%rbp)
	je	.L111
	movq	-16(%rbp), %rax
	cmpq	48(%rbp), %rax
	jnb	.L112
.L111:
	cmpq	$0, 24(%rbp)
	je	.L113
	cmpq	$0, 32(%rbp)
	je	.L113
	movq	-16(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L114
	movq	32(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
.L114:
	movq	24(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L113:
	cmpq	$0, 16(%rbp)
	je	.L115
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
.L115:
	movl	$0, -4(%rbp)
	jmp	.L116
.L112:
	movl	$1, -4(%rbp)
.L116:
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	dirent_set_errno;	.scl	3;	.type	32;	.endef
	.seh_proc	dirent_set_errno
dirent_set_errno:
.LFB4622:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movl	%ecx, 32(%rbp)
	movl	32(%rbp), %ebx
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	%ebx, (%rax)
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
_ZN3fmt2v86detailL5microE:
	.ascii "\302\265\0"
	.align 4
_ZN3fmt2v86detailL17invalid_arg_indexE:
	.long	-1
.LC0:
	.ascii "opendir\0"
	.text
	.globl	_Z7listdirPKc
	.def	_Z7listdirPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z7listdirPKc
_Z7listdirPKc:
.LFB6627:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	opendir
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L122
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	perror
	movl	$-1, %eax
	jmp	.L121
.L123:
	movq	-16(%rbp), %rax
	addq	$28, %rax
	movq	%rax, %rcx
	call	puts
.L122:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	readdir
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	setne	%al
	testb	%al, %al
	jne	.L123
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	closedir
	movl	$0, %eax
.L121:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii ".\0"
.LC2:
	.ascii "\12Listing %s...\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB6628:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	movl	$1, -4(%rbp)
	cmpl	$1, 16(%rbp)
	jne	.L126
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	_Z7listdirPKc
	jmp	.L126
.L127:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	_Z6printfPKcz
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	_Z7listdirPKc
.L126:
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	setle	%al
	testb	%al, %al
	jne	.L127
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-posix-seh, built by Brecht Sanders) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	qsort;	.scl	2;	.type	32;	.endef
	.def	strcoll;	.scl	2;	.type	32;	.endef
	.def	mbstowcs;	.scl	2;	.type	32;	.endef
	.def	wcstombs;	.scl	2;	.type	32;	.endef
	.def	perror;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
