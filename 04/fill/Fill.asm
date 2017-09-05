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

// KBD listen loop (main)
(LOOP)
  @KBD
  D=M
  @PRESSED
  D;JGT

  @CLEAR
  0;JMP

(PRESSED)
  @DRAW
  0;JMP

(DRAW)
// Screen declaration
 	@SCREEN
 	D=A
 	@screen
 	M=D

// outer screen draw loop
	@j
	M=1
(OUTERLOOP_D)
 	@j
 	D=M
 	@256
 	D=D-A
 	@LOOP
 	D;JGT
  @j
	M=M+1

// inner screen draw loop
	@i
	M=1
(INNERLOOP_D)
 	@i
 	D=M
 	@32
 	D=D-A
 	@OUTERLOOP_D
 	D;JGT
  @i
	M=M+1

	@screen
	D=M
	@tmp
	A=D
  M=-1
	@screen
	M=M+1

	@INNERLOOP_D
	0;JMP

(CLEAR)
// Screen declaration
 	@SCREEN
 	D=A
 	@screen
 	M=D

// outer screen draw loop
	@j
	M=1
(OUTERLOOP_C)
 	@j
 	D=M
 	@256
 	D=D-A
 	@LOOP
 	D;JGT
  @j
	M=M+1

// inner screen draw loop
	@i
	M=1
(INNERLOOP_C)
 	@i
 	D=M
 	@32
 	D=D-A
 	@OUTERLOOP_C
 	D;JGT
  @i
	M=M+1

	@screen
	D=M
	@tmp
	A=D
  M=0
	@screen
	M=M+1

	@INNERLOOP_C
	0;JMP
