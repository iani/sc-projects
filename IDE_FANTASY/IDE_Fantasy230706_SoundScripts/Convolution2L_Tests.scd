/*  7 Jul 2023 19:13
Understanding Convolution2L
*/
// allocate three buffers
//:
(
b = Buffer.alloc(s, 2048);
c = Buffer.alloc(s, 2048);
d = Buffer.alloc(s, 2048);

b.zero;
c.zero;
d.zero;
)
//:
(
50.do { |it| c.set(20 * it + 10, 1.0.rand) };
3.do { |it| b.set(400 * it + 100, 1) };
20.do { |it| d.set(40 * it + 20, 1) };
)
//:
(
SynthDef(\conv_test, { | out, kernel, t_trig=0|
    var input = Impulse.ar(1);
    var framesize = 2048; // must have power of two
    var result = Convolution2L.ar(input, kernel, t_trig, framesize, 1, 0.5);
    Out.ar(out, result);
}).add
)
//:
x = Synth(\conv_test, [\kernel, b]);
//: changing the buffer number:
x.set(\kernel, c);
x.set(\t_trig, 1); // after this trigger, the change will take effect.
x.set(\kernel, d);
x.set(\t_trig, 1); // after this trigger, the change will take effect.

d.zero;
40.do { |it| d.set(20 * it + 10, 1) };// changing the buffers' contents
x.set(\t_trig, 1); // after this trigger, the change will take effect.

x.set(\kernel, b);
x.set(\t_trig, 1); // after this trigger, the change will take effect.

x.free;

//: longer crossfade
(
SynthDef(\conv_test2, { |out, kernel, t_trig=0|
    var input = Impulse.ar(1);
    var framesize = 2048; // must have power of two
    var result = Convolution2L.ar(input, kernel, t_trig, 2048, 5, 0.5);
    Out.ar(out, result);
}).add
)
//:
x = Synth(\conv_test2, [\kernel, b]);
//:
// changing the buffer number:
x.set(\kernel, c);
x.set(\t_trig, 1); // after this trigger, the change will take effect.
x.set(\kernel, d);
x.set(\t_trig, 1); // after this trigger, the change will take effect.

d.zero;

40.do { |it| d.set(20 * it + 10, 1) };// changing the buffers' contents

x.set(\t_trig, 1); // after this trigger, the change will take effect.

x.set(\kernel, b);
x.set(\t_trig, 1); // after this trigger, the change will take effect.

x.free;
//:next example
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
//:
(
{
    var input = SoundIn.ar(0);
    var framesize = 2048; // must have power of two
    Convolution2L.ar(input, b, 0, 512, 1, 0.5);
}.play
)
//: