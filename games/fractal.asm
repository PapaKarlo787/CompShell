start:
	cls
	xor r0, r0 ;x
	fmov r0, -1.5 ;cr
lp1:
	xor r1, r1 ;y
	fmov r1, -2 ;ci
lp2:
	fmov r2, 0 ;z
	fmov r3, 0
	mov r14, 100
zlp:
	gkey
	call get_Z_AND_ABS
	fcmp r4, 100
	ja .brk
	loop zlp
	point r1, r0

.brk:
	add r1, 1
	fadd r1, 0.05
	cmp r1, 84
	jl lp2

	add r0, 1
	fadd r0, 0.05
	cmp r0, 48
	jl lp1
scur 0, 0
lprint ok
lab:
gkey
cmp r15, 28
jne lab
rt:
ret


get_Z_AND_ABS:
	fmov r4, r2
	fmov r5, r3
	fmul r4, r4
	fmul r5, r5
	fsub r4, r5
	fadd r4, r0
; y
	fmul r3, r2
	fadd r3, r3
	fadd r3, r1
	fmov r2, r4
; abs
	fmov r4, r2
	fmov r5, r3
	fmul r4, r4
	fmul r5, r5
	fadd r4, r5
	ret

X:
	df 0
ok:
db "ready", 0
