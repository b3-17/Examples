* = $c000 ; load our program into 49152, 4k ram after BASIC

; load our 'search' options
lda #69
sta henny
lda #68
sta penny

jsr init_screen 		; set screen colours
jsr clear				; use dustlayers clear method
jsr init_x_register		; 0 out the x register
jsr print_menu_text		
jsr menu_loop			; start the infinite key scan for the 'search'

rts

