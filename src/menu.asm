;-----------------------------------------------------------------------------;
; File        : rom.asm
; Description : Subroutines to manage main menu
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

;-----------------------------------------------------------------------------;
; Run the main menu in a loop
;-----------------------------------------------------------------------------;
proc
run_menu:
	local sel_opt, redefine_keys

	call	display_menu

sel_opt:
; Show the main menu options
	ld	hl, title
	ld	bc, 0x0c08
	call	print_string
	ld	hl, opt1
	ld	bc, 0x060a
	call	print_string
	ld	hl, opt2
	ld	bc, 0x060b
	call	print_string
	ld	hl, opt3
	ld	bc, 0x060c
	call	print_string

; Select an option from the main menu
	call	scan_key_pressed
	jr	z, sel_opt
	cp	1
	jr	z, sel_opt
	cp	2
	jr	z, sel_opt
	cp	3
	jr	z, redefine_keys
	jr	sel_opt
redefine_keys:
	call	display_menu

	ld	hl, opt3_title
	ld	bc, 0x0608
	call	print_string

	ld	hl, enter_left
	ld	bc, 0x060a
	call	print_string

	ld	bc, 1000
	call	wait_millis

	jr	run_menu

title: 	db 07, "CRATES!"
opt1: 	db 07, "1 START"
opt2:	db 18, "2 ENTER LEVEL CODE"
opt3: 	db 15, "3 REDEFINE KEYS"
opt3_title:
	db 13, "REDEFINE KEYS"
enter_left:
	db 19, "ENTER MOVE LEFT KEY"
endp

; --------------------------------------------------------------------------- ;
; Display the main menu graphics
; --------------------------------------------------------------------------- ;
proc
display_menu:
	call	clear_screen

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

	ret
endp
