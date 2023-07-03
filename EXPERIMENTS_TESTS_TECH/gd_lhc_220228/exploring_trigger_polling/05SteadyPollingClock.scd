// The sampling clock should have a steady rate, while the clock triggering
// the stepper should have a variable rate.
[	{ Impulse.kr(10) }, // constant sampling rate
	{ | tr |
		var stepperclock; // variable stepper triggering rate:
		stepperclock = Impulse.kr(XLine.kr(0.5, 100, 120));
		Out.ar(0, Decay.kr(tr, 0.05) * WhiteNoise.ar(0.1));
		Stepper.kr(stepperclock, step: 1);
	}
] +>> \test;
// [{ Impulse.kr(XLine.kr) }] +>> \test; // steady pulse!

{
	// \test >>> { | n, msg | (dur: 0.1, degree: msg[3]).play; };
	\test >>>.trace { | ... args | args.postln; };
	125.wait;
	\test.stop(0.01);
	"Stopped the triggering synth".postln;
}.fork