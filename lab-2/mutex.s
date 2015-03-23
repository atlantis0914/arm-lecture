	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
        ldr r1,=locked		@temp variable = r1
.L1:
	ldrex r2, [r0]		@LDREX from [r0]
	cmp r2, #0		@compare to unlocked value
	strexeq r3, r1, [r0]	@STREX value in temp variable into [r0], if success than write 1 to r3, otherwise write 0 to r3
	cmpeq r3, #0		@check if success
	bne .L1			@if not success, jump to L1

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	ldr r1,= unlocked
	str r1, [r0]
        
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
