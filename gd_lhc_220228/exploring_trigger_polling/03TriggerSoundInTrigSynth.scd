[	{ Impulse.kr(XLine.kr(1, 20, 5)) },
	{ | tr |
		Out.ar(0, Decay.kr(tr, 0.05) * WhiteNoise.ar(0.1));
	}
] +>> \test;
// [{ Impulse.kr(XLine.kr) }] +>> \test; // steady pulse!

{
	\test >>> { (dur: 0.05, amp: 0.05).play; };
	\test >>>.trace { | ... args | args.postln; };
	8.wait;
	\test.stop(0.01);
	"Stopped the triggering synth".postln;
}.fork;