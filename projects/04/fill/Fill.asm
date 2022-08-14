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

@SCREEN
D=A
@str
M=D // Initialize Screen Memory Map Start

(LOOP)

@fill
M=0 // Initialize pixel row colour to all white 0000 0000 0000 0000

@KBD
D=M
@WHITE
D;JEQ // If keyboard memory map contents are 0, continue to use white as the fill colour, else set it to black

@fill
M=-1 // Set pixel row colour to all black 1111 1111 1111 1111

(WHITE)

@str
D=M
@ptr
M=D // Loading memory map start value into pointer

(COLOUR)

@ptr
D=M
@24576 // Setting Screen Memory Map End (16384 + (32*256) = 24576)
D=D-A 
@LOOP
D;JGE // Testing if pointer has reached end of memory map

@fill
D=M // Load fill colour
@ptr
A=M // Use pointer to reference location
M=D // Fill colour into referenced location


@ptr
M=M+1 // Incrementing the pointer

@COLOUR
0;JMP // Go to colouring loop start

@LOOP
0;JMP // Go to program loop start