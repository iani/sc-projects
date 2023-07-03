/* 21 Feb 2022 22:10

*/

(degree: (-10..10).scramble.clump(3).pseq, dur: 0.1) +>! \test;
//:
~test.addSymbolTr(\x);
//:
{ Impulse.kr(1).kdsr; SendTrig.kr(Impulse.kr(1.51)) } +> \x;
//:
(degree: ((0..10)*2).clump(2).pseq, dur: 0.2) +>! \test2;
//:
~test2.addSymbolTr(\y);
//:
{ | id = 13 | SendTrig.kr(Impulse.kr(1).kdsr, id) } +> \y;
{ STrig(Impulse.kr(1)) } +> \x;
OSC.trace1(\tr);
OSC.untrace1(\tr);
\x.set(\id, 55);
//:
OSC.trace1(\n_go);
OSC.untrace1(\n_go);
OSC.trace1('status.reply');
OSC.untrace1('status.reply');
//:

OSC.untrace;

//:
\y.set(\id, 15.9);
//:
OSC.trace;
~test2;
\test2.hash;
{ SendTrig.kr(Impulse.kr(1).kdsr, \test2.hash) } +> \trace;
OSC.untrace;
//:
\y.stop;
//:
\x.stop;
//:
(degree: ((-10..10).clump(2)).pseq, dur: 0.03) ++> \test;
//:
(degree: ((-10..10).clump(5).flop).pseq, dur: 0.1) ++> \test;
//:
~test
//:
~test.addTr;
//:
~test.addNotifier(OSC, '/tr', { | n |
	n.listener.getNextEvent.play;
});
//:
OSC.trace;
//:
OSC.untrace;
//:
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
{ SendTrig.kr(Impulse.kr(5), \a.hash) } +> \trig;
{ Out.kr(0, SendTrig.kr(Impulse.kr(5)) * Silent.ar.adsr(0.01, 0.001)) } +> \trig;

~trig.free;

{ SinOsc.ar(500, 0, 0.1).adsr } +> \x;
//:
