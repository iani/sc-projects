//:

SynthDef(\generator, { | clk, step, len, start_pos, end_pos, linearity |
	var env, imp, notifier, latch, lin;
	lin = [Line.kr, XLine.kr];
	env = Select.kr(linearity, lin);
	imp = Impulse;
	notifier = Changed.kr(
		latch = Latch.kr(
			Stepper.kr(imp.kr(env), step: step), imp.kr(clk)
		)
	);
	//SendReply.kr(notifier, '/analysis', values: [latch, env/clk], replyID: [9900,9901]);
	SendReply.kr(notifier, '/analysis', values: [latch, env/clk]);
}).add;

//:

SynthDef(\generator2lin, { | clk, step, len, start_pos, end_pos, linearity |
	var imp, notifier, latch, env;
	env = Line.kr;
	notifier = Changed.kr(
		latch = Latch.kr(
			Stepper.kr(Impulse.kr(env), step: step), Impulse.kr(clk)
		)
	);
	SendReply.kr(notifier, '/analysis', values: [latch, env/clk]);
	K2A.ar(latch);
}).add;

//:
