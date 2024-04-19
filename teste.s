	.file	"teste.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Opcao 1 selecionada.\0"
LC1:
	.ascii "Opcao 2 selecionada.\0"
LC2:
	.ascii "Opcao 3 selecionada.\0"
LC3:
	.ascii "Opcao invalida.\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$2, 28(%esp)
	movl	28(%esp), %eax
	cmpl	$2, %eax
	je	L3
	cmpl	$3, %eax
	je	L4
	cmpl	$1, %eax
	jne	L8
	movl	$LC0, (%esp)
	call	_puts
	jmp	L6
L3:
	movl	$LC1, (%esp)
	call	_puts
	jmp	L6
L4:
	movl	$LC2, (%esp)
	call	_puts
	jmp	L6
L8:
	movl	$LC3, (%esp)
	call	_puts
L6:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_puts;	.scl	2;	.type	32;	.endef