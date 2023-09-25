	.file	"flash_TC3xx.c"
.section .text,"ax",@progbits
.Ltext0:
	.align 1
	.global	start
	.type	start, @function
start:
.LFB0:
	.file 1 "flash_TC3xx.c"
	.loc 1 34 0
	.loc 1 35 0
#APP
	# 35 "flash_TC3xx.c" 1
	.global _start
	# 0 "" 2
	.loc 1 36 0
	# 36 "flash_TC3xx.c" 1
	 _start:	 nop
	# 0 "" 2
	.loc 1 37 0
	# 37 "flash_TC3xx.c" 1
	 nop
	# 0 "" 2
	.loc 1 38 0
	# 38 "flash_TC3xx.c" 1
	 movh.a   %a10,hi:(0x70004000)
	# 0 "" 2
	.loc 1 39 0
	# 39 "flash_TC3xx.c" 1
	 lea      %a10,[%a10]lo:(0x70004000)
	# 0 "" 2
	.loc 1 40 0
	# 40 "flash_TC3xx.c" 1
	 ja flashing
	# 0 "" 2
#NO_APP
	ret
.LFE0:
	.size	start, .-start
	.align 1
	.global	flashing
	.type	flashing, @function
flashing:
.LFB1:
	.loc 1 44 0
.LVL0:
	.loc 1 55 0
	mov	%d15, 62
	movh.a	%a15, 63492
	lea	%a15, [%a15] 56
	st.w	[%a15]0, %d15
	.loc 1 56 0
	ld.w	%d15, [%a4] 16
	.loc 1 44 0
	lea	%SP, [%SP] -296
.LCFI0:
	.loc 1 56 0
	jeq	%d15, 1, .L69
.LVL1:
.L3:
	.loc 1 117 0
	jeq	%d15, 2, .L70
	.loc 1 145 0
	jeq	%d15, 3, .L71
.L31:
	.loc 1 227 0
	mov	%d15, 256
	st.w	[%a4] 16, %d15
	.loc 1 228 0
#APP
	# 228 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
	.loc 1 230 0
#NO_APP
	mov	%d2, 0
	ret
.LVL2:
.L69:
	.loc 1 58 0
	mov	%d15, 256
	.loc 1 62 0
	movh	%d2, 36608
	movh	%d3, 32768
	.loc 1 58 0
	st.w	[%a4] 16, %d15
	.loc 1 59 0
	ld.w	%d15, [%a4] 8
	st.w	[%SP] 16, %d15
	.loc 1 61 0
	mov	%d15, 0
	.loc 1 60 0
	ld.a	%a3, [%a4] 20
.LVL3:
	.loc 1 61 0
	st.w	[%SP] 32, %d15
	.loc 1 62 0
	ld.w	%d15, [%a4]0
	and	%d15, %d2
	jeq	%d15, %d3, .L72
	.loc 1 63 0
	jne	%d15, %d2, .L5
	.loc 1 63 0 is_stmt 0 discriminator 1
	mov	%d15, 8
	st.w	[%SP] 32, %d15
.L5:
	.loc 1 64 0 is_stmt 1
	ld.w	%d15, [%SP] 32
	jnz	%d15, .L6
	.loc 1 64 0 is_stmt 0 discriminator 1
#APP
	# 64 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
.L6:
	.loc 1 65 0 is_stmt 1
	ld.w	%d15, [%a4] 12
	.loc 1 73 0
	movh.a	%a15, 44800
	.loc 1 82 0
	movh.a	%a14, 44800
	.loc 1 84 0
	movh.a	%a13, 44800
	.loc 1 88 0
	movh.a	%a12, 44801
	.loc 1 90 0
	movh.a	%a7, 44801
	.loc 1 92 0
	movh.a	%a2, 44801
	.loc 1 99 0
	movh	%d10, 63492
	.loc 1 67 0
	mov	%d2, 0
	.loc 1 73 0
	lea	%a15, [%a15] 21844
	mov	%d8, 80
	.loc 1 74 0
	mov	%d1, 93
	.loc 1 82 0
	lea	%a14, [%a14] 22000
	.loc 1 84 0
	lea	%a13, [%a13] 22004
	.loc 1 88 0
	lea	%a12, [%a12] -21936
	.loc 1 90 0
	lea	%a7, [%a7] -21928
	.loc 1 92 0
	lea	%a2, [%a2] -21848
	mov	%d0, 160
	.loc 1 94 0
	mov	%d7, 166
	.loc 1 97 0
	mov	%d6, 16384
	.loc 1 99 0
	addi	%d10, %d10, 16
	.loc 1 101 0
	mov	%d4, 250
	.loc 1 103 0
	mov	%d5, 256
	.loc 1 65 0
	jz	%d15, .L19
.LVL4:
.L52:
	.loc 1 67 0
	st.w	[%SP] 8, %d2
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 32
	jge.u	%d9, %d3, .L10
.L11:
	.loc 1 69 0 discriminator 3
	ld.w	%d9, [%SP] 8
	lea	%a6, [%SP] 296
	addsc.a	%a5, %a6, %d9, 2
	ld.w	%d3, [%a3+]4
.LVL5:
	st.w	[%a5] -256, %d3
.LVL6:
	.loc 1 67 0 discriminator 3
	ld.w	%d3, [%SP] 8
	.loc 1 71 0 discriminator 3
	add	%d15, -4
	.loc 1 67 0 discriminator 3
	add	%d3, 1
	st.w	[%SP] 8, %d3
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 32
	jlt.u	%d9, %d3, .L11
	st.w	[%a4] 12, %d15
.L10:
	.loc 1 73 0
	ld.w	%d3, [%SP] 32
	ne	%d3, %d3, 64
	jnz	%d3, .L12
	.loc 1 73 0 is_stmt 0 discriminator 1
	st.w	[%a15]0, %d8
.L12:
	.loc 1 74 0 is_stmt 1
	ld.w	%d3, [%SP] 32
	ne	%d3, %d3, 8
	jnz	%d3, .L13
	.loc 1 74 0 is_stmt 0 discriminator 1
	st.w	[%a15]0, %d1
.L13:
	.loc 1 75 0 is_stmt 1
	st.w	[%SP] 8, %d2
	.loc 1 76 0
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 32
	jge.u	%d9, %d3, .L17
.L54:
	.loc 1 78 0
	ld.w	%d3, [%SP] 8
	lea	%a6, [%SP] 296
	addsc.a	%a5, %a6, %d3, 2
	ld.w	%d3, [%a5] -256
	st.w	[%SP] 24, %d3
	.loc 1 79 0
	ld.w	%d3, [%SP] 8
	add	%d3, 1
	st.w	[%SP] 8, %d3
	.loc 1 80 0
	ld.w	%d3, [%SP] 8
	addsc.a	%a5, %a6, %d3, 2
	ld.w	%d3, [%a5] -256
	st.w	[%SP] 28, %d3
	.loc 1 81 0
	ld.w	%d3, [%SP] 8
	add	%d3, 1
	st.w	[%SP] 8, %d3
	.loc 1 82 0
	ld.w	%d3, [%SP] 24
	st.w	[%a14]0, %d3
	.loc 1 83 0
#APP
	# 83 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 84 0
#NO_APP
	ld.w	%d3, [%SP] 28
	st.w	[%a13]0, %d3
	.loc 1 85 0
#APP
	# 85 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 76 0
#NO_APP
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 32
	jlt.u	%d9, %d3, .L54
.L17:
	.loc 1 88 0
	ld.w	%d3, [%SP] 16
	st.w	[%a12]0, %d3
	.loc 1 89 0
#APP
	# 89 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 90 0
#NO_APP
	st.w	[%a7]0, %d2
	.loc 1 91 0
#APP
	# 91 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 92 0
#NO_APP
	st.w	[%a2]0, %d0
	.loc 1 93 0
#APP
	# 93 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 94 0
#NO_APP
	st.w	[%a2]0, %d7
	.loc 1 95 0
#APP
	# 95 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 97 0
#NO_APP
	st.w	[%SP] 4, %d6
	ld.w	%d3, [%SP] 4
	jlez	%d3, .L16
.L53:
	.loc 1 99 0
	mov.a	%a5, %d10
	ld.w	%d3, [%a5]0
	st.w	[%SP] 20, %d3
	.loc 1 100 0
#APP
	# 100 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 101 0
#NO_APP
	ld.w	%d3, [%SP] 20
	and	%d3, %d3, 255
	jnz	%d3, .L20
	.loc 1 101 0 is_stmt 0 discriminator 1
	st.w	[%SP] 4, %d3
	st.w	[%a15]0, %d4
.L20:
	.loc 1 102 0 is_stmt 1
	ld.w	%d3, [%SP] 4
	jne	%d3, 1, .L21
	.loc 1 103 0
	ld.w	%d3, [%SP] 16
	st.w	[%a4] 8, %d3
	st.w	[%a4] 16, %d5
	st.w	[%a15]0, %d4
#APP
	# 103 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
.L21:
	.loc 1 97 0 discriminator 2
	ld.w	%d3, [%SP] 4
	add	%d3, -1
	st.w	[%SP] 4, %d3
	ld.w	%d3, [%SP] 4
	jgtz	%d3, .L53
.L16:
	.loc 1 106 0
	ld.w	%d9, [%SP] 32
	ld.w	%d3, [%SP] 16
	madd	%d3, %d3, %d9, 4
	st.w	[%SP] 16, %d3
	.loc 1 65 0
	jnz	%d15, .L52
.L19:
	.loc 1 108 0
	movh.a	%a15, 63492
	lea	%a15, [%a15] 52
	ld.w	%d15, [%a15]0
	and	%d15, %d15, 62
	jz	%d15, .L73
	.loc 1 109 0
	mov	%d15, 256
	st.w	[%a4] 16, %d15
.L22:
	.loc 1 110 0
	mov	%d2, 250
	movh.a	%a15, 44800
	lea	%a15, [%a15] 21844
	st.w	[%a15]0, %d2
	.loc 1 111 0
#APP
	# 111 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L3
.LVL7:
.L72:
	.loc 1 62 0 discriminator 1
	mov	%d15, 64
	st.w	[%SP] 32, %d15
	j	.L5
.LVL8:
.L73:
	.loc 1 109 0
	st.w	[%a4] 16, %d15
	mov	%d15, 0
	j	.L22
.LVL9:
.L71:
	.loc 1 148 0
	mov	%d15, 256
	.loc 1 149 0
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21936
	.loc 1 148 0
	st.w	[%a4] 16, %d15
	.loc 1 149 0
	ld.w	%d15, [%a4] 8
	st.w	[%a15]0, %d15
	.loc 1 150 0
#APP
	# 150 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 151 0
#NO_APP
	mov	%d15, 1
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21928
	st.w	[%a15]0, %d15
	.loc 1 152 0
#APP
	# 152 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 153 0
#NO_APP
	mov	%d15, 128
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21848
	st.w	[%a15]0, %d15
	.loc 1 154 0
#APP
	# 154 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 155 0
#NO_APP
	mov	%d15, 80
	st.w	[%a15]0, %d15
	.loc 1 156 0
#APP
	# 156 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 160 0
#NO_APP
	movh.a	%a15, 63492
	.loc 1 164 0
	movh.a	%a2, 63492
	.loc 1 159 0
	movh	%d2, 4
	.loc 1 160 0
	lea	%a15, [%a15] 16
	.loc 1 159 0
	mov	%d4, 0
	.loc 1 164 0
	lea	%a2, [%a2] 52
	.loc 1 166 0
	mov	%d3, 257
.L34:
	.loc 1 159 0
	st.w	[%SP] 8, %d4
	ld.w	%d15, [%SP] 8
	jge.u	%d15, %d2, .L35
.L51:
	.loc 1 159 0 is_stmt 0 discriminator 3
	ld.w	%d15, [%SP] 8
	add	%d15, 1
	st.w	[%SP] 8, %d15
	ld.w	%d15, [%SP] 8
	add	%d15, -1
	st.w	[%SP] 8, %d15
	ld.w	%d15, [%SP] 8
	add	%d15, 1
	st.w	[%SP] 8, %d15
	ld.w	%d15, [%SP] 8
	jlt.u	%d15, %d2, .L51
.L35:
	.loc 1 160 0 is_stmt 1
	ld.w	%d15, [%a15]0
	st.w	[%SP] 20, %d15
	.loc 1 161 0
#APP
	# 161 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 162 0
#NO_APP
	ld.w	%d15, [%a15]0
	and	%d15, %d15, 255
	jnz	%d15, .L34
	.loc 1 164 0
	ld.w	%d15, [%a2]0
	and	%d15, %d15, 62
	jz	%d15, .L36
	.loc 1 166 0
	st.w	[%a4] 16, %d3
	.loc 1 167 0
#APP
	# 167 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L34
.L70:
	.loc 1 119 0
	mov	%d15, 256
	.loc 1 120 0
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21936
	.loc 1 119 0
	st.w	[%a4] 16, %d15
	.loc 1 120 0
	ld.w	%d15, [%a4] 8
	st.w	[%a15]0, %d15
	.loc 1 121 0
#APP
	# 121 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 122 0
#NO_APP
	mov	%d15, 1
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21928
	st.w	[%a15]0, %d15
	.loc 1 123 0
#APP
	# 123 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 124 0
#NO_APP
	mov	%d15, 128
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21848
	st.w	[%a15]0, %d15
	.loc 1 125 0
#APP
	# 125 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 126 0
#NO_APP
	mov	%d15, 80
	st.w	[%a15]0, %d15
	.loc 1 127 0
#APP
	# 127 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 131 0
#NO_APP
	movh.a	%a15, 63492
	.loc 1 135 0
	movh.a	%a2, 63492
	.loc 1 130 0
	movh	%d2, 4
	.loc 1 131 0
	lea	%a15, [%a15] 16
	.loc 1 130 0
	mov	%d3, 0
	.loc 1 135 0
	lea	%a2, [%a2] 52
	.loc 1 136 0
	mov	%d4, 256
.L26:
	.loc 1 130 0
	st.w	[%SP] 8, %d3
	ld.w	%d15, [%SP] 8
	jge.u	%d15, %d2, .L27
.L48:
	.loc 1 130 0 is_stmt 0 discriminator 3
	ld.w	%d15, [%SP] 8
	add	%d15, 1
	st.w	[%SP] 8, %d15
	ld.w	%d15, [%SP] 8
	add	%d15, -1
	st.w	[%SP] 8, %d15
	ld.w	%d15, [%SP] 8
	add	%d15, 1
	st.w	[%SP] 8, %d15
	ld.w	%d15, [%SP] 8
	jlt.u	%d15, %d2, .L48
.L27:
	.loc 1 131 0 is_stmt 1
	ld.w	%d15, [%a15]0
	st.w	[%SP] 20, %d15
	.loc 1 132 0
#APP
	# 132 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 133 0
#NO_APP
	ld.w	%d15, [%a15]0
	and	%d15, %d15, 255
	jnz	%d15, .L26
	.loc 1 135 0
	ld.w	%d15, [%a2]0
	and	%d15, %d15, 62
	.loc 1 136 0
	cmov	%d15, %d15, %d4
	st.w	[%a4] 16, %d15
	.loc 1 137 0
#APP
	# 137 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L26
.L36:
	.loc 1 178 0
	mov	%d2, 128
	.loc 1 180 0
	ld.a	%a3, [%a4] 20
	.loc 1 185 0
	movh.a	%a15, 44800
	.loc 1 178 0
	st.w	[%SP] 36, %d2
	.loc 1 179 0
	mov	%d2, 8
	.loc 1 189 0
	movh.a	%a14, 44800
	.loc 1 193 0
	movh.a	%a13, 44800
	.loc 1 179 0
	st.w	[%SP] 32, %d2
	.loc 1 197 0
	movh.a	%a12, 44801
	.loc 1 199 0
	movh.a	%a7, 44801
	.loc 1 208 0
	movh.a	%a6, 63492
	.loc 1 171 0
	st.w	[%a4] 16, %d15
.LDL1:
.LVL10:
	.loc 1 181 0
	st.w	[%SP] 12, %d15
	.loc 1 184 0
	mov	%d0, 0
	.loc 1 185 0
	lea	%a15, [%a15] 21844
	mov	%d7, 93
	.loc 1 189 0
	lea	%a14, [%a14] 22000
	.loc 1 193 0
	lea	%a13, [%a13] 22004
	.loc 1 197 0
	lea	%a12, [%a12] -21936
	.loc 1 199 0
	lea	%a7, [%a7] -21928
	.loc 1 208 0
	lea	%a6, [%a6] 16
	.loc 1 210 0
	mov	%d2, 250
	.loc 1 212 0
	mov	%d3, 258
	.loc 1 184 0
	mov	%d6, 0
.L38:
	.loc 1 201 0
	movh.a	%a2, 44801
	.loc 1 217 0
	movh	%d4, 63492
	.loc 1 201 0
	lea	%a2, [%a2] -21848
	mov	%d8, 160
	.loc 1 204 0
	mov	%d1, 166
	.loc 1 206 0
	mov	%d5, 16384
	.loc 1 217 0
	addi	%d4, %d4, 52
.L44:
	.loc 1 182 0
	ld.w	%d9, [%SP] 12
	ld.w	%d15, [%SP] 36
	jge.u	%d9, %d15, .L74
	.loc 1 184 0
	st.w	[%SP] 8, %d6
	.loc 1 185 0
	st.w	[%a15]0, %d7
	.loc 1 186 0
	ld.w	%d9, [%SP] 8
	ld.w	%d15, [%SP] 32
	jge.u	%d9, %d15, .L42
.L50:
	.loc 1 188 0
	ld.w	%d15, [%SP] 12
	ld.w	%d9, [%SP] 8
	add	%d15, %d9
	addsc.a	%a5, %a3, %d15, 2
	ld.w	%d15, [%a5]0
	st.w	[%SP] 24, %d15
	.loc 1 189 0
	ld.w	%d15, [%SP] 24
	st.w	[%a14]0, %d15
	.loc 1 190 0
#APP
	# 190 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 191 0
#NO_APP
	ld.w	%d15, [%SP] 8
	add	%d15, 1
	st.w	[%SP] 8, %d15
	.loc 1 192 0
	ld.w	%d15, [%SP] 12
	ld.w	%d9, [%SP] 8
	add	%d15, %d9
	addsc.a	%a5, %a3, %d15, 2
	ld.w	%d15, [%a5]0
	st.w	[%SP] 28, %d15
	.loc 1 193 0
	ld.w	%d15, [%SP] 28
	st.w	[%a13]0, %d15
	.loc 1 194 0
#APP
	# 194 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 195 0
#NO_APP
	ld.w	%d15, [%SP] 8
	add	%d15, 1
	st.w	[%SP] 8, %d15
	.loc 1 186 0
	ld.w	%d9, [%SP] 8
	ld.w	%d15, [%SP] 32
	jlt.u	%d9, %d15, .L50
.L42:
	.loc 1 197 0
	ld.w	%d15, [%SP] 12
	ld.w	%d9, [%a4] 8
	madd	%d15, %d9, %d15, 4
	st.w	[%a12]0, %d15
	.loc 1 198 0
#APP
	# 198 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 199 0
#NO_APP
	st.w	[%a7]0, %d0
	.loc 1 200 0
#APP
	# 200 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 201 0
#NO_APP
	st.w	[%a2]0, %d8
	.loc 1 204 0
	st.w	[%a2]0, %d1
	.loc 1 205 0
#APP
	# 205 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 206 0
#NO_APP
	st.w	[%SP] 4, %d5
	ld.w	%d15, [%SP] 4
	jlez	%d15, .L41
.L49:
	.loc 1 208 0
	ld.w	%d15, [%a6]0
	st.w	[%SP] 20, %d15
	.loc 1 209 0
#APP
	# 209 "flash_TC3xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 210 0
#NO_APP
	ld.w	%d15, [%SP] 20
	and	%d15, %d15, 255
	jnz	%d15, .L45
	.loc 1 210 0 is_stmt 0 discriminator 1
	st.w	[%SP] 4, %d15
	st.w	[%a15]0, %d2
.L45:
	.loc 1 211 0 is_stmt 1
	ld.w	%d15, [%SP] 4
	jne	%d15, 1, .L46
	.loc 1 212 0
	ld.w	%d15, [%SP] 16
	st.w	[%a4] 8, %d15
	st.w	[%a4] 16, %d3
	st.w	[%a15]0, %d2
	.loc 1 213 0
#APP
	# 213 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
.L46:
	.loc 1 206 0 discriminator 2
	ld.w	%d15, [%SP] 4
	add	%d15, -1
	st.w	[%SP] 4, %d15
	ld.w	%d15, [%SP] 4
	jgtz	%d15, .L49
.L41:
	.loc 1 216 0
	ld.w	%d15, [%SP] 32
	ld.w	%d9, [%SP] 12
	.loc 1 217 0
	mov.a	%a5, %d4
	.loc 1 216 0
	add	%d15, %d9
	st.w	[%SP] 12, %d15
	.loc 1 217 0
	ld.w	%d15, [%a5]0
	and	%d15, %d15, 62
	jz	%d15, .L44
	.loc 1 219 0
	mov	%d15, 259
	st.w	[%a4] 16, %d15
	.loc 1 220 0
#APP
	# 220 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L38
.L74:
	.loc 1 224 0
#APP
	# 224 "flash_TC3xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L31
.LFE1:
	.size	flashing, .-flashing
.section .debug_frame,"",@progbits
.Lframe0:
	.uaword	.LECIE0-.LSCIE0
.LSCIE0:
	.uaword	0xffffffff
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 1
	.uleb128 0x1b
	.byte	0xc
	.uleb128 0x1a
	.uleb128 0
	.align 2
.LECIE0:
.LSFDE0:
	.uaword	.LEFDE0-.LASFDE0
.LASFDE0:
	.uaword	.Lframe0
	.uaword	.LFB0
	.uaword	.LFE0-.LFB0
	.align 2
.LEFDE0:
.LSFDE2:
	.uaword	.LEFDE2-.LASFDE2
.LASFDE2:
	.uaword	.Lframe0
	.uaword	.LFB1
	.uaword	.LFE1-.LFB1
	.byte	0x4
	.uaword	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x128
	.align 2
.LEFDE2:
.section .text,"ax",@progbits
.Letext0:
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x2f3
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2021-03-13 -mlicense-dir=e:\\aurix_mingw_install\\tricore_494_mingw\\bin\\../lib/gcc/tricore-elf/4.9.4/../../../../licenses -mtc161 -g3 -O2 -fno-peephole2 -fno-common -fno-short-enums -fsingle-precision-constant"
	.byte	0x1
	.string	"flash_TC3xx.c"
	.string	"E:\\\\AURIX_MINGW\\\\SRC\\\\aurix_flasher\\\\gdb_flash_drivers"
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uaword	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.string	"start"
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.uaword	.LFB0
	.uaword	.LFE0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x3
	.byte	0x1
	.string	"flashing"
	.byte	0x1
	.byte	0x2b
	.byte	0x1
	.uaword	0x27f
	.uaword	.LFB1
	.uaword	.LFE1
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x27f
	.uleb128 0x4
	.string	"parameter"
	.byte	0x1
	.byte	0x2b
	.uaword	0x286
	.byte	0x1
	.byte	0x64
	.uleb128 0x5
	.string	"notused"
	.byte	0x1
	.byte	0x2b
	.uaword	0x2a1
	.uaword	.LLST0
	.uleb128 0x6
	.string	"timeout"
	.byte	0x1
	.byte	0x2d
	.uaword	0x2b5
	.byte	0x3
	.byte	0x91
	.sleb128 -292
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x2e
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x6
	.string	"j"
	.byte	0x1
	.byte	0x2e
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x6
	.string	"addr_aligned"
	.byte	0x1
	.byte	0x2f
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x7
	.string	"data"
	.byte	0x1
	.byte	0x30
	.uaword	0x2cf
	.uaword	.LLST1
	.uleb128 0x6
	.string	"read"
	.byte	0x1
	.byte	0x30
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -276
	.uleb128 0x6
	.string	"low32bit"
	.byte	0x1
	.byte	0x31
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x6
	.string	"high32bit"
	.byte	0x1
	.byte	0x31
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -268
	.uleb128 0x6
	.string	"burst"
	.byte	0x1
	.byte	0x32
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x6
	.string	"len"
	.byte	0x1
	.byte	0x33
	.uaword	0x2ba
	.byte	0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x6
	.string	"burst_buffer"
	.byte	0x1
	.byte	0x34
	.uaword	0x2f1
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x8
	.string	"program_copy"
	.byte	0x1
	.byte	0xb1
	.uaword	.LDL1
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.byte	0x4
	.uaword	0x28c
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.string	"long unsigned int"
	.uleb128 0xa
	.byte	0x4
	.uaword	0x2a7
	.uleb128 0xa
	.byte	0x4
	.uaword	0x2ad
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.string	"char"
	.uleb128 0xb
	.uaword	0x27f
	.uleb128 0xb
	.uaword	0x2bf
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
	.uleb128 0xa
	.byte	0x4
	.uaword	0x2ba
	.uleb128 0xc
	.uaword	0x2bf
	.uaword	0x2e5
	.uleb128 0xd
	.uaword	0x2e5
	.byte	0x3f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0xb
	.uaword	0x2d5
	.byte	0
.section .debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x2119
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
.section .debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.uaword	.LVL0-.Ltext0
	.uaword	.LVL1-.Ltext0
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL1-.Ltext0
	.uaword	.LVL2-.Ltext0
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	.LVL2-.Ltext0
	.uaword	.LVL4-.Ltext0
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL4-.Ltext0
	.uaword	.LVL7-.Ltext0
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	.LVL7-.Ltext0
	.uaword	.LVL8-.Ltext0
	.uahalf	0x1
	.byte	0x65
	.uaword	.LVL8-.Ltext0
	.uaword	.LFE1-.Ltext0
	.uahalf	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x65
	.byte	0x9f
	.uaword	0
	.uaword	0
.LLST1:
	.uaword	.LVL3-.Ltext0
	.uaword	.LVL5-.Ltext0
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL5-.Ltext0
	.uaword	.LVL6-.Ltext0
	.uahalf	0x3
	.byte	0x83
	.sleb128 -4
	.byte	0x9f
	.uaword	.LVL6-.Ltext0
	.uaword	.LVL9-.Ltext0
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL10-.Ltext0
	.uaword	.LFE1-.Ltext0
	.uahalf	0x1
	.byte	0x63
	.uaword	0
	.uaword	0
.section .debug_aranges,"",@progbits
	.uaword	0x1c
	.uahalf	0x2
	.uaword	.Ldebug_info0
	.byte	0x4
	.byte	0
	.uahalf	0
	.uahalf	0
	.uaword	.Ltext0
	.uaword	.Letext0-.Ltext0
	.uaword	0
	.uaword	0
.section .debug_macro,"",@progbits
.Ldebug_macro0:
	.uahalf	0x4
	.byte	0x2
	.uaword	.Ldebug_line0
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.string	"__STDC__ 1"
	.byte	0x1
	.uleb128 0x2
	.string	"__STDC_HOSTED__ 1"
	.byte	0x1
	.uleb128 0x3
	.string	"__GNUC__ 4"
	.byte	0x1
	.uleb128 0x4
	.string	"__GNUC_MINOR__ 9"
	.byte	0x1
	.uleb128 0x5
	.string	"__GNUC_PATCHLEVEL__ 4"
	.byte	0x1
	.uleb128 0x6
	.string	"__VERSION__ \"4.9.4 build on 2021-03-13\""
	.byte	0x1
	.uleb128 0x7
	.string	"__ATOMIC_RELAXED 0"
	.byte	0x1
	.uleb128 0x8
	.string	"__ATOMIC_SEQ_CST 5"
	.byte	0x1
	.uleb128 0x9
	.string	"__ATOMIC_ACQUIRE 2"
	.byte	0x1
	.uleb128 0xa
	.string	"__ATOMIC_RELEASE 3"
	.byte	0x1
	.uleb128 0xb
	.string	"__ATOMIC_ACQ_REL 4"
	.byte	0x1
	.uleb128 0xc
	.string	"__ATOMIC_CONSUME 1"
	.byte	0x1
	.uleb128 0xd
	.string	"__OPTIMIZE__ 1"
	.byte	0x1
	.uleb128 0xe
	.string	"__FINITE_MATH_ONLY__ 0"
	.byte	0x1
	.uleb128 0xf
	.string	"__SIZEOF_INT__ 4"
	.byte	0x1
	.uleb128 0x10
	.string	"__SIZEOF_LONG__ 4"
	.byte	0x1
	.uleb128 0x11
	.string	"__SIZEOF_LONG_LONG__ 8"
	.byte	0x1
	.uleb128 0x12
	.string	"__SIZEOF_SHORT__ 2"
	.byte	0x1
	.uleb128 0x13
	.string	"__SIZEOF_FLOAT__ 4"
	.byte	0x1
	.uleb128 0x14
	.string	"__SIZEOF_DOUBLE__ 8"
	.byte	0x1
	.uleb128 0x15
	.string	"__SIZEOF_LONG_DOUBLE__ 8"
	.byte	0x1
	.uleb128 0x16
	.string	"__SIZEOF_SIZE_T__ 4"
	.byte	0x1
	.uleb128 0x17
	.string	"__CHAR_BIT__ 8"
	.byte	0x1
	.uleb128 0x18
	.string	"__BIGGEST_ALIGNMENT__ 4"
	.byte	0x1
	.uleb128 0x19
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
	.byte	0x1
	.uleb128 0x1a
	.string	"__ORDER_BIG_ENDIAN__ 4321"
	.byte	0x1
	.uleb128 0x1b
	.string	"__ORDER_PDP_ENDIAN__ 3412"
	.byte	0x1
	.uleb128 0x1c
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
	.byte	0x1
	.uleb128 0x1d
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
	.byte	0x1
	.uleb128 0x1e
	.string	"__SIZEOF_POINTER__ 4"
	.byte	0x1
	.uleb128 0x1f
	.string	"__SIZE_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x20
	.string	"__PTRDIFF_TYPE__ long int"
	.byte	0x1
	.uleb128 0x21
	.string	"__WCHAR_TYPE__ int"
	.byte	0x1
	.uleb128 0x22
	.string	"__WINT_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x23
	.string	"__INTMAX_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x24
	.string	"__UINTMAX_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x25
	.string	"__CHAR16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x26
	.string	"__CHAR32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x27
	.string	"__SIG_ATOMIC_TYPE__ int"
	.byte	0x1
	.uleb128 0x28
	.string	"__INT8_TYPE__ signed char"
	.byte	0x1
	.uleb128 0x29
	.string	"__INT16_TYPE__ short int"
	.byte	0x1
	.uleb128 0x2a
	.string	"__INT32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x2b
	.string	"__INT64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x2c
	.string	"__UINT8_TYPE__ unsigned char"
	.byte	0x1
	.uleb128 0x2d
	.string	"__UINT16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x2e
	.string	"__UINT32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x2f
	.string	"__UINT64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x30
	.string	"__INT_LEAST8_TYPE__ signed char"
	.byte	0x1
	.uleb128 0x31
	.string	"__INT_LEAST16_TYPE__ short int"
	.byte	0x1
	.uleb128 0x32
	.string	"__INT_LEAST32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x33
	.string	"__INT_LEAST64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x34
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
	.byte	0x1
	.uleb128 0x35
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x36
	.string	"__UINT_LEAST32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x37
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x38
	.string	"__INT_FAST8_TYPE__ int"
	.byte	0x1
	.uleb128 0x39
	.string	"__INT_FAST16_TYPE__ int"
	.byte	0x1
	.uleb128 0x3a
	.string	"__INT_FAST32_TYPE__ int"
	.byte	0x1
	.uleb128 0x3b
	.string	"__INT_FAST64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x3c
	.string	"__UINT_FAST8_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3d
	.string	"__UINT_FAST16_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3e
	.string	"__UINT_FAST32_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3f
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x40
	.string	"__INTPTR_TYPE__ long int"
	.byte	0x1
	.uleb128 0x41
	.string	"__UINTPTR_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x42
	.string	"__has_include(STR) __has_include__(STR)"
	.byte	0x1
	.uleb128 0x43
	.string	"__has_include_next(STR) __has_include_next__(STR)"
	.byte	0x1
	.uleb128 0x44
	.string	"__GXX_ABI_VERSION 1002"
	.byte	0x1
	.uleb128 0x45
	.string	"__USING_SJLJ_EXCEPTIONS__ 1"
	.byte	0x1
	.uleb128 0x46
	.string	"__SCHAR_MAX__ 127"
	.byte	0x1
	.uleb128 0x47
	.string	"__SHRT_MAX__ 32767"
	.byte	0x1
	.uleb128 0x48
	.string	"__INT_MAX__ 2147483647"
	.byte	0x1
	.uleb128 0x49
	.string	"__LONG_MAX__ 2147483647L"
	.byte	0x1
	.uleb128 0x4a
	.string	"__LONG_LONG_MAX__ 9223372036854775807LL"
	.byte	0x1
	.uleb128 0x4b
	.string	"__WCHAR_MAX__ 2147483647"
	.byte	0x1
	.uleb128 0x4c
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x4d
	.string	"__WINT_MAX__ 4294967295U"
	.byte	0x1
	.uleb128 0x4e
	.string	"__WINT_MIN__ 0U"
	.byte	0x1
	.uleb128 0x4f
	.string	"__PTRDIFF_MAX__ 2147483647L"
	.byte	0x1
	.uleb128 0x50
	.string	"__SIZE_MAX__ 4294967295UL"
	.byte	0x1
	.uleb128 0x51
	.string	"__INTMAX_MAX__ 9223372036854775807LL"
	.byte	0x1
	.uleb128 0x52
	.string	"__INTMAX_C(c) c ## LL"
	.byte	0x1
	.uleb128 0x53
	.string	"__UINTMAX_MAX__ 18446744073709551615ULL"
	.byte	0x1
	.uleb128 0x54
	.string	"__UINTMAX_C(c) c ## ULL"
	.byte	0x1
	.uleb128 0x55
	.string	"__SIG_ATOMIC_MAX__ 2147483647"
	.byte	0x1
	.uleb128 0x56
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x57
	.string	"__INT8_MAX__ 127"
	.byte	0x1
	.uleb128 0x58
	.string	"__INT16_MAX__ 32767"
	.byte	0x1
	.uleb128 0x59
	.string	"__INT32_MAX__ 2147483647L"
	.byte	0x1
	.uleb128 0x5a
	.string	"__INT64_MAX__ 9223372036854775807LL"
	.byte	0x1
	.uleb128 0x5b
	.string	"__UINT8_MAX__ 255"
	.byte	0x1
	.uleb128 0x5c
	.string	"__UINT16_MAX__ 65535"
	.byte	0x1
	.uleb128 0x5d
	.string	"__UINT32_MAX__ 4294967295UL"
	.byte	0x1
	.uleb128 0x5e
	.string	"__UINT64_MAX__ 18446744073709551615ULL"
	.byte	0x1
	.uleb128 0x5f
	.string	"__INT_LEAST8_MAX__ 127"
	.byte	0x1
	.uleb128 0x60
	.string	"__INT8_C(c) c"
	.byte	0x1
	.uleb128 0x61
	.string	"__INT_LEAST16_MAX__ 32767"
	.byte	0x1
	.uleb128 0x62
	.string	"__INT16_C(c) c"
	.byte	0x1
	.uleb128 0x63
	.string	"__INT_LEAST32_MAX__ 2147483647L"
	.byte	0x1
	.uleb128 0x64
	.string	"__INT32_C(c) c ## L"
	.byte	0x1
	.uleb128 0x65
	.string	"__INT_LEAST64_MAX__ 9223372036854775807LL"
	.byte	0x1
	.uleb128 0x66
	.string	"__INT64_C(c) c ## LL"
	.byte	0x1
	.uleb128 0x67
	.string	"__UINT_LEAST8_MAX__ 255"
	.byte	0x1
	.uleb128 0x68
	.string	"__UINT8_C(c) c"
	.byte	0x1
	.uleb128 0x69
	.string	"__UINT_LEAST16_MAX__ 65535"
	.byte	0x1
	.uleb128 0x6a
	.string	"__UINT16_C(c) c"
	.byte	0x1
	.uleb128 0x6b
	.string	"__UINT_LEAST32_MAX__ 4294967295UL"
	.byte	0x1
	.uleb128 0x6c
	.string	"__UINT32_C(c) c ## UL"
	.byte	0x1
	.uleb128 0x6d
	.string	"__UINT_LEAST64_MAX__ 18446744073709551615ULL"
	.byte	0x1
	.uleb128 0x6e
	.string	"__UINT64_C(c) c ## ULL"
	.byte	0x1
	.uleb128 0x6f
	.string	"__INT_FAST8_MAX__ 2147483647"
	.byte	0x1
	.uleb128 0x70
	.string	"__INT_FAST16_MAX__ 2147483647"
	.byte	0x1
	.uleb128 0x71
	.string	"__INT_FAST32_MAX__ 2147483647"
	.byte	0x1
	.uleb128 0x72
	.string	"__INT_FAST64_MAX__ 9223372036854775807LL"
	.byte	0x1
	.uleb128 0x73
	.string	"__UINT_FAST8_MAX__ 4294967295U"
	.byte	0x1
	.uleb128 0x74
	.string	"__UINT_FAST16_MAX__ 4294967295U"
	.byte	0x1
	.uleb128 0x75
	.string	"__UINT_FAST32_MAX__ 4294967295U"
	.byte	0x1
	.uleb128 0x76
	.string	"__UINT_FAST64_MAX__ 18446744073709551615ULL"
	.byte	0x1
	.uleb128 0x77
	.string	"__INTPTR_MAX__ 2147483647L"
	.byte	0x1
	.uleb128 0x78
	.string	"__UINTPTR_MAX__ 4294967295UL"
	.byte	0x1
	.uleb128 0x79
	.string	"__GCC_IEC_559 0"
	.byte	0x1
	.uleb128 0x7a
	.string	"__GCC_IEC_559_COMPLEX 0"
	.byte	0x1
	.uleb128 0x7b
	.string	"__FLT_EVAL_METHOD__ 0"
	.byte	0x1
	.uleb128 0x7c
	.string	"__DEC_EVAL_METHOD__ 2"
	.byte	0x1
	.uleb128 0x7d
	.string	"__FLT_RADIX__ 2"
	.byte	0x1
	.uleb128 0x7e
	.string	"__FLT_MANT_DIG__ 24"
	.byte	0x1
	.uleb128 0x7f
	.string	"__FLT_DIG__ 6"
	.byte	0x1
	.uleb128 0x80
	.string	"__FLT_MIN_EXP__ (-125)"
	.byte	0x1
	.uleb128 0x81
	.string	"__FLT_MIN_10_EXP__ (-37)"
	.byte	0x1
	.uleb128 0x82
	.string	"__FLT_MAX_EXP__ 128"
	.byte	0x1
	.uleb128 0x83
	.string	"__FLT_MAX_10_EXP__ 38"
	.byte	0x1
	.uleb128 0x84
	.string	"__FLT_DECIMAL_DIG__ 9"
	.byte	0x1
	.uleb128 0x85
	.string	"__FLT_MAX__ 3.4028234663852886e+38F"
	.byte	0x1
	.uleb128 0x86
	.string	"__FLT_MIN__ 1.1754943508222875e-38F"
	.byte	0x1
	.uleb128 0x87
	.string	"__FLT_EPSILON__ 1.1920928955078125e-7F"
	.byte	0x1
	.uleb128 0x88
	.string	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F"
	.byte	0x1
	.uleb128 0x89
	.string	"__FLT_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0x8a
	.string	"__FLT_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0x8b
	.string	"__FLT_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0x8c
	.string	"__FP_FAST_FMAF 1"
	.byte	0x1
	.uleb128 0x8d
	.string	"__DBL_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0x8e
	.string	"__DBL_DIG__ 15"
	.byte	0x1
	.uleb128 0x8f
	.string	"__DBL_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0x90
	.string	"__DBL_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0x91
	.string	"__DBL_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0x92
	.string	"__DBL_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0x93
	.string	"__DBL_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0x94
	.string	"__DBL_MAX__ ((double)1.7976931348623157e+308L)"
	.byte	0x1
	.uleb128 0x95
	.string	"__DBL_MIN__ ((double)2.2250738585072014e-308L)"
	.byte	0x1
	.uleb128 0x96
	.string	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)"
	.byte	0x1
	.uleb128 0x97
	.string	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)"
	.byte	0x1
	.uleb128 0x98
	.string	"__DBL_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0x99
	.string	"__DBL_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0x9a
	.string	"__DBL_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0x9b
	.string	"__LDBL_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0x9c
	.string	"__LDBL_DIG__ 15"
	.byte	0x1
	.uleb128 0x9d
	.string	"__LDBL_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0x9e
	.string	"__LDBL_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0x9f
	.string	"__LDBL_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xa0
	.string	"__LDBL_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xa1
	.string	"__DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xa2
	.string	"__LDBL_MAX__ 1.7976931348623157e+308L"
	.byte	0x1
	.uleb128 0xa3
	.string	"__LDBL_MIN__ 2.2250738585072014e-308L"
	.byte	0x1
	.uleb128 0xa4
	.string	"__LDBL_EPSILON__ 2.2204460492503131e-16L"
	.byte	0x1
	.uleb128 0xa5
	.string	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L"
	.byte	0x1
	.uleb128 0xa6
	.string	"__LDBL_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xa7
	.string	"__LDBL_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xa8
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xa9
	.string	"__DEC32_MANT_DIG__ 7"
	.byte	0x1
	.uleb128 0xaa
	.string	"__DEC32_MIN_EXP__ (-94)"
	.byte	0x1
	.uleb128 0xab
	.string	"__DEC32_MAX_EXP__ 97"
	.byte	0x1
	.uleb128 0xac
	.string	"__DEC32_MIN__ 1E-95DF"
	.byte	0x1
	.uleb128 0xad
	.string	"__DEC32_MAX__ 9.999999E96DF"
	.byte	0x1
	.uleb128 0xae
	.string	"__DEC32_EPSILON__ 1E-6DF"
	.byte	0x1
	.uleb128 0xaf
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
	.byte	0x1
	.uleb128 0xb0
	.string	"__DEC64_MANT_DIG__ 16"
	.byte	0x1
	.uleb128 0xb1
	.string	"__DEC64_MIN_EXP__ (-382)"
	.byte	0x1
	.uleb128 0xb2
	.string	"__DEC64_MAX_EXP__ 385"
	.byte	0x1
	.uleb128 0xb3
	.string	"__DEC64_MIN__ 1E-383DD"
	.byte	0x1
	.uleb128 0xb4
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
	.byte	0x1
	.uleb128 0xb5
	.string	"__DEC64_EPSILON__ 1E-15DD"
	.byte	0x1
	.uleb128 0xb6
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
	.byte	0x1
	.uleb128 0xb7
	.string	"__DEC128_MANT_DIG__ 34"
	.byte	0x1
	.uleb128 0xb8
	.string	"__DEC128_MIN_EXP__ (-6142)"
	.byte	0x1
	.uleb128 0xb9
	.string	"__DEC128_MAX_EXP__ 6145"
	.byte	0x1
	.uleb128 0xba
	.string	"__DEC128_MIN__ 1E-6143DL"
	.byte	0x1
	.uleb128 0xbb
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
	.byte	0x1
	.uleb128 0xbc
	.string	"__DEC128_EPSILON__ 1E-33DL"
	.byte	0x1
	.uleb128 0xbd
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
	.byte	0x1
	.uleb128 0xbe
	.string	"__REGISTER_PREFIX__ %"
	.byte	0x1
	.uleb128 0xbf
	.string	"__USER_LABEL_PREFIX__ "
	.byte	0x1
	.uleb128 0xc0
	.string	"__GNUC_GNU_INLINE__ 1"
	.byte	0x1
	.uleb128 0xc1
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc2
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc3
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc4
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc5
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc6
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc7
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc8
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xc9
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xca
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
	.byte	0x1
	.uleb128 0xcb
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0xcc
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
	.byte	0x1
	.uleb128 0xcd
	.string	"__SIZEOF_WCHAR_T__ 4"
	.byte	0x1
	.uleb128 0xce
	.string	"__SIZEOF_WINT_T__ 4"
	.byte	0x1
	.uleb128 0xcf
	.string	"__SIZEOF_PTRDIFF_T__ 4"
	.byte	0x1
	.uleb128 0xd0
	.string	"__HIGHTEC__ 1"
	.byte	0x1
	.uleb128 0xd1
	.string	"__GNUC_AURIX__ 1"
	.byte	0x1
	.uleb128 0xd2
	.string	"__tricore 1"
	.byte	0x1
	.uleb128 0xd3
	.string	"__tricore__ 1"
	.byte	0x1
	.uleb128 0xd4
	.string	"tricore 1"
	.byte	0x1
	.uleb128 0xd5
	.string	"__TRICORE__ 1"
	.byte	0x1
	.uleb128 0xd6
	.string	"__TC161__ 1"
	.byte	0x1
	.uleb128 0xd7
	.string	"__TRICORE_CORE__ 0x161"
	.byte	0x1
	.uleb128 0xd8
	.string	"__TRICORE_HAVE_DIV__ 1"
	.byte	0x1
	.uleb128 0xd9
	.string	"__TRICORE_HAVE_FTOIZ__ 1"
	.byte	0x1
	.uleb128 0xda
	.string	"__TRICORE_HAVE_MOV64__ 1"
	.byte	0x1
	.uleb128 0xdb
	.string	"__TRICORE_HAVE_FLOAT16__ 1"
	.byte	0x1
	.uleb128 0xdc
	.string	"__BUILTIN_TRICORE_NOP 1"
	.byte	0x1
	.uleb128 0xdd
	.string	"__BUILTIN_TRICORE_LROTATE 1"
	.byte	0x1
	.uleb128 0xde
	.string	"__BUILTIN_TRICORE_RROTATE 1"
	.byte	0x1
	.uleb128 0xdf
	.string	"__BUILTIN_TRICORE_INSERT 1"
	.byte	0x1
	.uleb128 0xe0
	.string	"__BUILTIN_TRICORE_IMASK 1"
	.byte	0x1
	.uleb128 0xe1
	.string	"__BUILTIN_TRICORE_SWAPW 1"
	.byte	0x1
	.uleb128 0xe2
	.string	"__BUILTIN_TRICORE_SWAPMSKW 1"
	.byte	0x1
	.uleb128 0xe3
	.string	"__BUILTIN_TRICORE_CMPSWAPW 1"
	.byte	0x1
	.uleb128 0xe4
	.string	"__BUILTIN_TRICORE_SATB 1"
	.byte	0x1
	.uleb128 0xe5
	.string	"__BUILTIN_TRICORE_SATH 1"
	.byte	0x1
	.uleb128 0xe6
	.string	"__BUILTIN_TRICORE_SATBU 1"
	.byte	0x1
	.uleb128 0xe7
	.string	"__BUILTIN_TRICORE_SATHU 1"
	.byte	0x1
	.uleb128 0xe8
	.string	"__BUILTIN_TRICORE_LDMST 1"
	.byte	0x1
	.uleb128 0xe9
	.string	"__ELF__ 1"
	.byte	0x1
	.uleb128 0xa
	.string	"flashaddress parameter[0]"
	.byte	0x1
	.uleb128 0xb
	.string	"databuswidth parameter[1]"
	.byte	0x1
	.uleb128 0xc
	.string	"address parameter[2]"
	.byte	0x1
	.uleb128 0xd
	.string	"number parameter[3]"
	.byte	0x1
	.uleb128 0xe
	.string	"status parameter[4]"
	.byte	0x1
	.uleb128 0xf
	.string	"databegin parameter[5]"
	.byte	0x1
	.uleb128 0x10
	.string	"dummy1 parameter[6]"
	.byte	0x1
	.uleb128 0x11
	.string	"dummy2 parameter[7]"
	.byte	0x1
	.uleb128 0x12
	.string	"HF_STATUS 0xF8040010u"
	.byte	0x1
	.uleb128 0x13
	.string	"HF_CLRE 0xF8040038u"
	.byte	0x1
	.uleb128 0x14
	.string	"HF_ERRSR 0xF8040034u"
	.byte	0x1
	.uleb128 0x17
	.string	"MEM(address) (*((volatile unsigned int *)(address)))"
	.byte	0x1
	.uleb128 0x1a
	.string	"MEM16(address) (*((volatile unsigned short *)(address)))"
	.byte	0x1
	.uleb128 0x1d
	.string	"MEM8(address) (*((volatile unsigned char *)(address)))"
	.byte	0x4
	.byte	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
	.ident	"GCC: (cosmocomp Release GPL_HIGHTEC_GCC494) 4.9.4 build on 2021-03-13"
