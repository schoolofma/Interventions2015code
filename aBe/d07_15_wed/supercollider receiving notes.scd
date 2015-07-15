(
SynthDef('funsynth', {
    arg pitch=200;
    var sound = LFTri.ar(pitch, mul:0.2);
    var linen = Env.linen(0.01, sustainTime:0, releaseTime:0.1);
    var env = EnvGen.kr(linen, doneAction:2);
    Out.ar(0, sound * env);
}).add;
)

NetAddr.localAddr
// 127.0.0.1, 57120

(
OSCdef('starlistener', {
    // msg is an array that contains all osc
    // arguments
    arg msg;

    // this is useful for debugging
    msg.postln;

    Synth('funsynth', [pitch:msg[1].midicps]);

}, "/starhit");
)

// midicps is used to convert note numbers
// into frequencies
91.midicps