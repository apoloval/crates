;-----------------------------------------------------------------------------;
; File        : graphics.asm
; Description : Subroutines to manage game graphics
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

; --------------------------------------------------------------------------- ;
; Initialize the screen in mode 2
; --------------------------------------------------------------------------- ;
proc
init_screen:
	ld	hl, FORCLR
	ld	(hl), 15
	ld	hl, BAKCLR
	ld	(hl), 1
	ld	hl, BDRCLR
	ld	(hl), 1

	call	INIGRP
	ret
endp

; --------------------------------------------------------------------------- ;
; Clears the screen, setting all the char map bytes to zero.
; (regs) all
; --------------------------------------------------------------------------- ;
proc
clear_screen:
	ld	hl, NAMTBL
	ld	bc, 768
	xor	a
	call	FILVRM
	ret
endp

; --------------------------------------------------------------------------- ;
; Loads the graphic data (char patterns & colors) in VRAM
; (regs) all
; --------------------------------------------------------------------------- ;
proc
load_graphics:
	call	DISSCR

; Fill the char table, bank 0
	ld	hl, BANK_PATTERN_0
	ld	de, CHRTBL
	ld	bc, 32*8*8
	call	LDIRVM

; Now the bank 1
	ld	hl, BANK_PATTERN_1
	ld	de, CHRTBL+32*8*8
	ld	bc, 32*8*8
	call	LDIRVM

; And finally the bank 2
	ld	hl, BANK_PATTERN_2
	ld	de, CHRTBL+32*8*8*2
	ld	bc, 32*8*8
	call	LDIRVM

; Fill the color table, bank 0
	ld	hl, BANK_COLOR_0
	ld	de, CLRTBL
	ld	bc, 32*8*8
	call	LDIRVM

; Now the bank 1
	ld	hl, BANK_COLOR_1
	ld	de, CLRTBL+32*8*8
	ld	bc, 32*8*8
	call	LDIRVM

; Now the bank 2
	ld	hl, BANK_COLOR_2
	ld	de, CLRTBL+32*8*8*2
	ld	bc, 32*8*8
	call	LDIRVM

; Done, clear, enable screen & return
	call	clear_screen
	call	ENASCR
	ret
endp

; --------------------------------------------------------------------------- ;
; Display the given size-prefixed string at given location
; (in) hl	the memory location of the size-prefixed string
; (in) b	the column where string is printed
; (in) c	the row where string is printed
; (regs) all
; --------------------------------------------------------------------------- ;
proc
print_string:
	ld	a, (hl)
	inc	hl
	push	hl
	ld	h, 0
	ld	l, a
	push	hl

	call	buffer_offset
	ld	bc, NAMTBL
	add	hl, bc

	ex	de, hl
	pop	bc
	pop	hl
	call	LDIRVM
	ret
endp

; --------------------------------------------------------------------------- ;
; Clear a line of the screen
; (in) A	the length of the line to be clear
; (in) B	the column of the line to clear
; (in) C	the row of the line to clear
; (regs) all
; --------------------------------------------------------------------------- ;
proc
clear_line:
	call	buffer_offset
	ld	bc, NAMTBL
	add	hl, bc

; Extend input in A to 16-bits in BC
	ld	b, 0
	ld	c, a

; Symbol to use while filling VRAM is 0
	xor	a

	call	FILVRM
	ret
endp


;-----------------------------------------------------------------------------;
; Print the scancode symbol in screen
; (in) A	the scan code to be printed
; (in) B	the column where symbol will be printed
; (in) C	the row where symbol will be printed
; (regs) all
;-----------------------------------------------------------------------------;
proc
print_scancode:
	local symbols
; Calculate the offset in `symbols` for the scan code and push
	ld	hl, symbols
	ld	d, 0
	ld	e, a
	add	hl, de
	push	hl

	call	buffer_offset
	ld	de, NAMTBL
	add	hl, de
	ex	de, hl

	ld	bc, 1
	pop	hl
	call	LDIRVM

	ret
symbols:
	db "01234567"
	db "89??????"
	db "??????AB"
	db "CDEFGHIJ"
	db "KLMNOPQR"
	db "STUVWXYZ"
	db "????????"
	db "????????"
	db "????????"
	db "????????"
	db "????????"
endp


; --------------------------------------------------------------------------- ;
; Print bricks in the given location
; (in)  b: the column where brick is printed
; (in)  c: the row where brick is printed
; (regs) all
; --------------------------------------------------------------------------- ;
proc
print_bricks:
	call	buffer_offset
	ld	bc, NAMTBL
	add	hl, bc

	ld	a, TILE_BRICK0
	call	WRTVRM

	inc hl
	ld	a, TILE_BRICK1
	call	WRTVRM

	ld	bc, 31
	add	hl, bc
	ld	a, TILE_BRICK3
	call	WRTVRM

	inc hl
	ld	a, TILE_BRICK2
	call	WRTVRM

	ret
endp

; --------------------------------------------------------------------------- ;
; Print a horizontal line of bricks
; (in)  d: the column where brick line starts
; (in)  e: the row where brick line is printed
; (in)  a: the column where brick line ends
; --------------------------------------------------------------------------- ;
proc
print_brick_hline:
	local loop
loop:
	ld	b, a
	ld	c, e
	push	af
	push	de
	call	print_bricks
	pop	de
	pop	af
	cp	d
	ret	z
	sub	2
	jr	loop
endp

; --------------------------------------------------------------------------- ;
; Print a vertical line of bricks
; (in)  d: the column where brick line is printed
; (in)  e: the row where brick line starts
; (in)  a: the row where brick line ends
; --------------------------------------------------------------------------- ;
proc
print_brick_vline:
	local loop
loop:
	ld	b, d
	ld	c, a
	push	af
	push	de
	call	print_bricks
	pop	de
	pop	af
	cp	e
	ret	z
	sub	2
	jr	loop
endp

; --------------------------------------------------------------------------- ;
; Compute the memory offset in a buffer for a column and row tuple
; (in) b	the column coordinate
; (in) c	the row coordinate
; (out) hl	the buffer offset
; (regs) hl, bc
; --------------------------------------------------------------------------- ;
proc
buffer_offset:
; Put C in HL multiplied by 32. This is done by putting it in H (equivalent
; to shift it 8 bits left) and then rotating right 3 times (5 bits shift left).
	ld	hl, 0
	ld	h, c
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l

; Now just add the column in B to HL
	ld	c, b
	ld	b, 0
	add	hl, bc
	ret
endp

TILE_BRICK0 equ 0x01
TILE_BRICK1 equ 0x02
TILE_BRICK2 equ 0x03
TILE_BRICK3 equ 0x04
