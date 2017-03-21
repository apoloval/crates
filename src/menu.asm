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
	local show_opts, sel_opt, goto_opt3
	local title, opt1, opt2, opt3

	call	display_menu

show_opts:
; Show the main menu options
	call	clear_options

	ld	hl, title
	ld	de, 8*32+12
	call	print_string
	ld	hl, opt1
	ld	de, 10*32+6
	call	print_string
	ld	hl, opt2
	ld	de, 11*32+6
	call	print_string
	ld	hl, opt3
	ld	de, 12*32+6
	call	print_string

sel_opt:
; Select an option from the main menu
	call	scan_key_pressed
	jr	z, sel_opt
	cp	1
	jr	z, sel_opt
	cp	2
	jr	z, sel_opt
	cp	3
	jr	z, goto_opt3
	jr	sel_opt

goto_opt3:
	call	redefine_keys
	jr	show_opts

title: 	db 07, "CRATES!"
opt1: 	db 07, "1 START"
opt2:	db 18, "2 ENTER LEVEL CODE"
opt3: 	db 15, "3 REDEFINE KEYS"
endp

; --------------------------------------------------------------------------- ;
; Execute the Redefine Keys option
; --------------------------------------------------------------------------- ;
proc
redefine_keys:
	local title, enter_left
; Wait some time to avoid key bounces from main menu
	ld	bc, 100
	call	wait_millis

	call	clear_options
	ld	hl, title
	ld	de, 8*32+9
	call	print_string

; Read the left key
	ld	hl, enter_left_msg
	ld	de, 10*32+6
	call	print_string
enter_left:
	call	scan_key_pressed
	jr	z, enter_left
	ld	(KEYS_LEFT), a
	ld	de, 10*32+21
	call	print_scancode

	ld	bc, 1000
	call	wait_millis

; Read the right key
	ld	hl, enter_right_msg
	ld	de, 10*32+6
	call	print_string
enter_right:
	call	scan_key_pressed
	jr	z, enter_right
	ld	(KEYS_RIGHT), a
	ld	de, 10*32+22
	call	print_scancode

	ld	bc, 1000
	call	wait_millis

; Read the up key
	ld	hl, enter_up_msg
	ld	de, 10*32+6
	call	print_string
enter_up:
	call	scan_key_pressed
	jr	z, enter_up
	ld	(KEYS_UP), a
	ld	de, 10*32+19
	call	print_scancode

	ld	bc, 1000
	call	wait_millis

; Read the down key
	ld	hl, enter_down_msg
	ld	de, 10*32+6
	call	print_string
enter_down:
	call	scan_key_pressed
	jr	z, enter_down
	ld	(KEYS_DOWN), a
	ld	de, 10*32+21
	call	print_scancode

	ld	bc, 1000
	call	wait_millis

	ret
title:
	db 13, "REDEFINE KEYS"
enter_left_msg:
	db 17, "MOVE LEFT KEY:   "
enter_right_msg:
	db 17, "MOVE RIGHT KEY:  "
enter_up_msg:
	db 17, "MOVE UP KEY:     "
enter_down_msg:
	db 17, "MOVE DOWN KEY:   "
endp

; --------------------------------------------------------------------------- ;
; Display the main menu graphics
; --------------------------------------------------------------------------- ;
proc
display_menu:
	call	clear_screen

	ld	de, 0*32+0
	ld	a, 32
	call	print_brick_hline

	ld	de, 22*32+0
	ld	a, 32
	call	print_brick_hline

	ret
endp

; --------------------------------------------------------------------------- ;
; Clear the lines of text where menu text is shown
; --------------------------------------------------------------------------- ;
proc
clear_options:
	ld	a, 28
	ld	de, 8*32+2
	call	clear_line
	ld	a, 28
	ld	de, 10*32+2
	call	clear_line
	ld	a, 28
	ld	de, 11*32+2
	call	clear_line
	ld	a, 28
	ld	de, 12*32+2
	call	clear_line
	ret
endp
