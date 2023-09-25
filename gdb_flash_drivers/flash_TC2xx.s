	.file	"flash_TC2xx.c"
.section .text,"ax",@progbits
.Ltext0:
	.align 1
	.global	start
	.type	start, @function
start:
.LFB0:
	.file 1 "flash_TC2xx.c"
	.loc 1 32 0
	.loc 1 33 0
#APP
	# 33 "flash_TC2xx.c" 1
	.global _start
	# 0 "" 2
	.loc 1 34 0
	# 34 "flash_TC2xx.c" 1
	 _start:	 nop
	# 0 "" 2
	.loc 1 35 0
	# 35 "flash_TC2xx.c" 1
	 nop
	# 0 "" 2
	.loc 1 36 0
	# 36 "flash_TC2xx.c" 1
	 movh.a   %a10,hi:(0x70004000)
	# 0 "" 2
	.loc 1 37 0
	# 37 "flash_TC2xx.c" 1
	 lea      %a10,[%a10]lo:(0x70004000)
	# 0 "" 2
	.loc 1 38 0
	# 38 "flash_TC2xx.c" 1
	 ja main
	# 0 "" 2
#NO_APP
	ret
.LFE0:
	.size	start, .-start
	.align 1
	.global	main
	.type	main, @function
main:
.LFB1:
	.loc 1 42 0
.LVL0:
	.loc 1 53 0
	ld.w	%d15, [%a4] 16
	.loc 1 42 0
	lea	%SP, [%SP] -288
.LCFI0:
	.loc 1 53 0
	jeq	%d15, 1, .L92
	.loc 1 108 0
	jeq	%d15, 2, .L93
.L8:
	.loc 1 198 0
#APP
	# 198 "flash_TC2xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	ret
.L92:
	.loc 1 55 0
	ld.w	%d15, [%a4] 8
	st.w	[%SP] 12, %d15
	.loc 1 57 0
	mov	%d15, 0
	.loc 1 58 0
	movh	%d2, 36608
	movh	%d3, 32768
	.loc 1 57 0
	st.w	[%SP] 28, %d15
	.loc 1 58 0
	ld.w	%d15, [%a4]0
	.loc 1 56 0
	ld.a	%a3, [%a4] 20
.LVL1:
	.loc 1 58 0
	and	%d15, %d2
	jeq	%d15, %d3, .L94
	.loc 1 59 0
	jne	%d15, %d2, .L5
	.loc 1 59 0 is_stmt 0 discriminator 1
	mov	%d15, 8
	st.w	[%SP] 28, %d15
.L5:
	.loc 1 60 0 is_stmt 1
	ld.w	%d15, [%SP] 28
	jnz	%d15, .L6
	.loc 1 60 0 is_stmt 0 discriminator 1
	mov	%d15, 256
	st.w	[%a4] 16, %d15
#APP
	# 60 "flash_TC2xx.c" 1
		debug
	# 0 "" 2
#NO_APP
.L6:
	.loc 1 61 0 is_stmt 1
	ld.w	%d15, [%a4] 12
	.loc 1 70 0
	movh.a	%a15, 44800
	.loc 1 79 0
	movh.a	%a14, 44800
	.loc 1 81 0
	movh.a	%a13, 44800
	.loc 1 85 0
	movh.a	%a12, 44801
	.loc 1 87 0
	movh.a	%a7, 44801
	.loc 1 89 0
	movh.a	%a2, 44801
	.loc 1 94 0
	movh	%d11, 63488
	.loc 1 64 0
	mov	%d2, 0
	.loc 1 70 0
	lea	%a15, [%a15] 21844
	mov	%d8, 80
	.loc 1 71 0
	mov	%d1, 93
	.loc 1 79 0
	lea	%a14, [%a14] 22000
	.loc 1 81 0
	lea	%a13, [%a13] 22004
	.loc 1 85 0
	lea	%a12, [%a12] -21936
	.loc 1 87 0
	lea	%a7, [%a7] -21928
	.loc 1 89 0
	lea	%a2, [%a2] -21848
	mov	%d0, 160
	.loc 1 91 0
	mov	%d7, 122
	.loc 1 92 0
	mov	%d6, 16384
	.loc 1 94 0
	addi	%d11, %d11, 8208
	.loc 1 96 0
	mov	%d4, 250
	.loc 1 97 0
	mov	%d5, 256
	.loc 1 61 0
	jz	%d15, .L18
.L82:
	.loc 1 63 0
	ld.w	%d3, [%SP] 12
	.loc 1 64 0
	st.w	[%SP] 8, %d2
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 28
	jge.u	%d9, %d3, .L9
	add	%d15, -4
.L10:
	.loc 1 66 0 discriminator 3
	ld.w	%d9, [%SP] 8
	lea	%a6, [%SP] 288
	addsc.a	%a5, %a6, %d9, 2
	ld.w	%d3, [%a3+]4
.LVL2:
	st.w	[%a5] -256, %d3
.LVL3:
	.loc 1 64 0 discriminator 3
	ld.w	%d3, [%SP] 8
	add	%d10, %d15, -4
	add	%d3, 1
	st.w	[%SP] 8, %d3
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 28
	jge.u	%d9, %d3, .L95
	mov	%d15, %d10
	j	.L10
.L94:
	.loc 1 58 0 discriminator 1
	mov	%d15, 64
	st.w	[%SP] 28, %d15
	j	.L5
.LVL4:
.L93:
	.loc 1 110 0
	mov	%d15, 0
	.loc 1 111 0
	ld.w	%d2, [%a4]0
	ld.w	%d4, [%a4] 8
	.loc 1 110 0
	st.w	[%SP] 28, %d15
	.loc 1 111 0
	xor	%d15, %d4, %d2
	andn	%d15, %d15, ~(-256)
	jnz	%d15, .L21
	.loc 1 111 0 is_stmt 0 discriminator 1
	ld.w	%d15, [%SP] 28
	jnz	%d15, .L21
	.loc 1 111 0 discriminator 2
	mov	%d3, 16384
	st.w	[%SP] 24, %d3
	mov	%d3, 1
	st.w	[%SP] 28, %d3
	st.w	[%SP] 32, %d15
.L21:
	.loc 1 112 0 is_stmt 1
	andn	%d2, %d2, ~(-256)
	andn	%d15, %d4, ~(-256)
	addi	%d5, %d2, 16384
	jeq	%d5, %d15, .L96
.L22:
	.loc 1 113 0
	addi	%d3, %d2, -32768
	addih	%d6, %d3, 1
	jeq	%d15, %d6, .L97
.L23:
	.loc 1 114 0
	addi	%d6, %d2, -16384
	addih	%d7, %d6, 1
	jeq	%d15, %d7, .L98
.L24:
	.loc 1 115 0
	addih	%d7, %d2, 1
	jeq	%d15, %d7, .L99
.L25:
	.loc 1 116 0
	addih	%d7, %d5, 1
	jeq	%d15, %d7, .L100
.L26:
	.loc 1 117 0
	addih	%d7, %d3, 2
	jeq	%d15, %d7, .L101
.L27:
	.loc 1 118 0
	addih	%d7, %d6, 2
	jeq	%d15, %d7, .L102
.L28:
	.loc 1 119 0
	addih	%d7, %d2, 2
	jeq	%d15, %d7, .L103
.L29:
	.loc 1 120 0
	addih	%d7, %d3, 3
	jeq	%d15, %d7, .L104
.L30:
	.loc 1 121 0
	addih	%d7, %d2, 3
	jeq	%d15, %d7, .L105
.L31:
	.loc 1 122 0
	addih	%d7, %d3, 4
	jeq	%d15, %d7, .L106
.L32:
	.loc 1 123 0
	addih	%d7, %d2, 4
	jeq	%d15, %d7, .L107
.L33:
	.loc 1 124 0
	addih	%d7, %d3, 5
	jeq	%d15, %d7, .L108
.L34:
	.loc 1 125 0
	addih	%d7, %d2, 5
	jeq	%d15, %d7, .L109
.L35:
	.loc 1 126 0
	addih	%d7, %d3, 6
	jeq	%d15, %d7, .L110
.L36:
	.loc 1 127 0
	addih	%d7, %d2, 6
	jeq	%d15, %d7, .L111
.L37:
	.loc 1 128 0
	addih	%d7, %d2, 7
	jeq	%d15, %d7, .L112
.L38:
	.loc 1 129 0
	addih	%d7, %d2, 8
	jeq	%d15, %d7, .L113
.L39:
	.loc 1 130 0
	addih	%d7, %d2, 9
	jeq	%d15, %d7, .L114
.L40:
	.loc 1 131 0
	addih	%d7, %d2, 10
	jeq	%d15, %d7, .L115
.L41:
	.loc 1 132 0
	addih	%d7, %d2, 12
	jeq	%d15, %d7, .L116
.L42:
	.loc 1 133 0
	addih	%d7, %d2, 14
	jeq	%d15, %d7, .L117
.L43:
	.loc 1 134 0
	addih	%d7, %d2, 16
	jeq	%d15, %d7, .L118
.L44:
	.loc 1 135 0
	addih	%d7, %d2, 20
	jeq	%d15, %d7, .L119
.L45:
	.loc 1 136 0
	addih	%d7, %d2, 24
	jeq	%d15, %d7, .L120
.L46:
	.loc 1 137 0
	addih	%d7, %d2, 28
	jeq	%d15, %d7, .L121
.L47:
	.loc 1 138 0
	addih	%d7, %d2, 32
	jeq	%d15, %d7, .L122
.L48:
	.loc 1 139 0
	addih	%d7, %d5, 32
	jeq	%d15, %d7, .L123
.L49:
	.loc 1 140 0
	addih	%d7, %d3, 33
	jeq	%d15, %d7, .L124
.L50:
	.loc 1 141 0
	addih	%d7, %d6, 33
	jeq	%d15, %d7, .L125
.L51:
	.loc 1 142 0
	addih	%d7, %d2, 33
	jeq	%d15, %d7, .L126
.L52:
	.loc 1 143 0
	addih	%d5, %d5, 33
	jeq	%d15, %d5, .L127
.L53:
	.loc 1 144 0
	addih	%d5, %d3, 34
	jeq	%d15, %d5, .L128
.L54:
	.loc 1 145 0
	addih	%d6, %d6, 34
	jeq	%d15, %d6, .L129
.L55:
	.loc 1 146 0
	addih	%d5, %d2, 34
	jeq	%d15, %d5, .L130
.L56:
	.loc 1 147 0
	addih	%d5, %d3, 35
	jeq	%d15, %d5, .L131
.L57:
	.loc 1 148 0
	addih	%d5, %d2, 35
	jeq	%d15, %d5, .L132
.L58:
	.loc 1 149 0
	addih	%d5, %d3, 36
	jeq	%d15, %d5, .L133
.L59:
	.loc 1 150 0
	addih	%d5, %d2, 36
	jeq	%d15, %d5, .L134
.L60:
	.loc 1 151 0
	addih	%d5, %d3, 37
	jeq	%d15, %d5, .L135
.L61:
	.loc 1 152 0
	addih	%d5, %d2, 37
	jeq	%d15, %d5, .L136
.L62:
	.loc 1 153 0
	addih	%d3, %d3, 38
	jeq	%d15, %d3, .L137
.L63:
	.loc 1 154 0
	addih	%d3, %d2, 38
	jeq	%d15, %d3, .L138
.L64:
	.loc 1 155 0
	addih	%d3, %d2, 39
	jeq	%d15, %d3, .L139
.L65:
	.loc 1 156 0
	addih	%d3, %d2, 40
	jeq	%d15, %d3, .L140
.L66:
	.loc 1 157 0
	addih	%d3, %d2, 41
	jeq	%d15, %d3, .L141
.L67:
	.loc 1 158 0
	addih	%d3, %d2, 42
	jeq	%d15, %d3, .L142
.L68:
	.loc 1 159 0
	addih	%d3, %d2, 44
	jeq	%d15, %d3, .L143
.L69:
	.loc 1 160 0
	addih	%d3, %d2, 46
	jeq	%d15, %d3, .L144
.L70:
	.loc 1 161 0
	addih	%d3, %d2, 48
	jeq	%d15, %d3, .L145
