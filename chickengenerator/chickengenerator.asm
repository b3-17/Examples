hennymenumessage !scr "e. to see hennys:"
pennymenumessage !scr "d. to see pennys:"
hennys !scr "name: henny plumage: shiny black with some red age: 2,"; 
pennys !scr "name: penny plumage: red and brown age: 1,"

scnkey = 	$ff94
getin = 	$ffe4 ;
henny = 	$c200
penny =		$c1ff
			
init_x_register ldx #$00

init_screen      ldx #$00     ; set X to zero (BLACK color code)
                 stx $d021    ; set background color to 
                 stx $d020    ; set border color
 
; shamelessly copied from dustlayer - if you're interested in c64 6502 (and who isn't), go look it up.
               
clear            lda #$20     ; #$20 is the spacebar Screen Code
                 sta $0400,x  ; fill four areas with 256 spacebar characters
                 sta $0500,x 
                 sta $0600,x 
                 sta $06e8,x 
                 lda #$01     ; set foreground to WHITE in Color Ram 
                 sta $d800,x  
                 sta $d900,x
                 sta $da00,x
                 sta $dae8,x
                 inx           ; increment X
                 bne clear     ; x = 0 when we hit 256 which fills the 4 screen ram 256 blocks (look it up on a screen ram map!)
                               ; if not, continue with the loop
                 rts           ; return from this subroutine

print_menu_text	   lda hennymenumessage,x      	; generate one character at x (x is index register) into accumulator
		           sta $0590,x      		   	; dump it into some screen ram address at x!
		           lda pennymenumessage,x      	; generate one character at x (x is index register) into accumulator
		           sta $05e0,x      		    ; dump it into some screen ram address at x!
		
		           inx 							; increment the index!
		           cmp #58         				; compare with decimal code for : to end print line
		           bne print_menu_text    		; recursively branch back if generated value in is equal
		           rts							; return to caller if no branch is executed

menu_loop 		jsr menukeyscan					; don't worry about this, just go to key reader
	 		  	jmp menu_loop					; if nothing interesting happening from a chair, infinite loop

menukeyscan		jsr scnkey						; BORING just reading keys
				jsr getin 						; YAWN get input of key
				bne menuselection 				; user did something!
				rts

menuselection	cmp henny						; system loaded some input, branch if we care
				beq displayhennysearchresult 	; it's a request for hennys! get the stuff!
				cmp penny						; system loaded some input, branch if we care
				beq displaypennysearchresult 	; it's a request for pennys! get the stuff!
				
				rts
				
displayhennysearchresult 	jsr clear 			; I suppose we should clear the screen, geez!
							jsr displayhenny	; oooo generate some henny values!
							rts
				
displayhenny	jsr init_x_register				; reset the index for the generator
				jsr printhenny					; generate henny output, one value at a time
				rts
		
printhenny		lda hennys,x					; iterate through hennys table text, storing one value at a time
				sta $0590,x						; done with this, throw it into screen ram
				inx								; increment the index to go to the next value in the table text
				cmp #44 						; compare with comma decimal 44
				bne printhenny					; done? do it again!
				
				jsr menukeyscan					; don't know why we bother, scan the keys again!
				rts								

displaypennysearchresult 	jsr clear			; I suppose we should clear the screen, geez!
							jsr displaypenny	; oooo generate some penny values!
							rts
				
displaypenny	jsr init_x_register				; reset the index for the generator
				jsr printpenny					; oooo generate some penny values!
				rts
		
printpenny		lda pennys,x					; iterate through hennys table text, storing one value at a time
				sta $0590,x						; done with this, throw it into screen ram
				inx								; increment the index to go to the next value in the table text
				cmp #44 						; compare with comma decimal 44
				bne printpenny					; done? do it again!
				
				jsr menukeyscan					; I guess if you really want to see hennys again or something
				rts






