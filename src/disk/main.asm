;-----------------------------------------------------------------------------;
; File        : disk/main.asm
; Description : A wrapper to generate a BIN file containing the main program
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

include "msx-bios.asm"
include "variables.asm"

	org 	BINFILE_BASE_ADDR - 7
header:
	db 	#FE
	dw 	main_start
  	dw 	main_end
  	dw 	main_start

 	org 	BINFILE_BASE_ADDR

main_start:
; Initialization code
 	call	init_keys
 	call	run_menu
stop:
	jr	stop

include "menu.asm"
include "graphics.asm"
include "graphics-data.asm"
include "controls.asm"
include "time.asm"

main_end:
