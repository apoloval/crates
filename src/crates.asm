;-----------------------------------------------------------------------------;
; File        : crates.asm
; Description : Entry point for Crates!
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

include "msx-bios.asm"

main:
  ; Prepare the stack
  ld hl, STACK_BASE
  ld sp, hl

	call init_screen
	call load_graphics
  call init_keys
  call run_menu
stop:
	jr stop