.L71:
	.loc 1 162 0
	addih	%d3, %d2, 52
	jeq	%d15, %d3, .L146
.L72:
	.loc 1 163 0
	addih	%d3, %d2, 56
	jeq	%d15, %d3, .L147
.L73:
	.loc 1 164 0
	addih	%d2, %d2, 60
	jeq	%d15, %d2, .L148
.L74:
	.loc 1 165 0
	mov	%d15, 1
	st.w	[%SP] 28, %d15
	.loc 1 166 0
	ld.w	%d15, [%SP] 28
	jnz	%d15, .L75
	.loc 1 168 0
	mov	%d15, 256
	st.w	[%a4] 16, %d15
	.loc 1 169 0
#APP
	# 169 "flash_TC2xx.c" 1
		debug
	# 0 "" 2
#NO_APP
.L75:
	.loc 1 172 0
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21936
	st.w	[%a15]0, %d4
	.loc 1 173 0
#APP
	# 173 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 174 0
#NO_APP
	mov	%d15, 1
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21928
	st.w	[%a15]0, %d15
	.loc 1 175 0
#APP
	# 175 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 176 0
#NO_APP
	mov	%d15, 128
	movh.a	%a15, 44801
	lea	%a15, [%a15] -21848
	st.w	[%a15]0, %d15
	.loc 1 177 0
#APP
	# 177 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 178 0
#NO_APP
	mov	%d15, 80
	st.w	[%a15]0, %d15
	.loc 1 179 0
#APP
	# 179 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 183 0
#NO_APP
	movh.a	%a15, 63488
	.loc 1 182 0
	movh	%d2, 4
	.loc 1 183 0
	lea	%a15, [%a15] 8208
	.loc 1 182 0
	mov	%d3, 0
.L78:
	st.w	[%SP] 8, %d3
	ld.w	%d15, [%SP] 8
	jge.u	%d15, %d2, .L79
.L85:
	.loc 1 182 0 is_stmt 0 discriminator 3
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
	jlt.u	%d15, %d2, .L85
.L79:
	.loc 1 183 0 is_stmt 1
	ld.w	%d15, [%a15]0
	st.w	[%SP] 16, %d15
	.loc 1 184 0
#APP
	# 184 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 185 0
#NO_APP
	ld.w	%d15, [%a15]0
	and	%d15, %d15, 30
	jnz	%d15, .L78
	.loc 1 187 0
	st.w	[%a4] 16, %d15
	.loc 1 188 0
#APP
	# 188 "flash_TC2xx.c" 1
		nop
	# 0 "" 2
	.loc 1 189 0
	# 189 "flash_TC2xx.c" 1
		nop
	# 0 "" 2
	.loc 1 190 0
	# 190 "flash_TC2xx.c" 1
		nop
	# 0 "" 2
	.loc 1 191 0
	# 191 "flash_TC2xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L78
.L148:
	.loc 1 164 0 discriminator 1
	ld.w	%d15, [%SP] 28
	jnz	%d15, .L74
	.loc 1 164 0 is_stmt 0 discriminator 2
	movh	%d2, 4
	st.w	[%SP] 24, %d2
	mov	%d2, 1
	st.w	[%SP] 28, %d2
	st.w	[%SP] 32, %d15
	j	.L74
.L147:
	.loc 1 163 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L73
	.loc 1 163 0 is_stmt 0 discriminator 2
	movh	%d5, 4
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L73
.L146:
	.loc 1 162 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L72
	.loc 1 162 0 is_stmt 0 discriminator 2
	movh	%d5, 4
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L72
.L145:
	.loc 1 161 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L71
	.loc 1 161 0 is_stmt 0 discriminator 2
	movh	%d5, 4
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L71
.L144:
	.loc 1 160 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L70
	.loc 1 160 0 is_stmt 0 discriminator 2
	movh	%d5, 2
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L70
.L143:
	.loc 1 159 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L69
	.loc 1 159 0 is_stmt 0 discriminator 2
	movh	%d5, 2
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L69
.L142:
	.loc 1 158 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L68
	.loc 1 158 0 is_stmt 0 discriminator 2
	movh	%d5, 2
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L68
.L141:
	.loc 1 157 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L67
	.loc 1 157 0 is_stmt 0 discriminator 2
	movh	%d5, 1
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L67
.L140:
	.loc 1 156 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L66
	.loc 1 156 0 is_stmt 0 discriminator 2
	movh	%d5, 1
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L66
.L139:
	.loc 1 155 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L65
	.loc 1 155 0 is_stmt 0 discriminator 2
	movh	%d5, 1
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L65
.L138:
	.loc 1 154 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L64
	.loc 1 154 0 is_stmt 0 discriminator 2
	movh	%d5, 1
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L64
.L137:
	.loc 1 153 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L63
	.loc 1 153 0 is_stmt 0 discriminator 2
	mov.u	%d5, 32768
	st.w	[%SP] 24, %d5
	mov	%d5, 1
	st.w	[%SP] 28, %d5
	st.w	[%SP] 32, %d3
	j	.L63
.L136:
	.loc 1 152 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L62
	.loc 1 152 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L62
.L135:
	.loc 1 151 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L61
	.loc 1 151 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L61
.L134:
	.loc 1 150 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L60
	.loc 1 150 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L60
.L133:
	.loc 1 149 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L59
	.loc 1 149 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L59
.L132:
	.loc 1 148 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L58
	.loc 1 148 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L58
.L131:
	.loc 1 147 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L57
	.loc 1 147 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L57
.L130:
	.loc 1 146 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L56
	.loc 1 146 0 is_stmt 0 discriminator 2
	mov.u	%d6, 32768
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L56
.L129:
	.loc 1 145 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L55
	.loc 1 145 0 is_stmt 0 discriminator 2
	mov	%d6, 16384
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d5
	j	.L55
.L128:
	.loc 1 144 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L54
	.loc 1 144 0 is_stmt 0 discriminator 2
	mov	%d7, 16384
	st.w	[%SP] 24, %d7
	mov	%d7, 1
	st.w	[%SP] 28, %d7
	st.w	[%SP] 32, %d5
	j	.L54
.L127:
	.loc 1 143 0 is_stmt 1 discriminator 1
	ld.w	%d5, [%SP] 28
	jnz	%d5, .L53
	.loc 1 143 0 is_stmt 0 discriminator 2
	mov	%d7, 16384
	st.w	[%SP] 24, %d7
	mov	%d7, 1
	st.w	[%SP] 28, %d7
	st.w	[%SP] 32, %d5
	j	.L53
.L126:
	.loc 1 142 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L52
	.loc 1 142 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L52
.L125:
	.loc 1 141 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L51
	.loc 1 141 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L51
.L124:
	.loc 1 140 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L50
	.loc 1 140 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L50
.L123:
	.loc 1 139 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L49
	.loc 1 139 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L49
.L122:
	.loc 1 138 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L48
	.loc 1 138 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L48
.L121:
	.loc 1 137 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L47
	.loc 1 137 0 is_stmt 0 discriminator 2
	movh	%d0, 4
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L47
.L120:
	.loc 1 136 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L46
	.loc 1 136 0 is_stmt 0 discriminator 2
	movh	%d0, 4
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L46
.L119:
	.loc 1 135 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L45
	.loc 1 135 0 is_stmt 0 discriminator 2
	movh	%d0, 4
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L45
.L118:
	.loc 1 134 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L44
	.loc 1 134 0 is_stmt 0 discriminator 2
	movh	%d0, 4
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L44
.L117:
	.loc 1 133 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L43
	.loc 1 133 0 is_stmt 0 discriminator 2
	movh	%d0, 2
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L43
.L116:
	.loc 1 132 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L42
	.loc 1 132 0 is_stmt 0 discriminator 2
	movh	%d0, 2
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L42
.L115:
	.loc 1 131 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L41
	.loc 1 131 0 is_stmt 0 discriminator 2
	movh	%d0, 2
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L41
.L114:
	.loc 1 130 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L40
	.loc 1 130 0 is_stmt 0 discriminator 2
	movh	%d0, 1
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L40
.L113:
	.loc 1 129 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L39
	.loc 1 129 0 is_stmt 0 discriminator 2
	movh	%d0, 1
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L39
.L112:
	.loc 1 128 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L38
	.loc 1 128 0 is_stmt 0 discriminator 2
	movh	%d0, 1
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L38
.L111:
	.loc 1 127 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L37
	.loc 1 127 0 is_stmt 0 discriminator 2
	movh	%d0, 1
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L37
.L110:
	.loc 1 126 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L36
	.loc 1 126 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L36
.L109:
	.loc 1 125 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L35
	.loc 1 125 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L35
.L108:
	.loc 1 124 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L34
	.loc 1 124 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L34
.L107:
	.loc 1 123 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L33
	.loc 1 123 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L33
.L106:
	.loc 1 122 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L32
	.loc 1 122 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L32
.L105:
	.loc 1 121 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L31
	.loc 1 121 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L31
.L104:
	.loc 1 120 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L30
	.loc 1 120 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L30
.L103:
	.loc 1 119 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L29
	.loc 1 119 0 is_stmt 0 discriminator 2
	mov.u	%d0, 32768
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L29
.L102:
	.loc 1 118 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L28
	.loc 1 118 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L28
.L101:
	.loc 1 117 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L27
	.loc 1 117 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L27
.L100:
	.loc 1 116 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L26
	.loc 1 116 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L26
.L99:
	.loc 1 115 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L25
	.loc 1 115 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L25
.L98:
	.loc 1 114 0 is_stmt 1 discriminator 1
	ld.w	%d7, [%SP] 28
	jnz	%d7, .L24
	.loc 1 114 0 is_stmt 0 discriminator 2
	mov	%d0, 16384
	st.w	[%SP] 24, %d0
	mov	%d0, 1
	st.w	[%SP] 28, %d0
	st.w	[%SP] 32, %d7
	j	.L24
.L97:
	.loc 1 113 0 is_stmt 1 discriminator 1
	ld.w	%d6, [%SP] 28
	jnz	%d6, .L23
	.loc 1 113 0 is_stmt 0 discriminator 2
	mov	%d7, 16384
	st.w	[%SP] 24, %d7
	mov	%d7, 1
	st.w	[%SP] 28, %d7
	st.w	[%SP] 32, %d6
	j	.L23
.L96:
	.loc 1 112 0 is_stmt 1 discriminator 1
	ld.w	%d3, [%SP] 28
	jnz	%d3, .L22
	.loc 1 112 0 is_stmt 0 discriminator 2
	mov	%d6, 16384
	st.w	[%SP] 24, %d6
	mov	%d6, 1
	st.w	[%SP] 28, %d6
	st.w	[%SP] 32, %d3
	j	.L22
.LVL5:
.L95:
	st.w	[%a4] 12, %d15
.L9:
	.loc 1 70 0 is_stmt 1
	ld.w	%d3, [%SP] 28
	ne	%d3, %d3, 64
	jnz	%d3, .L11
	.loc 1 70 0 is_stmt 0 discriminator 1
	st.w	[%a15]0, %d8
.L11:
	.loc 1 71 0 is_stmt 1
	ld.w	%d3, [%SP] 28
	ne	%d3, %d3, 8
	jnz	%d3, .L12
	.loc 1 71 0 is_stmt 0 discriminator 1
	st.w	[%a15]0, %d1
.L12:
	.loc 1 72 0 is_stmt 1
	st.w	[%SP] 8, %d2
	.loc 1 73 0
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 28
	jge.u	%d9, %d3, .L16
.L84:
	.loc 1 75 0
	ld.w	%d3, [%SP] 8
	lea	%a6, [%SP] 288
	addsc.a	%a5, %a6, %d3, 2
	ld.w	%d3, [%a5] -256
	st.w	[%SP] 20, %d3
	.loc 1 76 0
	ld.w	%d3, [%SP] 8
	add	%d3, 1
	st.w	[%SP] 8, %d3
	.loc 1 77 0
	ld.w	%d3, [%SP] 8
	addsc.a	%a5, %a6, %d3, 2
	ld.w	%d3, [%a5] -256
	st.w	[%SP] 24, %d3
	.loc 1 78 0
	ld.w	%d3, [%SP] 8
	add	%d3, 1
	st.w	[%SP] 8, %d3
	.loc 1 79 0
	ld.w	%d3, [%SP] 20
	st.w	[%a14]0, %d3
	.loc 1 80 0
#APP
	# 80 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 81 0
#NO_APP
	ld.w	%d3, [%SP] 24
	st.w	[%a13]0, %d3
	.loc 1 82 0
#APP
	# 82 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 73 0
#NO_APP
	ld.w	%d9, [%SP] 8
	ld.w	%d3, [%SP] 28
	jlt.u	%d9, %d3, .L84
.L16:
	.loc 1 85 0
	ld.w	%d3, [%SP] 12
	st.w	[%a12]0, %d3
	.loc 1 86 0
#APP
	# 86 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 87 0
#NO_APP
	st.w	[%a7]0, %d2
	.loc 1 88 0
#APP
	# 88 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 89 0
#NO_APP
	st.w	[%a2]0, %d0
	.loc 1 90 0
#APP
	# 90 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 91 0
#NO_APP
	st.w	[%a2]0, %d7
	.loc 1 92 0
	st.w	[%SP] 4, %d6
	ld.w	%d3, [%SP] 4
	jlez	%d3, .L15
.L83:
	.loc 1 94 0
	mov.a	%a5, %d11
	ld.w	%d3, [%a5]0
	st.w	[%SP] 16, %d3
	.loc 1 95 0
#APP
	# 95 "flash_TC2xx.c" 1
		dsync
	# 0 "" 2
	.loc 1 96 0
#NO_APP
	ld.w	%d3, [%SP] 16
	and	%d3, %d3, 30
	jnz	%d3, .L19
	.loc 1 96 0 is_stmt 0 discriminator 1
	st.w	[%SP] 4, %d3
	st.w	[%a15]0, %d4
.L19:
	.loc 1 97 0 is_stmt 1
	ld.w	%d3, [%SP] 4
	jne	%d3, 1, .L20
	.loc 1 97 0 is_stmt 0 discriminator 1
	ld.w	%d3, [%SP] 12
	st.w	[%a4] 8, %d3
	st.w	[%a4] 16, %d5
	st.w	[%a15]0, %d4
#APP
	# 97 "flash_TC2xx.c" 1
		debug
	# 0 "" 2
#NO_APP
.L20:
	.loc 1 92 0 is_stmt 1 discriminator 2
	ld.w	%d3, [%SP] 4
	add	%d3, -1
	st.w	[%SP] 4, %d3
	ld.w	%d3, [%SP] 4
	jgtz	%d3, .L83
.L15:
	.loc 1 99 0
	ld.w	%d9, [%SP] 28
	ld.w	%d3, [%SP] 12
	madd	%d3, %d3, %d9, 4
	st.w	[%SP] 12, %d3
	.loc 1 61 0
	jnz	%d15, .L82
.L18:
	.loc 1 101 0
	mov	%d15, 0
	.loc 1 102 0
	movh.a	%a15, 44800
	lea	%a15, [%a15] 21844
	.loc 1 101 0
	st.w	[%a4] 16, %d15
	.loc 1 102 0
	mov	%d15, 250
	st.w	[%a15]0, %d15
	.loc 1 103 0
#APP
	# 103 "flash_TC2xx.c" 1
		debug
	# 0 "" 2
#NO_APP
	j	.L8
.LFE1:
	.size	main, .-main
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
	.uleb128 0x120
	.align 2
.LEFDE2:
.section .text,"ax",@progbits
.Letext0:
.section .debug_info,"",@progbits
.Ldebug_info0:
	.uaword	0x300
	.uahalf	0x3
	.uaword	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.string	"GNU C 4.9.4 build on 2021-03-13 -mlicense-dir=e:\\aurix_mingw_install\\tricore_494_mingw\\bin\\../lib/gcc/tricore-elf/4.9.4/../../../../licenses -mtc161 -g3 -O2 -fno-peephole2 -fno-common -fno-short-enums -fsingle-precision-constant"
	.byte	0x1
	.string	"flash_TC2xx.c"
	.string	"E:\\\\AURIX_MINGW\\\\SRC\\\\aurix_flasher\\\\gdb_flash_drivers"
	.uaword	.Ltext0
	.uaword	.Letext0
	.uaword	.Ldebug_line0
	.uaword	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.string	"start"
	.byte	0x1
	.byte	0x1f
	.byte	0x1
	.uaword	.LFB0
	.uaword	.LFE0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x3
	.byte	0x1
	.string	"main"
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.uaword	.LFB1
	.uaword	.LFE1
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uaword	0x2a0
	.uleb128 0x4
	.string	"parameter"
	.byte	0x1
	.byte	0x29
	.uaword	0x2a0
	.byte	0x1
	.byte	0x64
	.uleb128 0x5
	.string	"timeout"
	.byte	0x1
	.byte	0x2b
	.uaword	0x2bb
	.byte	0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x5
	.string	"len"
	.byte	0x1
	.byte	0x2c
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x5
	.string	"valid"
	.byte	0x1
	.byte	0x2c
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x5
	.string	"i"
	.byte	0x1
	.byte	0x2c
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x6
	.string	"j"
	.byte	0x1
	.byte	0x2c
	.uaword	0x2c7
	.uleb128 0x5
	.string	"physical"
	.byte	0x1
	.byte	0x2c
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x6
	.string	"addr"
	.byte	0x1
	.byte	0x2d
	.uaword	0x2dc
	.uleb128 0x6
	.string	"addr_unaligned"
	.byte	0x1
	.byte	0x2e
	.uaword	0x2c7
	.uleb128 0x5
	.string	"addr_aligned"
	.byte	0x1
	.byte	0x2e
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -276
	.uleb128 0x7
	.string	"data"
	.byte	0x1
	.byte	0x2f
	.uaword	0x2dc
	.uaword	.LLST0
	.uleb128 0x5
	.string	"read"
	.byte	0x1
	.byte	0x2f
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x5
	.string	"low32bit"
	.byte	0x1
	.byte	0x30
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -268
	.uleb128 0x5
	.string	"high32bit"
	.byte	0x1
	.byte	0x30
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x5
	.string	"burst"
	.byte	0x1
	.byte	0x31
	.uaword	0x2c7
	.byte	0x3
	.byte	0x91
	.sleb128 -260
	.uleb128 0x5
	.string	"burst_buffer"
	.byte	0x1
	.byte	0x32
	.uaword	0x2fe
	.byte	0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x6
	.string	"dummy"
	.byte	0x1
	.byte	0x33
	.uaword	0x2c7
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.uaword	0x2a6
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.string	"long unsigned int"
	.uleb128 0xa
	.uaword	0x2c0
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.uaword	0x2cc
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.string	"unsigned int"
	.uleb128 0x8
	.byte	0x4
	.uaword	0x2c7
	.uleb128 0xb
	.uaword	0x2cc
	.uaword	0x2f2
	.uleb128 0xc
	.uaword	0x2f2
	.byte	0x3f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.string	"sizetype"
	.uleb128 0xa
	.uaword	0x2e2
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uaword	.LVL1-.Ltext0
	.uaword	.LVL2-.Ltext0
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL2-.Ltext0
	.uaword	.LVL3-.Ltext0
	.uahalf	0x3
	.byte	0x83
	.sleb128 -4
	.byte	0x9f
	.uaword	.LVL3-.Ltext0
	.uaword	.LVL4-.Ltext0
	.uahalf	0x1
	.byte	0x63
	.uaword	.LVL5-.Ltext0
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
	.string	"FLASH0_FSR 0xf8002010u"
	.byte	0x1
	.uleb128 0x15
	.string	"MEM(address) (*((volatile unsigned int *)(address)))"
	.byte	0x1
	.uleb128 0x18
	.string	"MEM16(address) (*((volatile unsigned short *)(address)))"
	.byte	0x1
	.uleb128 0x1b
	.string	"MEM8(address) (*((volatile unsigned char *)(address)))"
	.byte	0x4
	.byte	0
.section .debug_line,"",@progbits
.Ldebug_line0:
.section .debug_str,"",@progbits
	.ident	"GCC: (cosmocomp Release GPL_HIGHTEC_GCC494) 4.9.4 build on 2021-03-13"
