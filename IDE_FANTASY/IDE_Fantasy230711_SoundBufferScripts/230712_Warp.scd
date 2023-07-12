​
(
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff");
x = { |envbuf = -1|
    var pointer, pitch;
    // pointer - move from beginning to end of soundfile over 15 seconds
    pointer = LFSaw.ar(1/15).range(0, 1);
    // control pitch with MouseX
    pitch = MouseX.kr(0.5, 2);
    Warp1.ar(
        numChannels:1,
        bufnum:b,
        pointer:pointer,
        freqScale:pitch,
        windowSize:0.1,
        envbufnum:envbuf,
        overlaps:8,
        windowRandRatio:0.1,
        interp:2
    )
}.play
​
)
​
//:
​
(
// a custom envelope - not a very good one, but you can hear the difference
// between this and the default
var winenv = Env([0, 1, 0], [0.5, 0.5], [8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);
x.set(\envbuf, z);
)
//:​
// the default is -1
x.set(\envbuf, -1);
​
// relase and end
x.relase; z.free;
//:
(
b.free;
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff");
{
    var pointer = Phasor.ar(0, SampleDur.ir / BufDur.ir(b) * XLine.kr(1, 0.25, 20));
    var sound = Warp1.ar(1, b, pointer, 1, 0.3, -1, 16, Line.kr(0, 1, 40), 4);
    Pan2.ar(sound, pointer * 2 - 1, 0.25)
}.play
)
//:
b.free;
