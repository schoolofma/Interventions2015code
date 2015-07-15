(
SynthDef('funsynth', {
    arg pitch=200;
    var sound = LFTri.ar(pitch, mul:0.2);
    var linen = Env.linen(0.01, sustainTime:0,
        releaseTime:0.1);
    var env = EnvGen.kr(linen, doneAction:2);
    Out.ar(0, sound * env);
}).add;
)

NetAddr.localAddr // 127.0.0.1, 57120

(
OSCdef('starlistener', {
    // msg is an array that contains all osc
    // arguments
    arg msg;

    // this is useful for debugging
    msg.postln;

    Synth('funsynth', [pitch:msg[1].midicps *
        0.98.rrand(1.02)]);

}, "/starhit");
)

// midicps is used to convert note numbers
// into frequencies
91.midicps


// visualize live audio, can be useful to know if you
// are producing quiet audio, or no audio at all
s.scope(2)


// preparing to record
s.prepareForRecord("/tmp/result.aiff");
// start to record
s.record;
// stop recording
s.stopRecording;
