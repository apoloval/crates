;-----------------------------------------------------------------------------;
; File        : crates.asm
; Description : Subroutines to manage controls
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

;-----------------------------------------------------------------------------;
; Initialize the keys to default values
;-----------------------------------------------------------------------------;
proc
init_keys:
	ld	a, DEFAULT_LEFT_KEY
	ld	(KEYS_LEFT), a
	ld	a, DEFAULT_RIGHT_KEY
	ld	(KEYS_RIGHT), a
	ld	a, DEFAULT_UP_KEY
	ld	(KEYS_UP), a
	ld	a, DEFAULT_DOWN_KEY
	ld	(KEYS_DOWN), a
	ret

DEFAULT_LEFT_KEY:
	db 0x24 ; 'O'
DEFAULT_RIGHT_KEY:
	db 0x25 ; 'P'
DEFAULT_UP_KEY:
	db 0x26 ; 'Q'
DEFAULT_DOWN_KEY:
	db 0x16 ; 'A'
endp

;-----------------------------------------------------------------------------;
; Scan keyboard key pressed
; [out] a: the scan code of pressed key
; [out] zero flag is set if none key is pressed, reset otherwise
;-----------------------------------------------------------------------------;
proc
scan_key_pressed:
	local find_row, row_found
	di
; loop index, start at matrix row #10
	ld	bc, 10
find_row:
	ld	hl, NEWKEY
; compute NEWKEY+i in hl
	add	hl, bc
	ld	a, [hl]
	cp	0xff
; done if that row is not 0xff
	jr	nz, row_found
	ld	a, c
	cp	0
; done if all rows were scanned
	jr	z, row_found
	dec	bc
	jr	find_row
row_found:
	ei
; return if no key was pressed
	ret	z
	xor	0xff ; invert all bits in A

; put row in A and column bits in B
	ld	b, a
	ld	a, c
; multiply row by 8 to obtain base scancode
	sla	a
	sla	a
	sla	a
find_col:
	bit	0, b
; col is pressed, scan code is in a: done
	ret	nz
; next bit for next column
	srl	b
; next scancode in row for next column
	inc	a
	jr	find_col
endp
