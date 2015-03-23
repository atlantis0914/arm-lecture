	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	

	@ if R0 = 0, return 0
        cmp    R0, #0
	itt    le
        movle  R0, #0
	bxle   lr
	@ if R0 = 1, return 1
	cmp    R0, #1
	it     eq
        bxeq   lr
	@ PROLOG
<<<<<<< HEAD
	push   {r4, r5, lr}
	@ R4 = R0
        movs   R4, R0
	@ Recursive call to fibonacci with R4 - 1 as parameter
	subs   R0, R4, #1
	bl    fibonacci
	@ Value return from fibonacci stores in R0. Add the sum in R5
	mov    R5, R0
	@ Recursive call to fibonacci with R4 - 2 as parameter
	sub   R0, R4, #2
        bl   fibonacci
	@ R0 = R5 + R0 (update flags)
        adds R0, R0, R5
	pop {r4, r5, pc}		@EPILOG
=======
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	@ if(R0 <= 0) goto .L3 (which returns 0)
	subs r4, r0, #0		@if r4 == 0, Z = 1
	cmp r0, #0		@this line is no longer needed because Z has alread set
	ble.L3			@jump to L3 if R0 is less or equal to 0
	@ Compare R4 wtih 1
	@ If R4 == 1 goto .L4 (which returns 1)
	cmp r4, #1		@if r4 == 1, Z = 1
	beq .L4			@jump to L4 if R0 is less or equal to 1
	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
	sub r0, r4, #1
	bl fibonacci
	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter
	mov r5, r0
	sub r0, r4, #2          @since there is no need doing with CPSR, the instruction use "SUB", without "s"
	bl fibonacci
	@ R0 = R5 + R0 (update flags)
	add r0, r5, r0
	pop {r3, r4, r5, pc}		@EPILOG
>>>>>>> 7c0793fb00e8464a62a926b135a5f133f8a36aaf

	@ END CODE MODIFICATION
	.size fibonacci, .-fibonacci
	.end
