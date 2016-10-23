!cpu 6502 

!to "chickengenerator.prg",cbm    ; output file 



; useful links  

; http://sta.c64.org/cbm64scr.html 

; http://www.1000bit.it/support/manuali/commodore/c64/Machine_Code_Games_Routines_for_the_Commodore_64.pdf 

; http://www.6502.org/tutorials/6502opcodes.html#CMP 

; http://sta.c64.org/cbm64mem.html 

; http://www.binaryhexconverter.com/decimal-to-hex-converter 

; http://sta.c64.org/cbm64krnfunc.html 



;============================================================ 

; BASIC loader with start address $c000 

;============================================================ 



* = $0801                                ; BASIC start address (#2049) 

!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000... 

!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152 

   				            ; start address for 6502 code 



!source "chickengenerator.asm" 

!source "main.asm"