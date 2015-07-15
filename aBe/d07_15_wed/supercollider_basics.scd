
(
// create two synths and store them in
// variables a and b
a = { SinOsc.ar([400, 402]) }.play;
b = { SinOsc.ar([200, 202]) }.play;
// s is reserved, avoid it.
)

// plot shows the graph for the wave
{ SinOsc.ar([50, 400], 0.2) }.plot;

(
// stop synths a and b
a.free
b.free
)

// get a float value
// between 0.0 and 400.0
400.0.rand

// play a sine wave with a random frequency
{ SinOsc.ar(400.rand, 0, 0.1) }.play

// play a stereo sound with random frequencies
{ SinOsc.ar([400.rand, 400.rand], 0, 0.1) }.play

// get a random value
// between 400 and 450
400.rrand(450)

{ SinOsc(400) * SinOsc(30)}.play

// variables

// option 1, short one char variable
a = 217;

// option 2, prefix with tilde
~speed = 44;

(
// option 3, using var in a block
var height = 177;
height.postln;
)

// works, it's a global variable
~speed.postln;
// doesn't work, not a global variable,
// not accessible outside it's scope above.
height.postln;
