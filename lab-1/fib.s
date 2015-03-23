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

	@ END CODE MODIFICATION
	.size fibonacci, .-fibonacci
	.end
