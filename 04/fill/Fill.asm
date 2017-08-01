// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
	@color
	M=1

(INFITE_LOOP)
	@KBD	
	D=M
	@color
	M=1

	@MINUS_ONE
	D;JGT

 	@FILL
	0;JMP
 	

 	@INFITE_LOOP
 	0;JMP
(MINUS_ONE)
	@color
	M=-1
(FILL)
 	@SCREEN
 	D=A
 	@screen
 	M=D

	@j
	M=1
(LOOP2)
 	@j	
 	D=M
 	@256
 	D=D-A
 	@INFITE_LOOP
 	D;JGT

	@i
	M=1
	@j
	M=M+1
 (LOOP)
 	@i	
 	D=M
 	@32
 	D=D-A
 	@LOOP2
 	D;JGT

	@color			
	D=M

	@KBD
	D=M
	@FILL_SCREEN
	D;JGT

	@BLANK_SCREEN
	D;JEQ

(INCREMENT)
	@i
	M=M+1
	@LOOP
	0;JMP
(FILL_SCREEN)
	@screen
	D=M
	@tmp
	A=D
	M=-1
	@screen
	M=M+1
	@INCREMENT
	0;JMP
(BLANK_SCREEN)
	@screen
	D=M
	@tmp
	A=D
	M=0
	@screen
	M=M+1
	@INCREMENT
	0;JMP
(END)
 	@END
 	0;JMP
