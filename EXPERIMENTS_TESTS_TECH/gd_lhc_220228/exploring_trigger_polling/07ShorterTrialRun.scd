// Running for 10 seconds only.
// With samplinc clock rate 100.
// The sampling clock should have a steady rate, while the clock triggering
// the stepper should have a variable rate.


~data = nil;
\test >>>.trace { | n, msg | ~data = ~data add: msg[3..]; };

[	{ Impulse.kr(100) }, // constant sampling rate
	{ | tr | // env values guuessed from gd code
		var stepperenv = XLine.kr(1, 210, 10, doneAction: 2);
		var stepperclock; // variable stepper triggering rate:
		stepperclock = Impulse.kr(stepperenv);
		//	Out.ar(0, Decay.kr(tr, 0.05) * WhiteNoise.ar(0.1));
		[Stepper.kr(stepperclock, step: 1), stepperenv / 10];
	}
] +>> \test;

~test.onEnd({
	"data collection done".postln;
	{ ~data.flop[0].plot; }.defer;
});
/*
~data;
~huf = HuffmanEncoder(~data);
~tokens = TokenRecognition(~huf.states);
~trial = ~tokens.tokensProba(~tokens.all_tokens);
//:
~trial;
//:
~trial.list_of_tokens;
~trial.list_of_tokens.collect(_.size);
~all_tokens;
~trial.proba;
~trial.tokensListCoded;
~trial.list_of_tokens do: _.postln;
~trial.states_str;
~huf.states.size;
~huf.states do: _.postln;
~data.size
*/