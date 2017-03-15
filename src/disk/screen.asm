;-----------------------------------------------------------------------------;
; File        : disk/screen.asm
; Description : A wrapper to generate a BIN file containing the screen stuff
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

include "msx-bios.asm"

	org	BINFILE_BASE_ADDR - 7
header:
	db	#FE
	dw	screen_start
	dw	screen_end
	dw	screen_start

	org	BINFILE_BASE_ADDR

screen_start:
; Initialization code
	call	init_screen
	call	load_graphics
	ret

include "graphics.asm"
include "graphics-data.asm"

screen_end:
