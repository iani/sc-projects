SynthDef.new(\crackles, {
	arg freq=440, modfreq=200, moddepth=0.1, amp=0.1, sus=1.0, pan=0, out=0;
	var car, mod, env, sig;
	env = EnvGen.kr(Env.perc(0.01, sus, amp), doneAction:2);
	mod = SinOsc.ar(modfreq)*moddepth;
	car = Dust.ar(LFNoise1.kr(freq).range(1,20), mul:mod);
	sig = Pan2.ar(car, pan);
	Out.ar(out, sig*env);
}).add