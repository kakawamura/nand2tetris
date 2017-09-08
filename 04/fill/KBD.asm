// Make sure how KBD works
// Expected: the code from KBD is put in RAM[0], except for 0 (no input)

(LOOP)
  @KBD
  D=M
  @TRUE
  D;JGT
  @LOOP
  0;JMP

(TRUE)
  @R0
  M=D
  @LOOP
  0;JMP
