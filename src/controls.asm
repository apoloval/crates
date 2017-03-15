;-----------------------------------------------------------------------------;
; File        : crates.asm
; Description : Subroutines to manage controls
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

;-----------------------------------------------------------------------------;
; Initialize the keys to default values
;-----------------------------------------------------------------------------;
proc
init_keys:
  ld hl, DEFAULT_LEFT_KEY
  ld [KEYS_LEFT], hl
  ld hl, DEFAULT_RIGHT_KEY
  ld [KEYS_RIGHT], hl
  ld hl, DEFAULT_UP_KEY
  ld [KEYS_UP], hl
  ld hl, DEFAULT_DOWN_KEY
  ld [KEYS_DOWN], hl
  ret

DEFAULT_LEFT_KEY    dw 0x0404 ; 'O'
DEFAULT_RIGHT_KEY   dw 0x0405 ; 'P'
DEFAULT_UP_KEY      dw 0x0406 ; 'Q'
DEFAULT_DOWN_KEY    dw 0x0206 ; 'A'
endp

;-----------------------------------------------------------------------------;
; Scan keyboard key pressed
; [out] a: the scan code of pressed key
; [out] zero flag is set if none key is pressed, reset otherwise
;-----------------------------------------------------------------------------;
proc
scan_key_pressed:
  di
  ld bc, 10                    ; loop index, start at matrix row #10
_find_row:
  ld hl, NEWKEY
  add hl, bc                   ; compute NEWKEY+i in hl
  ld a, [hl]
  cp 0xff
  jr nz, _row_found            ; done if that row is not 0xff
  ld a, c
  cp 0
  jr z, _row_found             ; done if all rows were scanned
  dec bc
  jr _find_row
_row_found:
  ei
  ret z                        ; return if no key was pressed
  xor 0xff                     ; invert all bits in a
  ld b, a
  ld a, c                      ; a is row, b is column bits
  sla a
  sla a
  sla a                        ; multiply row by 8 to obtain base scancode
_find_col:
  bit 0, b
  ret nz                       ; col is pressed, scan code is in a: done
  srl b                        ; next bit for next column
  inc a                        ; next scancode in row for next column
  jr _find_col
endp
