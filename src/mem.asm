;-----------------------------------------------------------------------------;
; File        : crates.asm
; Description : Declaration of working area (stack area, variables, etc)
;
; Copyright (C) 2015 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

STACK_BASE          equ 0xf380
KEYS_LEFT           equ 0xc000
KEYS_RIGHT          equ 0xc001
KEYS_UP             equ 0xc002
KEYS_DOWN           equ 0xc003
