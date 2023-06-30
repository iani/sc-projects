s.boot;
//:
(
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
}).writeOnce;
)
//:
(
SynthDef(\generator2lin, { | clk, step, len, start_pos, end_pos, linearity |
	var imp, notifier, latch, env;
	env = Line.kr;
	notifier = Changed.kr(
		latch = Latch.kr(
			Stepper.kr(Impulse.kr(env), step: step), Impulse.kr(clk)
		)
	);
	//SendReply.kr(notifier, '/analysis', values: [latch, env/clk], replyID: [9900,9901]);
	SendReply.kr(notifier, '/analysis', values: [latch, env/clk]);
	K2A.ar(latch);
}).writeOnce;
)
//: rewriting to clarify purposes of components
SynthDef(\generator2linbroken, { | clk, step, len, start_pos, end_pos, linearity |
	var env, imp, trigger, out, lin;
	var samplingClock, generatingClock;
	env = Line.kr;
	samplingClock = Impulse.kr(env);
	generatingClock = Impulse.kr(clk);
	trigger = Changed.kr(
		out = Latch.kr(
			Stepper.kr(imp.kr(env), step: step), imp.kr(clk)
		)
	);
	//SendReply.kr(trigger, '/analysis', values: [latch, env/clk], replyID: [9900,9901]);
	SendReply.kr(trigger, '/analysis', values: [out, env/clk]);
	K2A.ar(out);

}).load;

//:

SynthDef.synthDefDir
