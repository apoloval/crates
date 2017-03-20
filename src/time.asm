;-----------------------------------------------------------------------------;
; File        : time.asm
; Description : Subroutines to manage time
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

;-----------------------------------------------------------------------------;
; Wait a number of milliseconds (aprox).
; (in) BC	the number of milliseconds to wait
; (regs) A, BC
;-----------------------------------------------------------------------------;
proc
wait_millis:
	local wait_one_milli
	ld	a, 223 ; 223 loops of 16 cycles ~ 1 millisecond @ 3.58Mhz
wait_one_milli:
; Loop 16 cycles
	dec	a ; 4 cycles
	jr	nz, wait_one_milli ; 12 cycles

	dec	bc
	ld	a, b
	or	c
	jr	nz, wait_millis
	ret
endp
