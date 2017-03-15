;-----------------------------------------------------------------------------;
; File        : graphics-data.asm
; Description : Data definitions for char patterns & colors
;
; Copyright (C) 2015-2017 Alvaro Polo
;
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;
;-----------------------------------------------------------------------------;

crates_char_patterns:
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 123, 123, 0, 111, 111, 0, 123
  db 0, 223, 223, 0, 123, 123, 0, 223
  db 223, 0, 123, 123, 0, 223, 223, 0
  db 123, 0, 111, 111, 0, 123, 123, 0
  db 127, 149, 141, 197, 163, 177, 168, 172
  db 254, 89, 81, 99, 69, 141, 149, 117
  db 53, 21, 141, 69, 99, 81, 89, 254
  db 174, 169, 177, 163, 197, 141, 149, 127
  db 127, 149, 141, 197, 163, 177, 168, 172
  db 254, 89, 81, 99, 69, 141, 149, 117
  db 53, 21, 141, 69, 99, 81, 89, 254
  db 174, 169, 177, 163, 197, 141, 149, 127
  db 255, 128, 176, 184, 156, 142, 135, 131
  db 255, 1, 13, 29, 57, 113, 225, 193
  db 193, 225, 113, 57, 29, 13, 1, 255
  db 131, 135, 142, 156, 184, 176, 128, 255
  db 0, 0, 15, 16, 32, 35, 36, 36
  db 0, 0, 255, 0, 0, 255, 0, 0
  db 0, 0, 240, 8, 4, 196, 36, 36
  db 36, 36, 36, 36, 36, 36, 36, 36
  db 36, 36, 196, 4, 8, 240, 0, 0
  db 36, 36, 35, 32, 16, 15, 0, 0
  db 36, 36, 39, 36, 36, 39, 36, 36
  db 36, 36, 228, 36, 36, 228, 36, 36
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 24, 24, 24, 24, 0, 24, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 60, 70, 74, 82, 98, 60, 0
  db 0, 8, 56, 8, 8, 8, 60, 0
  db 0, 60, 66, 2, 60, 64, 62, 0
  db 0, 60, 2, 62, 2, 2, 60, 0
  db 0, 68, 68, 68, 60, 4, 4, 0
  db 0, 62, 64, 60, 2, 66, 60, 0
  db 0, 62, 64, 124, 66, 66, 60, 0
  db 0, 124, 2, 4, 62, 16, 32, 0
  db 0, 60, 66, 60, 66, 66, 60, 0
  db 0, 60, 66, 62, 2, 2, 2, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 24, 36, 66, 126, 66, 66, 0
  db 0, 120, 68, 124, 68, 68, 120, 0
  db 0, 28, 32, 64, 64, 64, 60, 0
  db 0, 120, 68, 68, 68, 68, 120, 0
  db 0, 60, 64, 124, 64, 64, 60, 0
  db 0, 60, 64, 64, 120, 64, 64, 0
  db 0, 28, 32, 64, 76, 66, 60, 0
  db 0, 66, 66, 126, 66, 66, 66, 0
  db 0, 124, 16, 16, 16, 16, 124, 0
  db 0, 28, 8, 8, 8, 72, 48, 0
  db 0, 34, 44, 48, 48, 44, 34, 0
  db 0, 32, 32, 32, 32, 32, 60, 0
  db 0, 102, 90, 90, 66, 66, 66, 0
  db 0, 98, 82, 82, 74, 74, 70, 0
  db 0, 60, 66, 66, 66, 66, 60, 0
  db 0, 120, 68, 68, 120, 64, 64, 0
  db 0, 60, 66, 66, 74, 70, 62, 0
  db 0, 124, 66, 66, 124, 66, 66, 0
  db 0, 62, 64, 124, 2, 2, 124, 0
  db 0, 124, 16, 16, 16, 16, 16, 0
  db 0, 66, 66, 66, 66, 66, 60, 0
  db 0, 66, 66, 66, 66, 36, 24, 0
  db 0, 66, 66, 66, 66, 90, 36, 0
  db 0, 66, 36, 24, 24, 36, 66, 0
  db 0, 68, 40, 16, 16, 16, 16, 0
  db 0, 124, 2, 12, 48, 64, 62, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0
  db 0, 0, 0, 0, 0, 0, 0, 0

crates_char_colors:
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 97, 97, 97, 97, 97, 97, 97, 97
  db 97, 97, 97, 97, 97, 97, 97, 97
  db 97, 97, 97, 97, 97, 97, 96, 96
  db 97, 97, 97, 97, 97, 97, 96, 96
  db 160, 171, 171, 171, 171, 171, 171, 171
  db 160, 171, 171, 171, 171, 171, 171, 171
  db 171, 171, 171, 171, 171, 171, 171, 160
  db 171, 171, 171, 171, 171, 171, 171, 160
  db 32, 35, 35, 35, 35, 35, 35, 35
  db 32, 35, 35, 35, 35, 35, 35, 35
  db 35, 35, 35, 35, 35, 35, 35, 32
  db 35, 35, 35, 35, 35, 35, 35, 32
  db 33, 33, 33, 33, 33, 33, 33, 33
  db 33, 33, 33, 33, 33, 33, 33, 33
  db 33, 33, 33, 33, 33, 33, 33, 33
  db 33, 33, 33, 33, 33, 33, 33, 33
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 80, 80, 80, 80, 80, 80, 80, 80
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 241, 241, 241, 241, 241, 241, 241, 241
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
  db 17, 17, 17, 17, 17, 17, 17, 17
