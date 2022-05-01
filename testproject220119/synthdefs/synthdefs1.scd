SynthDef("test1def", { | freq = 440 |
	var src, env;
	src = SinOsc.ar(freq, 0, 0.1).dup;
	env = Env.adsr.kr(2, \gate.kr(1));
	Out.ar(0, src * env);
}).add