[	{ Impulse.kr(XLine.kr(1, 20, 5)) },
	{ | tr |
		Out.ar(0, Decay.kr(tr, 0.05) * WhiteNoise.ar(0.1));
		Stepper.kr(tr);
	}
] +>> \test;
// [{ Impulse.kr(XLine.kr) }] +>> \test; // steady pulse!

{
	\test >>> { (dur: 0.05, amp: 0.05).play; };
	\test >>>.trace { | ... args | args.postln; };
	3.wait; // argument order should be the same as for >>> :
	\test.removeOsc;
	3.wait;
	\test <<< \trace;
	\test >>>.trace { "something different...".postln; };
	\test >>> { | n, msg | (dur: 0.1, degree: msg[3]).play; };
	5.wait;
	\test.stop(0.01);
	"Stopped the triggering synth".postln;
}.fork;