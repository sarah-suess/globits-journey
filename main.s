	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #1024
	ldr	r1, .L4
	push	{r4, lr}
	mov	r0, #3
	ldr	r4, .L4+4
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	mov	r3, #32768
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	-10110
	.word	DMANow
	.word	newtilesetTiles
	.word	newtilesetPal
	.word	100712448
	.word	newTilemapMap
	.word	100728832
	.word	newgamespritesheetTiles
	.word	83886592
	.word	newgamespritesheetPal
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initialize
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L8
	pop	{r4, lr}
	str	r3, [r1]
	strh	r3, [r2, #24]	@ movhi
	strh	r3, [r2, #26]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	pauseToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseToGame, %function
pauseToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L16
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, r5, r6, lr}
	beq	.L14
	cmp	r3, #2
	beq	.L15
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	mov	r4, #67108864
	mov	r0, #2
	mov	r2, #5632
	ldr	r1, .L16+4
	ldr	r3, .L16+8
	str	r0, [r1]
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+12
	ldr	r2, .L16+16
	strh	r3, [r4, #10]	@ movhi
	mov	r0, #3
	strh	r2, [r4, #12]	@ movhi
	mov	r3, #32768
	ldr	r4, .L16+20
	mov	r2, #100663296
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+32
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+40
	ldr	r1, .L16+44
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L16+48
	mov	r0, #3
	ldr	r1, .L16+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+56
	ldr	r2, .L16+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L15:
	mov	r4, #3
	mov	r5, #67108864
	mov	r2, #5632
	ldr	r1, .L16+4
	ldr	r3, .L16+8
	str	r4, [r1]
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r2, .L16+12
	ldr	r3, .L16+16
	strh	r2, [r5, #10]	@ movhi
	mov	r0, r4
	strh	r3, [r5, #12]	@ movhi
	mov	r2, #100663296
	ldr	r5, .L16+20
	mov	r3, #32768
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2048
	ldr	r2, .L16+32
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2048
	ldr	r2, .L16+40
	ldr	r1, .L16+52
	mov	lr, pc
	bx	r5
	ldr	r3, .L16+56
	ldr	r2, .L16+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	game
	.word	state
	.word	hideSprites
	.word	22147
	.word	22658
	.word	DMANow
	.word	newgametilesetTiles
	.word	newgametilesetPal
	.word	100708352
	.word	cloudmapMap
	.word	100712448
	.word	newgametilemapMap
	.word	100716544
	.word	newgametilemap2Map
	.word	collisionMap
	.word	newcollisionmapBitmap
	.word	newcollisionmap2Bitmap
	.size	pauseToGame, .-pauseToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #4
	mov	r5, #67108864
	mov	r2, #1024
	ldr	r3, .L20
	ldr	r1, .L20+4
	ldr	r4, .L20+8
	str	r0, [r3]
	strh	r2, [r5]	@ movhi
	mov	r3, #32768
	strh	r1, [r5, #12]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L20+20
	ldr	r1, .L20+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L20+28
	ldr	r1, .L20+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L20+36
	mov	r0, #3
	ldr	r1, .L20+40
	mov	lr, pc
	bx	r4
	mov	r2, #0
	mov	r3, #160
	strh	r2, [r5, #24]	@ movhi
	strh	r3, [r5, #26]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	state
	.word	-10110
	.word	DMANow
	.word	newtilesetTiles
	.word	newtilesetPal
	.word	100712448
	.word	newTilemapMap
	.word	100728832
	.word	newgamespritesheetTiles
	.word	83886592
	.word	newgamespritesheetPal
	.size	goToPause, .-goToPause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initialize
	mov	r2, #6
	ldr	r3, .L24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	initializePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r1, #8
	mov	r4, #65
	mov	lr, #216
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L28
	stm	r3, {r4, lr}
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #44]
	str	r0, [r3, #56]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #60]
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.size	initializePlayer, .-initializePlayer
	.align	2
	.global	resetPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetPlayer, %function
resetPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #8
	mov	ip, #65
	mov	r0, #216
	ldr	r3, .L31
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	bx	lr
.L32:
	.align	2
.L31:
	.word	player
	.size	resetPlayer, .-resetPlayer
	.align	2
	.global	initwand
	.syntax unified
	.arm
	.fpu softvfp
	.type	initwand, %function
initwand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #216
	mov	lr, #80
	mov	r0, #2
	mov	r1, #8
	mov	r2, #1
	ldr	r3, .L35
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L36:
	.align	2
.L35:
	.word	wand
	.size	initwand, .-initwand
	.align	2
	.global	initfruit
	.syntax unified
	.arm
	.fpu softvfp
	.type	initfruit, %function
initfruit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #71
	mov	lr, #360
	mov	r0, #6
	mov	r1, #10
	mov	r2, #1
	ldr	r3, .L39
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	fruit
	.size	initfruit, .-initfruit
	.align	2
	.global	initfruit2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initfruit2, %function
initfruit2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r0, #6
	mov	r5, #344
	mov	r4, #56
	mov	lr, #440
	mov	r1, #10
	mov	r2, #1
	mov	ip, #192
	ldr	r3, .L43
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #64]
	str	r0, [r3, #8]
	str	r0, [r3, #72]
	str	ip, [r3, #68]
	str	r1, [r3, #12]
	str	r1, [r3, #76]
	str	r2, [r3, #16]
	str	r2, [r3, #80]
	pop	{r4, r5, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	fruit2
	.size	initfruit2, .-initfruit2
	.align	2
	.global	initCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCheat, %function
initCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #207
	mov	lr, #25
	mov	r0, #6
	mov	r1, #10
	mov	r2, #1
	ldr	r3, .L47
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	cheat
	.size	initCheat, .-initCheat
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #2
	mov	r0, #1
	ldr	r3, .L50
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	ldr	r3, .L50+4
	add	r2, r2, #3
	str	r2, [r3, #4]
	str	ip, [r3]
	str	r0, [r3, #16]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.word	bullet
	.size	initBullet, .-initBullet
	.align	2
	.global	initializeEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeEnemy, %function
initializeEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L60
	push	{r4, lr}
	mov	r3, r2
	mov	r4, #7
	mov	lr, #13
	mov	r1, #1
	mov	ip, #0
	add	r0, r2, #192
.L53:
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	ip, [r3, #36]
	add	r3, r3, #64
	cmp	r3, r0
	bne	.L53
	ldr	r3, .L60+4
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L58
	cmp	r3, #3
	beq	.L59
.L55:
	mov	r0, #10
	mov	r1, #20
	mov	r3, #25
	str	r0, [r2, #48]
	str	r1, [r2, #112]
	str	r3, [r2, #176]
	pop	{r4, lr}
	bx	lr
.L59:
	mov	r3, #190
	mov	lr, #194
	mov	ip, #82
	mov	r0, #234
	ldr	r1, .L60+8
	str	r3, [r2]
	add	r3, r3, #168
	str	lr, [r2, #4]
	str	ip, [r2, #68]
	str	r0, [r2, #132]
	str	r1, [r2, #64]
	str	r3, [r2, #128]
	b	.L55
.L58:
	mov	r3, #145
	mov	lr, #170
	mov	ip, #50
	mov	r0, #340
	mov	r1, #122
	str	r3, [r2]
	add	r3, r3, #253
	str	lr, [r2, #4]
	str	ip, [r2, #68]
	str	r0, [r2, #128]
	str	r1, [r2, #132]
	str	r3, [r2, #64]
	b	.L55
.L61:
	.align	2
.L60:
	.word	enemy
	.word	state
	.word	261
	.size	initializeEnemy, .-initializeEnemy
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #67108864
	mov	r5, #3
	ldr	r7, .L64
	mov	lr, pc
	bx	r7
	ldr	r1, .L64+4
	ldr	r3, .L64+8
	ldr	r2, .L64+12
	str	r5, [r1]
	ldr	r6, .L64+16
	strh	r3, [r4, #10]	@ movhi
	mov	r0, r5
	strh	r2, [r4, #12]	@ movhi
	mov	r3, #32768
	mov	r2, #100663296
	ldr	r1, .L64+20
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L64+24
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #2048
	ldr	r2, .L64+28
	ldr	r1, .L64+32
	mov	lr, pc
	bx	r6
	mov	r0, r5
	ldr	r1, .L64+36
	mov	r3, #2048
	ldr	r2, .L64+40
	mov	lr, pc
	bx	r6
	ldr	r3, .L64+44
	ldr	r2, .L64+48
	mov	r5, #0
	str	r2, [r3]
	mov	lr, pc
	bx	r7
	mov	r1, #30
	mov	r2, #5
	mov	r6, #56
	strh	r5, [r4, #24]	@ movhi
	ldr	r3, .L64+52
	strh	r5, [r4, #26]	@ movhi
	strh	r5, [r4, #20]	@ movhi
	strh	r1, [r4, #22]	@ movhi
	mov	r4, #440
	stm	r3, {r2, r6}
	bl	initializeEnemy
	mov	r2, #192
	mov	lr, #6
	mov	r8, #344
	mov	ip, #10
	mov	r0, #1
	mov	r1, #512
	mov	r7, #2
	ldr	r3, .L64+56
	str	r5, [r3, #16]
	ldr	r3, .L64+60
	str	r4, [r3, #64]
	ldr	r4, .L64+64
	str	r2, [r3, #68]
	str	r5, [r4, #16]
	ldr	r2, .L64+68
	ldr	r4, .L64+72
	str	r6, [r3, #4]
	str	r8, [r3]
	str	lr, [r3, #8]
	str	lr, [r3, #72]
	str	r7, [r4]
	str	ip, [r3, #12]
	str	ip, [r3, #76]
	str	r0, [r3, #16]
	str	r0, [r3, #80]
	strh	r1, [r2, #80]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	hideSprites
	.word	state
	.word	22147
	.word	22658
	.word	DMANow
	.word	newgametilesetTiles
	.word	newgametilesetPal
	.word	100708352
	.word	cloudmapMap
	.word	newgametilemap2Map
	.word	100712448
	.word	collisionMap
	.word	newcollisionmap2Bitmap
	.word	player
	.word	cheat
	.word	fruit2
	.word	wand
	.word	shadowOAM
	.word	game
	.size	goToGame2, .-goToGame2
	.align	2
	.global	resetGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGame, %function
resetGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r6, #8
	mov	r8, #2
	mov	r3, #65
	mov	r7, #216
	ldr	r4, .L68
	ldr	r2, .L68+4
	stm	r4, {r3, r7}
	str	r8, [r2]
	str	r6, [r4, #8]
	str	r6, [r4, #12]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #40]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	str	r5, [r4, #52]
	str	r5, [r4, #60]
	mov	fp, #80
	bl	initializeEnemy
	mov	r3, #1
	mov	r1, #6
	mov	ip, #71
	mov	r10, #25
	mov	r9, #207
	mov	lr, #360
	mov	r2, #10
	mov	r0, #133
	str	r5, [r4, #52]
	ldr	r4, .L68+8
	ldr	r5, .L68+12
	stmib	r4, {r7, r8}
	str	r6, [r4, #12]
	str	fp, [r4]
	str	r3, [r4, #16]
	ldr	r4, .L68+16
	str	r3, [r5, #16]
	str	r1, [r5, #8]
	str	r3, [r4, #16]
	str	ip, [r4, #4]
	str	r1, [r4, #8]
	ldr	r3, .L68+20
	ldr	r1, .L68+24
	ldr	ip, .L68+28
	str	r10, [r5]
	str	r9, [r5, #4]
	str	lr, [r4]
	str	ip, [r3, #1668]
	str	r2, [r5, #12]
	str	r1, [r3, #1732]
	add	r1, r3, #1600
	strh	r0, [r1, #4]	@ movhi
	mov	r0, #164	@ movhi
	add	r1, r3, #1664
	strh	r0, [r1, #2]	@ movhi
	mov	r1, #196	@ movhi
	add	r3, r3, #1728
	strh	r1, [r3, #2]	@ movhi
	str	r2, [r4, #12]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	player
	.word	state
	.word	wand
	.word	cheat
	.word	fruit
	.word	100712448
	.word	12976325
	.word	10879141
	.size	resetGame, .-resetGame
	.align	2
	.global	resetGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGame2, %function
resetGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #30
	push	{r4, r5, r6, lr}
	mov	r1, #5
	mov	r5, #56
	ldr	r4, .L72
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r0, [r3, #22]	@ movhi
	mov	r6, #344
	stm	r4, {r1, r5}
	bl	initializeEnemy
	mov	r2, #1
	mov	lr, #440
	mov	r0, #6
	mov	r1, #10
	mov	ip, #192
	ldr	r3, .L72+4
	str	r2, [r4, #52]
	str	r5, [r3, #4]
	str	r6, [r3]
	str	lr, [r3, #64]
	str	ip, [r3, #68]
	str	r2, [r3, #16]
	str	r2, [r3, #80]
	str	r0, [r3, #8]
	str	r0, [r3, #72]
	str	r1, [r3, #12]
	str	r1, [r3, #76]
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	player
	.word	fruit2
	.size	resetGame2, .-resetGame2
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #67108864
	mov	r3, #5632
	mov	r7, #2
	strh	r3, [r5]	@ movhi
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	ldr	r2, .L76+8
	ldr	r1, .L76+12
	ldr	r4, .L76+16
	str	r7, [r3]
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #32768
	strh	r1, [r5, #12]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L76+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L76+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L76+28
	ldr	r1, .L76+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L76+36
	ldr	r1, .L76+40
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L76+44
	ldr	r1, .L76+48
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L76+52
	ldr	r1, .L76+56
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #256
	ldr	r2, .L76+60
	ldr	r1, .L76+64
	mov	lr, pc
	bx	r4
	mov	r2, #65
	mov	r1, #3
	mov	r4, #0
	mov	r6, #8
	mov	r8, #216
	ldr	r3, .L76+68
	str	r2, [r3]
	str	r1, [r3, #44]
	ldr	r2, .L76+72
	ldr	r1, .L76+76
	str	r7, [r3, #56]
	str	r6, [r3, #8]
	str	r6, [r3, #12]
	str	r8, [r3, #4]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #40]
	str	r4, [r3, #32]
	str	r4, [r3, #36]
	str	r4, [r3, #60]
	str	r1, [r2]
	bl	initializeEnemy
	mov	lr, #25
	ldr	r0, .L76+80
	mov	r3, #1
	str	r7, [r0, #8]
	mov	fp, #80
	ldr	r7, .L76+84
	mov	r10, #204
	str	lr, [r7]
	mov	r9, #360
	mov	lr, #95	@ movhi
	str	fp, [r0]
	str	r8, [r0, #4]
	str	r6, [r0, #12]
	str	r3, [r0, #16]
	ldr	r6, .L76+88
	ldr	r0, .L76+92
	str	r10, [r6]
	str	r3, [r6, #16]
	str	r9, [r0]
	str	r3, [r6, #80]
	str	r3, [r6, #144]
	strh	r4, [r5, #24]	@ movhi
	str	r3, [r0, #16]
	strh	lr, [r5, #26]	@ movhi
	mov	lr, #215
	str	lr, [r6, #64]
	mov	lr, #226
	mov	r1, #6
	str	lr, [r6, #128]
	mov	lr, #71
	mov	r2, #5
	str	r1, [r6, #4]
	str	r1, [r6, #68]
	str	r1, [r6, #132]
	str	r1, [r7, #8]
	mov	ip, #10
	str	lr, [r0, #4]
	str	r1, [r0, #8]
	mov	lr, #207
	mov	r1, #30	@ movhi
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	str	r2, [r6, #72]
	str	r2, [r6, #76]
	str	r2, [r6, #136]
	str	r2, [r6, #140]
	ldr	r2, .L76+96
	str	r3, [r7, #16]
	str	lr, [r7, #4]
	str	ip, [r7, #12]
	str	ip, [r0, #12]
	strh	r4, [r5, #20]	@ movhi
	strh	r1, [r5, #22]	@ movhi
	str	r3, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	hideSprites
	.word	state
	.word	22147
	.word	22658
	.word	DMANow
	.word	newgametilesetTiles
	.word	newgametilesetPal
	.word	100708352
	.word	cloudmapMap
	.word	100712448
	.word	newgametilemapMap
	.word	100716544
	.word	newgametilemap2Map
	.word	100728832
	.word	newgamespritesheetTiles
	.word	83886592
	.word	newgamespritesheetPal
	.word	player
	.word	collisionMap
	.word	newcollisionmapBitmap
	.word	wand
	.word	cheat
	.word	life
	.word	fruit
	.word	game
	.size	goToGame, .-goToGame
	.align	2
	.global	initializeLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeLives, %function
initializeLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #5
	mov	r0, #6
	mov	r1, #1
	mov	r4, #204
	mov	lr, #215
	mov	ip, #226
	ldr	r3, .L80
	str	r4, [r3]
	str	lr, [r3, #64]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #72]
	str	r2, [r3, #76]
	str	r2, [r3, #136]
	str	r2, [r3, #140]
	str	ip, [r3, #128]
	str	r0, [r3, #4]
	str	r0, [r3, #68]
	str	r0, [r3, #132]
	str	r1, [r3, #16]
	str	r1, [r3, #80]
	str	r1, [r3, #144]
	pop	{r4, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	life
	.size	initializeLives, .-initializeLives
	.align	2
	.global	updatewand
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatewand, %function
updatewand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L95
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	sub	sp, sp, #16
	beq	.L83
	mov	lr, #6
	ldr	r3, .L95+4
	ldr	r2, .L95+8
	ldr	r3, [r3]
	ldr	r2, [r2]
	sub	r3, r1, r3
	ldr	ip, .L95+12
	lsl	r3, r3, #23
	sub	r2, r0, r2
	lsr	r3, r3, #23
	and	r2, r2, #255
	strh	r3, [ip, #18]	@ movhi
	strh	r2, [ip, #16]	@ movhi
	strh	lr, [ip, #20]	@ movhi
.L83:
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	ldr	r5, .L95+16
	str	r0, [sp, #4]
	str	r1, [sp]
	str	lr, [sp, #12]
	ldm	r5, {r0, r1, r2, r3}
	str	ip, [sp, #8]
	ldr	r6, .L95+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L82
	ldr	r3, .L95+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L82
	ldr	r3, .L95+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L82
	mov	r0, #512
	mov	r2, #1
	ldr	r1, .L95+12
	str	r3, [r4, #16]
	strh	r0, [r1, #16]	@ movhi
	str	r2, [r5, #40]
.L82:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	wand
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.size	updatewand, .-updatewand
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L104
	ldr	r2, [r3, #16]
	cmp	r2, #0
	push	{r4, lr}
	ldr	r2, [r3]
	beq	.L98
	mov	lr, #38
	ldr	r1, .L104+4
	ldr	r0, .L104+8
	ldr	r1, [r1]
	ldr	r4, [r0]
	add	r2, r2, #2
	ldr	r0, [r3, #4]
	sub	r1, r2, r1
	ldr	ip, .L104+12
	lsl	r1, r1, #23
	sub	r0, r0, r4
	lsr	r1, r1, #23
	and	r0, r0, #255
	str	r2, [r3]
	strh	r1, [ip, #26]	@ movhi
	strh	r0, [ip, #24]	@ movhi
	strh	lr, [ip, #28]	@ movhi
.L98:
	ldr	r1, .L104+16
	cmp	r2, r1
	movgt	r0, #0
	movgt	r1, #512
	ldrgt	r2, .L104+12
	strgt	r0, [r3, #16]
	strhgt	r1, [r2, #24]	@ movhi
	pop	{r4, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	bullet
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	510
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateFruit
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFruit, %function
updateFruit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L119
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	sub	sp, sp, #16
	beq	.L107
	ldr	r3, .L119+4
	ldr	r3, [r3]
	sub	r3, r0, r3
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mov	lr, #97
	mvn	r3, r3, lsr #17
	ldr	r2, .L119+8
	ldr	r2, [r2]
	sub	r2, r1, r2
	ldr	ip, .L119+12
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	strh	r3, [ip, #8]	@ movhi
	strh	r2, [ip, #10]	@ movhi
	strh	lr, [ip, #12]	@ movhi
.L107:
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	ldr	r5, .L119+16
	str	r0, [sp, #4]
	str	r1, [sp]
	str	lr, [sp, #12]
	ldm	r5, {r0, r1, r2, r3}
	str	ip, [sp, #8]
	ldr	r6, .L119+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L106
	ldr	r3, .L119+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L106
	ldr	r3, .L119+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L106
	mov	r0, #512
	ldr	r2, [r5, #52]
	ldr	r1, .L119+12
	add	r2, r2, #1
	str	r3, [r4, #16]
	str	r2, [r5, #52]
	strh	r0, [r1, #8]	@ movhi
.L106:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L120:
	.align	2
.L119:
	.word	fruit
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.size	updateFruit, .-updateFruit
	.align	2
	.global	updateFruit2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFruit2, %function
updateFruit2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, [r0, #12]
	ldr	ip, [r0, #8]
	sub	sp, sp, #16
	ldr	lr, [r0, #4]
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	r5, .L135
	ldr	ip, [r4]
	ldm	r5, {r0, r1, r2, r3}
	stm	sp, {ip, lr}
	ldr	r6, .L135+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L121
	ldr	r3, .L135+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L121
	ldr	r3, .L135+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	ldreq	r2, [r5, #52]
	addeq	r2, r2, #1
	streq	r3, [r4, #16]
	streq	r2, [r5, #52]
.L121:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L136:
	.align	2
.L135:
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.size	updateFruit2, .-updateFruit2
	.align	2
	.global	updateCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCheat, %function
updateCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L150
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	sub	sp, sp, #16
	beq	.L138
	ldr	r3, .L150+4
	ldr	r3, [r3]
	sub	r3, r0, r3
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mov	lr, #98
	mvn	r3, r3, lsr #17
	ldr	r2, .L150+8
	ldr	r2, [r2]
	sub	r2, r1, r2
	ldr	ip, .L150+12
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	strh	r3, [ip, #80]	@ movhi
	strh	r2, [ip, #82]	@ movhi
	strh	lr, [ip, #84]	@ movhi
.L138:
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	ldr	r5, .L150+16
	str	r0, [sp, #4]
	str	r1, [sp]
	str	lr, [sp, #12]
	ldm	r5, {r0, r1, r2, r3}
	str	ip, [sp, #8]
	ldr	r6, .L150+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L137
	ldr	r3, .L150+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L137
	ldr	r3, .L150+28
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L137
	mov	r0, #512
	mov	r1, #1
	mov	r2, #6
	str	r3, [r4, #16]
	ldr	r3, .L150+12
	str	r1, [r5, #60]
	strh	r0, [r3, #80]	@ movhi
	ldr	r1, .L150+32
	ldr	r3, .L150+36
	ldr	lr, .L150+40
	ldr	ip, .L150+44
	ldr	r0, .L150+48
	strh	r2, [lr, #4]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	str	r1, [r3, #1668]
	str	r1, [r3, #1732]
.L137:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	cheat
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	oldButtons
	.word	buttons
	.word	393222
	.word	100712448
	.word	100714048
	.word	100714112
	.word	100714176
	.size	updateCheat, .-updateCheat
	.align	2
	.global	loseLife
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseLife, %function
loseLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L159
	ldr	r3, [r2, #44]
	cmp	r3, #3
	str	lr, [sp, #-4]!
	beq	.L157
	cmp	r3, #2
	beq	.L158
	cmp	r3, #1
	moveq	r3, #0
	ldr	lr, [sp], #4
	streq	r3, [r2, #44]
	bx	lr
.L158:
	mov	r3, #1
	mov	lr, #31
	mov	r0, #0
	mov	r1, #512
	str	r3, [r2, #44]
	ldr	ip, .L159+4
	ldr	r2, .L159+8
	ldr	r3, .L159+12
	strh	lr, [ip, #36]	@ movhi
	str	r0, [r2, #80]
	strh	r1, [r3, #40]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L157:
	mov	lr, #0
	mov	r0, #2
	mov	r1, #512
	ldr	ip, .L159+8
	ldr	r3, .L159+12
	str	lr, [ip, #16]
	str	r0, [r2, #44]
	strh	r1, [r3, #32]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L160:
	.align	2
.L159:
	.word	player
	.word	83886592
	.word	life
	.word	shadowOAM
	.size	loseLife, .-loseLife
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L274
	ldrh	r1, [r6]
	ldr	r4, .L274+4
	ldr	r7, .L274+8
	tst	r1, #16
	ldm	r4, {r3, ip}
	ldr	r0, [r7]
	bne	.L162
	add	lr, r3, #8
	add	r2, r0, ip, lsl #9
	ldrb	r2, [r2, lr]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L265
.L162:
	tst	r1, #32
	bne	.L164
	sub	lr, r3, #1
	add	r2, r0, ip, lsl #9
	ldrb	r2, [r2, lr]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L266
.L164:
	ldr	r5, .L274+12
	ldrh	r2, [r5]
	tst	r2, #64
	ldr	lr, [r4, #24]
	beq	.L165
	ands	r2, r1, #64
	bne	.L165
	sub	r8, ip, #1
	add	r8, r0, r8, lsl #9
	ldrb	r1, [r8, r3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L165
	ldr	r1, [r4, #56]
	cmp	r1, #0
	ble	.L165
	ldr	r3, .L274+16
	cmp	lr, #0
	ldr	r1, [r3]
	beq	.L166
	ldr	r3, .L274+20
	ldr	r0, .L274+24
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, [r4, #60]
	cmp	r2, #0
	str	r3, [r4, #28]
	ldreq	r3, [r4, #56]
	subeq	r3, r3, #1
	streq	r3, [r4, #56]
.L167:
	ldr	r3, [r4]
	ldr	r2, [r4, #8]
	ldr	r1, [r4, #24]
	add	r2, r3, r2
	cmp	r1, #0
	ldr	r0, [r7]
	ldr	ip, [r4, #4]
	sub	r2, r2, #1
	beq	.L171
	ldr	lr, .L274+28
	ldr	r1, .L274+32
	ldr	lr, [lr]
	b	.L169
.L165:
	ldr	r1, [r4, #8]
	cmp	lr, #0
	add	r2, r3, r1
	sub	r2, r2, #1
	bne	.L267
.L171:
	add	r1, ip, #9
	add	r1, r0, r1, lsl #9
	ldrb	lr, [r1, r3]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L174
	ldrb	r1, [r1, r2]	@ zero_extendqisi2
	cmp	r1, #0
	addne	ip, ip, #2
	strne	ip, [r4, #4]
.L174:
	add	r1, ip, #8
	add	lr, r0, r1, lsl #9
	ldrb	lr, [lr, r3]	@ zero_extendqisi2
	add	r7, r2, r1, lsl #9
	cmp	lr, #0
	lsl	r1, r1, #9
	add	lr, r0, r7
	beq	.L175
	ldrb	r7, [r0, r7]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L175
	add	ip, ip, #1
	str	ip, [r4, #4]
	b	.L173
.L267:
	ldr	r1, [r4, #28]
	ldr	lr, .L274+28
	cmp	r1, #0
	ldr	lr, [lr]
	bne	.L268
	ldr	r7, .L274+32
	ldr	r7, [r7]
	sub	lr, lr, r7
	cmp	lr, #13
	ble	.L170
	str	r1, [r4, #24]
.L173:
	add	r1, ip, #8
	add	lr, r2, r1, lsl #9
	add	r8, r0, r1, lsl #9
	ldrb	r7, [r0, lr]	@ zero_extendqisi2
	ldrb	r8, [r8, r3]	@ zero_extendqisi2
	cmp	r7, #0
	cmpne	r8, #0
	add	lr, r0, lr
	lsl	r1, r1, #9
	beq	.L175
.L176:
	add	r7, ip, #9
	add	r2, r2, r7, lsl #9
	add	r9, r0, r7, lsl #9
	ldrb	r8, [r0, r2]	@ zero_extendqisi2
	ldrb	r9, [r9, r3]	@ zero_extendqisi2
	cmp	r8, #0
	cmpne	r9, #0
	moveq	r8, #2
	add	r3, r3, #4
	streq	r8, [r4, #56]
	add	r3, r0, r3
	add	r2, r0, r2
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
	ldrb	r1, [lr]	@ zero_extendqisi2
	cmp	r1, #0
	cmpne	r0, #0
	moveq	r1, #2
	streq	r1, [r4, #56]
	ldrb	r1, [r3, r7, lsl #9]	@ zero_extendqisi2
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r3, #0
	cmpne	r1, #0
	moveq	r3, #2
	streq	r3, [r4, #56]
	cmp	ip, #244
	ldr	r7, .L274+36
	bgt	.L262
.L180:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldr	r2, [r7]
	ldr	r1, [r4]
	beq	.L183
	ldrh	r3, [r5]
	tst	r3, #2
	bne	.L269
.L183:
	cmp	r2, #2
	beq	.L270
.L184:
	cmp	r2, #3
	beq	.L271
.L185:
	ldr	r3, .L274+40
	ldr	r3, [r3]
	ldr	r0, [r4, #24]
	sub	r3, r1, r3
	lsl	r3, r3, #23
	ldr	r1, .L274+44
	lsr	r3, r3, #23
	cmp	r0, #0
	strh	r3, [r1, #2]	@ movhi
	movne	r3, #65
	ldr	r2, .L274+48
	ldr	ip, [r2]
	ldr	r2, [r4, #4]
	sub	r2, r2, ip
	and	r2, r2, #255
	strh	r2, [r1]	@ movhi
	strhne	r3, [r1, #4]	@ movhi
	bne	.L161
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L188
	mov	r3, #67
	str	r0, [r4, #32]
	strh	r3, [r1, #4]	@ movhi
.L161:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L266:
	ldr	r2, [r4, #12]
	add	r2, ip, r2
	sub	r2, r2, #1
	add	r2, r0, r2, lsl #9
	ldrb	r2, [r2, lr]	@ zero_extendqisi2
	cmp	r2, #0
	cmpne	r3, #0
	movgt	r2, #1
	movgt	r3, lr
	strgt	lr, [r4]
	strgt	r2, [r4, #32]
	b	.L164
.L265:
	ldr	r2, [r4, #12]
	add	r2, ip, r2
	sub	r2, r2, #1
	add	r2, r0, r2, lsl #9
	ldrb	r2, [r2, lr]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L162
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L264
	ldr	r2, .L274+52
	cmp	r3, r2
	bgt	.L162
.L264:
	mov	r2, #1
	add	r3, r3, r2
	str	r3, [r4]
	str	r2, [r4, #36]
	b	.L162
.L175:
	mov	r7, #2
	str	r7, [r4, #56]
	b	.L176
.L270:
	ldr	r3, [r4, #8]
	add	r3, r1, r3
	cmp	r3, #512
	blt	.L185
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L185
	bl	goToGame2
	mov	r3, #3
	ldr	r1, [r4]
	str	r3, [r7]
	b	.L185
.L262:
	bl	loseLife
	ldr	r2, [r7]
	cmp	r2, #2
	beq	.L272
	cmp	r2, #3
	beq	.L273
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldr	r1, [r4]
	beq	.L185
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L185
	ldrh	r3, [r6]
	tst	r3, #2
	bne	.L184
	b	.L191
.L268:
	ldr	r1, .L274+32
.L169:
	mov	r7, #0
	str	lr, [r1]
	str	r7, [r4, #28]
.L170:
	sub	lr, ip, #1
	add	r1, r0, lr, lsl #9
	ldrb	r7, [r1, r3]	@ zero_extendqisi2
	cmp	r7, #0
	add	r1, r1, r3
	beq	.L173
	ldrb	r1, [r1, #7]	@ zero_extendqisi2
	cmp	r1, #0
	movne	ip, lr
	strne	lr, [r4, #4]
	b	.L173
.L188:
	ldr	r2, [r4, #36]
	cmp	r2, #0
	movne	r2, #66
	moveq	r3, #68
	strne	r3, [r4, #36]
	strhne	r2, [r1, #4]	@ movhi
	strheq	r3, [r1, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L271:
	ldr	r3, [r4, #8]
	add	r3, r1, r3
	cmp	r3, #512
	blt	.L185
	ldr	r3, [r4, #52]
	cmp	r3, #2
	ble	.L185
	bl	initialize
	mov	r3, #5
	ldr	r1, [r4]
	str	r3, [r7]
	b	.L185
.L269:
	ldrh	r3, [r6]
	tst	r3, #2
	bne	.L183
.L191:
	mov	ip, #2
	mov	lr, #1
	ldr	r0, [r4, #4]
	ldr	r3, .L274+56
	add	r0, r0, #3
	str	r0, [r3, #4]
	str	r1, [r3]
	str	lr, [r3, #16]
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	b	.L183
.L272:
	bl	resetGame
	b	.L180
.L273:
	bl	resetGame2
	b	.L180
.L166:
	mov	r2, lr
	ldr	r0, .L274+24
	ldr	r3, .L274+20
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r3, [r4, #60]
	cmp	r3, #0
	ldreq	r3, [r4, #56]
	ldr	r1, .L274+28
	subeq	r3, r3, #1
	streq	r3, [r4, #56]
	ldr	r0, [r4, #28]
	ldr	r3, [r4]
	ldr	r2, [r4, #8]
	ldr	lr, [r1]
	ldr	r1, .L274+32
	add	r2, r3, r2
	cmp	r0, #0
	str	ip, [r4, #24]
	ldr	r0, [r7]
	str	lr, [r1]
	ldr	ip, [r4, #4]
	sub	r2, r2, #1
	bne	.L169
	b	.L170
.L275:
	.align	2
.L274:
	.word	buttons
	.word	player
	.word	collisionMap
	.word	oldButtons
	.word	jumpSound_length
	.word	playSoundB
	.word	jumpSound_data
	.word	time
	.word	jumpStart
	.word	state
	.word	hOff
	.word	shadowOAM
	.word	vOff
	.word	510
	.word	bullet
	.size	updatePlayer, .-updatePlayer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.0, %function
updateEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L303
	ldr	r3, [r3]
	ands	r3, r3, #3
	mov	r4, r0
	ldr	r2, [r0]
	ldr	r1, [r0, #4]
	ldr	ip, [r0, #12]
	ldr	lr, [r0, #8]
	sub	sp, sp, #20
	bne	.L277
	ldr	r0, [r0, #32]
	cmp	r0, #0
	beq	.L278
	ldr	r0, .L303+4
	add	r6, r1, ip
	ldr	r5, [r0]
	add	r0, r6, #1
	add	r0, r5, r0, lsl #9
	add	r7, r0, r2
	ldrb	r7, [r7, #1]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L279
	mov	r7, #1
	str	r3, [r4, #32]
	str	r7, [r4, #36]
.L280:
	add	r3, r2, lr
	add	r0, r0, r3
	ldrb	r0, [r0, #1]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L281
	sub	r6, r6, #3
	add	r5, r5, r6, lsl #9
	add	r5, r5, r3
	ldrb	r3, [r5, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r2, r2, #1
	strne	r2, [r4]
	bne	.L277
.L281:
	mov	r0, #1
	mov	r3, #0
	str	r0, [r4, #32]
	str	r3, [r4, #36]
.L277:
	stmib	sp, {r1, lr}
	str	ip, [sp, #12]
	str	r2, [sp]
	ldr	r0, .L303+8
	ldr	r6, .L303+12
	ldm	r0, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L300
.L284:
	ldr	r5, .L303+16
	ldr	r3, [r5, #16]
	cmp	r3, #0
	bne	.L301
.L276:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L279:
	sub	r2, r2, #1
	str	r2, [r4]
.L278:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L277
	ldr	r3, .L303+4
	add	r6, r1, ip
	ldr	r5, [r3]
	add	r0, r6, #1
	add	r0, r5, r0, lsl #9
	b	.L280
.L301:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L276
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L303+20
	str	r3, [r5, #16]
	str	r3, [r4, #16]
	strh	r1, [r2, #24]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L300:
	bl	loseLife
	ldr	r3, .L303+24
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L302
	cmp	r3, #3
	bne	.L284
	bl	resetGame2
	b	.L284
.L302:
	bl	resetGame
	b	.L284
.L304:
	.align	2
.L303:
	.word	time
	.word	collisionMap
	.word	player
	.word	collision
	.word	bullet
	.word	shadowOAM
	.word	state
	.size	updateEnemy.part.0, .-updateEnemy.part.0
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.0
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L334
	bl	updatePlayer
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy.part.0
.L308:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ldrne	r0, .L334+4
	blne	updateEnemy.part.0
.L309:
	ldr	r3, [r4, #144]
	cmp	r3, #0
	ldrne	r0, .L334+8
	blne	updateEnemy.part.0
.L310:
	bl	updatewand
	bl	updateBullet
	bl	updateFruit
	bl	updateCheat
	ldr	r3, .L334+12
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L331
.L311:
	ldr	r0, .L334+16
	add	r1, r0, #8
	ldm	r1, {r1, r2}
	ldr	r3, [r0]
	rsb	r1, r1, #240
	add	r1, r1, r1, lsr #31
	ldr	r0, [r0, #4]
	rsb	r2, r2, #160
	sub	r3, r3, r1, asr #1
	ldr	ip, .L334+20
	ldr	r1, .L334+24
	add	r2, r2, r2, lsr #31
	sub	r2, r0, r2, asr #1
	cmp	r3, #0
	str	r3, [ip]
	str	r2, [r1]
	blt	.L332
	cmp	r2, #0
	blt	.L333
	cmp	r3, #272
	movgt	r0, #272
	strgt	r0, [ip]
.L313:
	cmp	r2, #96
	movgt	r2, #96
	strgt	r2, [r1]
.L317:
	cmn	r3, #2
	bge	.L318
	mov	r2, #0
	ldr	r3, .L334+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L333:
	mov	r2, #0
	cmp	r3, #272
	str	r2, [r1]
	movgt	r2, #272
	strgt	r2, [ip]
.L318:
	ldr	r2, .L334+32
	smull	r1, r2, r3, r2
	ldr	r1, .L334+36
	cmp	r3, r1
	sub	r3, r2, r3, asr #31
	movgt	r2, #272
	ldrle	r2, .L334+28
	ldrgt	r3, .L334+28
	strle	r3, [r2]
	strgt	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L332:
	mov	r0, #0
	cmp	r2, r0
	str	r0, [ip]
	strlt	r0, [r1]
	bge	.L313
	b	.L317
.L331:
	bl	updateFruit2
	ldr	r0, .L334+40
	bl	updateFruit2
	ldr	r0, .L334+44
	bl	updateFruit2
	b	.L311
.L335:
	.align	2
.L334:
	.word	enemy
	.word	enemy+64
	.word	enemy+128
	.word	state
	.word	player
	.word	hOff
	.word	vOff
	.word	hOff2
	.word	1431655766
	.word	818
	.word	fruit2
	.word	fruit2+64
	.size	update, .-update
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L344
	push	{r4, lr}
	ldr	r2, .L344+4
	ldr	r4, .L344+8
	ldr	lr, .L344+12
	add	r0, r3, #24
.L338:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L337
	ldr	r1, [r2]
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	and	r1, r1, r4
	strh	lr, [r3, #36]	@ movhi
	strh	r1, [r3, #34]	@ movhi
	strh	ip, [r3, #32]	@ movhi
.L337:
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #64
	bne	.L338
	pop	{r4, lr}
	bx	lr
.L345:
	.align	2
.L344:
	.word	shadowOAM
	.word	life
	.word	511
	.word	4167
	.size	drawLives, .-drawLives
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #512
	mov	fp, #0
	mov	r9, #77
	mov	r10, #76
	ldr	r2, .L358
	ldr	r1, .L358+4
	ldr	r3, .L358+8
	ldrh	r7, [r2]
	ldrh	r8, [r1]
	ldr	r2, .L358+12
	ldr	r6, .L358+16
	ldr	r5, .L358+20
	add	ip, r3, #24
.L353:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	strheq	r4, [r3, #56]	@ movhi
	beq	.L349
	ldr	r1, [r2, #48]
	cmp	r1, #29
	bls	.L356
	sub	r0, r1, #30
	cmp	r0, #29
	bhi	.L350
	ldr	r0, [r2, #4]
	ldr	lr, [r2]
	sub	r0, r0, r8
	and	r0, r0, #255
	sub	lr, lr, r7
	add	r1, r1, #1
	orr	r0, r0, r6
	and	lr, lr, r5
	str	r1, [r2, #48]
	strh	r10, [r3, #60]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	lr, [r3, #58]	@ movhi
.L349:
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #64
	bne	.L353
.L357:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L350:
	sub	r0, r1, #60
	cmp	r0, #29
	bhi	.L351
.L356:
	ldr	r0, [r2, #4]
	ldr	lr, [r2]
	sub	r0, r0, r8
	and	r0, r0, #255
	sub	lr, lr, r7
	add	r1, r1, #1
	orr	r0, r0, r6
	and	lr, lr, r5
	str	r1, [r2, #48]
	add	r3, r3, #8
	strh	r9, [r3, #52]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	strh	lr, [r3, #50]	@ movhi
	cmp	r3, ip
	add	r2, r2, #64
	bne	.L353
	b	.L357
.L351:
	sub	r0, r1, #90
	cmp	r0, #28
	strhi	fp, [r2, #48]
	bhi	.L349
	add	r1, r1, #1
	str	r1, [r2, #48]
	mov	r1, #78	@ movhi
	ldr	r0, [r2, #4]
	ldr	lr, [r2]
	sub	r0, r0, r8
	and	r0, r0, #255
	sub	lr, lr, r7
	orr	r0, r0, r6
	and	lr, lr, r5
	strh	r1, [r3, #60]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	lr, [r3, #58]	@ movhi
	b	.L349
.L359:
	.align	2
.L358:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	enemy
	.word	-32768
	.word	511
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawFruit2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFruit2, %function
drawFruit2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L379
	ldr	r3, .L379+4
	ldr	ip, .L379+8
	ldrh	r0, [r3]
	ldr	r2, [r1, #68]
	ldr	r3, [r1, #4]
	push	{r4, r5, r6, r7, r8, lr}
	ldrh	r7, [ip]
	ldr	r6, [r1, #16]
	ldr	lr, [r1, #64]
	ldr	ip, [r1]
	ldr	r4, .L379+12
	ldr	r5, .L379+16
	sub	r2, r2, r0
	sub	r3, r3, r0
	ldr	r0, .L379+20
	sub	lr, lr, r7
	sub	ip, ip, r7
	and	r2, r2, #255
	cmp	r6, #0
	and	lr, lr, r4
	and	ip, ip, r4
	ldrh	r8, [r0, #98]
	ldr	r4, [r5]
	ldrh	r7, [r0, #100]
	ldrh	r6, [r0, #90]
	ldrh	r5, [r0, #92]
	orr	r2, r2, #32768
	beq	.L364
	cmp	r4, #3
	beq	.L378
.L364:
	mov	ip, #512
	ldr	r3, [r1, #80]
	cmp	r3, #0
	strh	ip, [r0, #88]	@ movhi
	beq	.L363
	cmp	r4, #3
	mov	r3, #0
	beq	.L365
.L363:
	mov	r2, #512
	mov	r1, #0
	strh	r2, [r0, #96]	@ movhi
.L366:
	cmp	r3, #0
	strhne	r6, [r0, #90]	@ movhi
	strhne	r5, [r0, #92]	@ movhi
	cmp	r1, #0
	strhne	r8, [r0, #98]	@ movhi
	strhne	r7, [r0, #100]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L378:
	ldr	r1, [r1, #80]
	and	r3, r3, #255
	orr	r3, r3, #32768
	cmp	r1, #0
	strh	r3, [r0, #88]	@ movhi
	mov	r6, ip
	mov	r5, #97
	mov	r3, #1
	beq	.L363
.L365:
	mov	r8, lr
	mov	r7, #97
	mov	r1, #1
	strh	r2, [r0, #96]	@ movhi
	b	.L366
.L380:
	.align	2
.L379:
	.word	fruit2
	.word	vOff
	.word	hOff
	.word	511
	.word	state
	.word	shadowOAM
	.size	drawFruit2, .-drawFruit2
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L389
	ldrh	r1, [r3]
	ldr	r3, .L389+4
	push	{r4, lr}
	strh	r1, [r2, #24]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L389+8
	strh	r1, [r2, #26]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L389+12
	strh	r1, [r2, #20]	@ movhi
	ldrh	r1, [r3]
	ldr	r3, .L389+16
	strh	r1, [r2, #22]	@ movhi
	ldr	r4, .L389+20
	ldr	r2, .L389+24
	ldr	lr, .L389+28
	add	r0, r3, #24
.L383:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	beq	.L382
	ldr	r1, [r2]
	ldrb	ip, [r2, #4]	@ zero_extendqisi2
	and	r1, r1, r4
	strh	lr, [r3, #36]	@ movhi
	strh	r1, [r3, #34]	@ movhi
	strh	ip, [r3, #32]	@ movhi
.L382:
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #64
	bne	.L383
	bl	drawEnemy
	ldr	r4, .L389+32
	bl	drawFruit2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L389+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L390:
	.align	2
.L389:
	.word	hOff
	.word	vOff
	.word	hOff2
	.word	vOff2
	.word	shadowOAM
	.word	511
	.word	life
	.word	4167
	.word	DMANow
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	ldr	r3, .L456
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, .L456+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r0, #67108864
	mov	r1, r2
	ldr	r8, .L456+8
	ldr	r4, .L456+12
	str	r2, [r8]
	ldr	r10, .L456+16
	strh	r2, [r0, #24]	@ movhi
	strh	r2, [r0, #26]	@ movhi
	mov	r6, r0
	ldr	r5, .L456+20
	ldrh	r0, [r4]
	str	r2, [r10]
	ldr	r9, .L456+24
	ldr	fp, .L456+28
	ldr	r7, .L456+32
.L417:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r7, #48]
	strh	r3, [r4]	@ movhi
	cmp	r1, #6
	ldrls	pc, [pc, r1, asl #2]
	b	.L418
.L394:
	.word	.L400
	.word	.L399
	.word	.L397
	.word	.L397
	.word	.L396
	.word	.L395
	.word	.L393
.L397:
	tst	r0, #8
	beq	.L408
	tst	r3, #8
	beq	.L447
.L408:
	ldr	r3, [fp, #44]
	cmp	r3, #0
	beq	.L448
.L409:
	ldr	r3, .L456+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L456+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L456+44
	mov	lr, pc
	bx	r3
	ldrh	r0, [r4]
	ldr	r1, [r8]
.L392:
	ldr	r3, [r10]
	add	r3, r3, #1
	str	r3, [r10]
	b	.L417
.L393:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L416
	ldrh	r3, [r4]
	ands	r3, r3, #8
	beq	.L449
.L416:
	mov	r2, #0
	mov	r3, #320
	ldr	r1, [r8]
	strh	r2, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	ldrh	r0, [r4]
	b	.L392
.L395:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L414
	ldrh	r3, [r4]
	ands	r3, r3, #8
	beq	.L450
.L414:
	mov	r2, #240
.L440:
	mov	r3, #160
	ldr	r1, [r8]
	strh	r2, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	ldrh	r0, [r4]
	b	.L392
.L396:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L410
	ldrh	r2, [r4]
	tst	r2, #8
	beq	.L451
.L410:
	tst	r3, #4
	beq	.L412
	ldrh	r3, [r4]
	ands	r3, r3, #4
	beq	.L452
.L412:
	mov	r2, #0
	b	.L440
.L452:
	str	r3, [sp, #4]
	ldr	r3, .L456+4
	mov	lr, pc
	bx	r3
	mov	r2, #160
.L439:
	ldr	r3, [sp, #4]
	str	r3, [r8]
	strh	r3, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	strh	r3, [r6, #24]	@ movhi
.L438:
	strh	r2, [r6, #26]	@ movhi
	ldrh	r2, [r4]
	ldr	r3, [r10]
	strh	r2, [r5]	@ movhi
	add	r3, r3, #1
	str	r3, [r10]
	ldrh	r3, [r7, #48]
	strh	r3, [r4]	@ movhi
.L400:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L401
	ldrh	r2, [r4]
	tst	r2, #8
	beq	.L453
.L401:
	tst	r3, #1
	beq	.L403
	ldrh	r3, [r4]
	ands	r3, r3, #1
	bne	.L403
	mov	r2, #1
	str	r2, [r8]
	strh	r3, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	ldrh	r2, [r4]
	ldr	r3, [r10]
	strh	r2, [r5]	@ movhi
	add	r3, r3, #1
	str	r3, [r10]
	ldrh	r3, [r7, #48]
	strh	r3, [r4]	@ movhi
.L399:
	mov	lr, pc
	bx	r9
	ldrh	r3, [r5]
	tst	r3, #32
	beq	.L404
	ldrh	r2, [r4]
	ands	r2, r2, #32
	beq	.L454
.L404:
	tst	r3, #16
	beq	.L405
	ldrh	r3, [r4]
	tst	r3, #16
	beq	.L455
.L405:
	mov	r2, #240
	mov	r3, #0
	strh	r2, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	ldr	r1, [r8]
	ldrh	r0, [r4]
	b	.L392
.L403:
	mov	r3, #0
	ldr	r1, [r8]
	strh	r3, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	ldrh	r0, [r4]
	b	.L392
.L448:
	ldr	r3, .L456+4
	mov	lr, pc
	bx	r3
	mov	r3, #6
	str	r3, [r8]
	b	.L409
.L447:
	ldr	r3, .L456+48
	mov	lr, pc
	bx	r3
	b	.L408
.L453:
	ldr	r3, .L456+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L456+56
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L456+60
	ldr	r3, .L456+64
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L401
.L451:
	ldr	r3, .L456+56
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L456+60
	ldr	r3, .L456+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L456+68
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L410
.L455:
	ldr	r3, .L456+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L456+56
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L456+60
	ldr	r3, .L456+64
	mov	lr, pc
	bx	r3
	b	.L405
.L454:
	ldr	r3, .L456+4
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #4]
	str	r2, [r8]
	strh	r2, [r6, #24]	@ movhi
	strh	r2, [r6, #26]	@ movhi
	ldrh	r3, [r5]
	b	.L404
.L450:
	str	r3, [sp, #4]
	ldr	r3, .L456+4
	mov	lr, pc
	bx	r3
	mov	r1, #240
	ldr	r3, [sp, #4]
	mov	r2, #160
	str	r3, [r8]
	strh	r3, [r6, #24]	@ movhi
	strh	r3, [r6, #26]	@ movhi
	strh	r1, [r6, #24]	@ movhi
	b	.L438
.L449:
	str	r3, [sp, #4]
	ldr	r3, .L456+4
	mov	lr, pc
	bx	r3
	mov	r2, #320
	b	.L439
.L418:
	mov	r0, r3
	b	.L392
.L457:
	.align	2
.L456:
	.word	mgba_open
	.word	initialize
	.word	state
	.word	buttons
	.word	time
	.word	oldButtons
	.word	stopSounds
	.word	player
	.word	67109120
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	goToPause
	.word	goToGame
	.word	gameMusic_length
	.word	gameMusic_data
	.word	playSoundA
	.word	pauseToGame
	.size	main, .-main
	.comm	sbb,4,4
	.comm	vOff2,4,4
	.comm	hOff2,4,4
	.comm	game,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	state,4,4
	.comm	jumpStart,4,4
	.comm	time,4,4
	.comm	fruit2,128,4
	.comm	cheat,64,4
	.comm	fruit,64,4
	.comm	life,192,4
	.comm	enemy,192,4
	.comm	bullet,24,4
	.comm	wand,24,4
	.comm	player,64,4
	.comm	collisionMap,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
