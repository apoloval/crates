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
; Loads the graphic data (char patterns & colors) in VRAM
; --------------------------------------------------------------------------- ;
proc
load_graphics:
	call	DISSCR

; Fill the char table
	ld	hl, crates_char_patterns
	ld	de, CHRTBL
	ld	bc, 32*8*8
	call	LDIRVM

	ld	hl, crates_char_patterns
	ld	de, CHRTBL+32*8*8
	ld	bc, 32*8*8
	call	LDIRVM

	ld	hl, crates_char_patterns
	ld	de, CHRTBL+32*8*8*2
	ld	bc, 32*8*8
	call	LDIRVM

; Fill the color table
	ld	hl, crates_char_colors
	ld	de, CLRTBL
	ld	bc, 32*8*8
	call	LDIRVM

	ld	hl, crates_char_colors
	ld	de, CLRTBL+32*8*8
	ld	bc, 32*8*8
	call	LDIRVM

	ld	hl, crates_char_colors
	ld	de, CLRTBL+32*8*8*2
	ld	bc, 32*8*8
	call	LDIRVM

; Clear the name table
	ld	hl, NAMTBL
	ld	bc, 768
	xor	a
	call	FILVRM

; Done, enable screen & return
	call	ENASCR
	ret
endp

; --------------------------------------------------------------------------- ;
; Display the main menu graphics
; --------------------------------------------------------------------------- ;
proc
display_menu:
	local title, opt1, opt2, opt3

	ld	hl, title
	ld	a, 0
	ld	bc, 0x0c04
	call	print_string

	ld	hl, opt1
	ld	a, 0
	ld	bc, 0x0607
	call	print_string

	ld	hl, opt2
	ld	a, 0
	ld	bc, 0x0608
	call	print_string

	ld	hl, opt3
	ld	a, 0
	ld	bc, 0x0609
	call	print_string

	ld	de, 0x0000
	ld	a, 30
	call	print_brick_hline

	ld	de, 0x0016
	ld	a, 30
	call	print_brick_hline

	ld	de, 0x0002
	ld	a, 22
	call	print_brick_vline

	ld	de, 0x1e02
	ld	a, 22
	call	print_brick_vline

	ld	de, 0x020c
	ld	a, 28
	call	print_brick_hline

	ld	a, 0
	call	display_main_menu_msg

	ret

title: 	db "CRATES!", 0
opt1: 	db "1 START", 0
opt2:	db "2 ENTER LEVEL CODE", 0
opt3: 	db "3 REDEFINE KEYS", 0
endp

; --------------------------------------------------------------------------- ;
; Display a message in the main menu
; (in) a: the message to be shown, one of
;     0 -> "select an option"
;     1 -> "enter move left key"
; --------------------------------------------------------------------------- ;
proc
display_main_menu_msg:
	local switch, case_0, case_1, break
	local select_opt, enter_left
	sla a
	ld	hl, switch
	ld	b, 0
	ld	c, a
	add	hl, bc
	jp	(hl)

switch:
	jr	case_0
	jr	case_1

case_0:
	ld	hl, select_opt
	ld	a, 0
	jr	break
case_1:
	ld	hl, enter_left
	ld	a, 0
	jr	break

break:
	ld	bc, 0x0611
	call	print_string

	ret

select_opt:
	db "SELECT AN OPTION", 0
enter_left:
	db "ENTER MOVE LEFT KEY", 0
endp

; --------------------------------------------------------------------------- ;
; Display the given string at given location
; (in) hl	the location of the string in memory
; (in) a	the length of the string, or calculate it if zero
; (in) b	the column where string is printed
; (in) c	the row where string is printed
; (regs) all
; --------------------------------------------------------------------------- ;
proc
print_string:
	local len_ready, loop, end_loop
; Calculate the length of the string if zero
	and	a
	jr	nz, len_ready
	push	hl
	push	bc
	ld	b, 0
loop:
	ld	a, (hl)
	and	a
	jr	z, end_loop
	inc	hl
	inc	b
	jr	loop
end_loop:
	ld	a, b
	pop	bc
	pop	hl

len_ready:
	push	hl
	ld	h, 0
	ld	l, a
	push	hl

	call	buffer_offset
	ld	bc, NAMTBL
	add	hl, bc

	ld	d, h
	ld	e, l
	pop	bc
	pop	hl
	call	LDIRVM
	ret
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
; (regs) all
; --------------------------------------------------------------------------- ;
proc
buffer_offset:
	local calc_row, row_done
	ld	hl, 0
calc_row:
	xor	a
	or c
	jr	z, row_done
	ld	a, l
	add	a, 32
	ld	l, a
	ld	a, h
	adc	a, 0
	ld	h, a
	dec	c
	jr	calc_row
row_done:
	ld	c, b
	ld	b, 0
	add	hl, bc
	ret
endp

TILE_BRICK0 equ 0x04
TILE_BRICK1 equ 0x05
TILE_BRICK2 equ 0x06
TILE_BRICK3 equ 0x07
