// The sampling clock should have a steady rate, while the clock triggering
// the stepper should have a variable rate.
[	{ Impulse.kr(10) }, // constant sampling rate
	{ | tr |
		var stepperenv = XLine.kr(0.5, 100, 120);
		var stepperclock; // variable stepper triggering rate:
		stepperclock = Impulse.kr(stepperenv);
		Out.ar(0, Decay.kr(tr, 0.05) * WhiteNoise.ar(0.1));
		[Stepper.kr(stepperclock, step: 1), stepperenv / 10];
	}
] +>> \test;
// [{ Impulse.kr(XLine.kr) }] +>> \test; // steady pulse!

{
	// \test >>> { | n, msg | (dur: 0.1, degree: msg[3]).play; };
	~data = nil;
	\test >>>.trace { | n, msg |
		// args.postln;
		~data = ~data add: msg[3..];
	};
	125 do: { | i |
		i.postln;
		1.wait;
	};
	\test.stop(0.01);
	"Stopped the triggering synth".postln;
}.fork;

// ~data;
//:
// ~data.flop[0].plot;