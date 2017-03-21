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
; (in) HL	the memory location of the size-prefixed string
; (in) DE	the offset in the tiles matrix to print the string into
; (regs) all
; --------------------------------------------------------------------------- ;
proc
print_string:
	ld	a, (hl)
	inc	hl
	ex	de, hl
	ld	bc, NAMTBL
	add	hl, bc
	ex	de, hl
	ld	b, 0
	ld	c, a
	call	LDIRVM
	ret
endp

; --------------------------------------------------------------------------- ;
; Clear a line of the screen
; (in) A	the length of the line to be clear
; (in) DE	the offset in the tiles matrix to be cleared
; (regs) all
; --------------------------------------------------------------------------- ;
proc
clear_line:
	ld	hl, NAMTBL
	add	hl, de
	ld	b, 0
	ld	c, a
	xor	a ; Symbol to use while filling VRAM is 0
	call	FILVRM

	ret
endp


;-----------------------------------------------------------------------------;
; Print the scancode symbol in screen
; (in) A	the scan code to be printed
; (in) DE	the offset in the tiles matrix to print the scancode
; (regs) all
;-----------------------------------------------------------------------------;
proc
print_scancode:
	local symbols
; Calculate the offset in `symbols` for the scan code
	ld	hl, symbols
	ld	b, 0
	ld	c, a
	add	hl, bc
	ld	a, (hl)

	ld	hl, NAMTBL
	add	hl, de

	call	WRTVRM

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
; (in) DE	the offset in the tiles matrix to print the brick
; (regs) AF, HL, BC
; --------------------------------------------------------------------------- ;
proc
print_bricks:
	ld	hl, NAMTBL
	add	hl, de

	ld	a, TILE_BRICK0
	call	WRTVRM

	inc	hl
	ld	a, TILE_BRICK1
	call	WRTVRM

	ld	bc, 31
	add	hl, bc
	ld	a, TILE_BRICK3
	call	WRTVRM

	inc	hl
	ld	a, TILE_BRICK2
	call	WRTVRM

	ret
endp

; --------------------------------------------------------------------------- ;
; Print a horizontal line of bricks
; (in)  DE	the offset in the tiles matrix to print the brick
; (in)  A	the number of bricks to be printed
; --------------------------------------------------------------------------- ;
proc
print_brick_hline:
	local loop
	sra	a
loop:
	push	af
	call	print_bricks
	pop	af
	dec	a
	ret	z
	inc	de
	inc	de
	jr	loop
endp

TILE_BRICK0 equ 0x01
TILE_BRICK1 equ 0x02
TILE_BRICK2 equ 0x03
TILE_BRICK3 equ 0x04
