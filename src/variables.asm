;-----------------------------------------------------------------------------;
; File        : crates.asm
; Description : Declaration of working area (stack area, variables, etc)
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

KEYS_LEFT	equ HEAP_BASE_ADDR + 0
KEYS_RIGHT	equ HEAP_BASE_ADDR + 1
KEYS_UP 	equ HEAP_BASE_ADDR + 2
KEYS_DOWN	equ HEAP_BASE_ADDR + 3
