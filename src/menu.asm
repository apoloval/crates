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
	call	scan_key_pressed
	jr	z, sel_opt
	cp	1
	ret	z
	cp	2
	ret	z
	cp	3
	jr	z, redefine_keys
	jr	sel_opt
redefine_keys:
	ld	a, 1
	call	display_main_menu_msg

	jr	sel_opt
endp
