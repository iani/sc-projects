SynthDef.new(\grain, {
	arg bufnum=0, trnsp=0, spos=0, atk=0.01, sus=0.03, rel=0.01, pan=0, amp=1, out=0;
	var sig, env;
	sig = PlayBuf.ar(1, bufnum, BufRateScale.ir(bufnum)*trnsp.midiratio, startPos:spos, doneAction:2);
	env = EnvGen.kr(Env.new([0,1,1,0],[atk,sus,rel],[1,0,-1]),doneAction:2);
	sig=sig*env;
	sig = Splay.ar(sig, spread: pan, level: amp);
	Out.ar(out, sig);
}).add