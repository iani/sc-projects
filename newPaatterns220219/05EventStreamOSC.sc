/* 21 Feb 2022 22:10

*/

(degree: (-10..10).pseq, dur: 0.1) +>! \test;
//:
() +>! \test;
//:
\test.start;
//:
\test.stop;
//:
OSC.addDependant(~test);
//:
OSC.dependants;
//:
{ SendTrig.kr(Impulse.kr(5)) } +> \trig;
{ Out.kr(0, SendTrig.kr(Impulse.kr(5)) * Silent.ar.adsr(0.01, 0.001)) } +> \trig;

~trig.free;

{ SinOsc.ar(500, 0, 0.1).adsr } +> \x;