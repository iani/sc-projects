

(
// wind chord duo
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(0.5);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
		// sens[3].linlin(0.45, 0.55, key, 132).midicps
	, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	osc * \amp.kr(0);
} +> \tiC;

{
	var key = \key.kr(32);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(0.5);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z4.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
		// sens[3].linlin(0.45, 0.55, key, 132).midicps
	, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	osc * \amp.kr(0);
} +> \tiD;
)

\amp <+.tiC 0.5;
\amp <+.tiD 0.5;

\tiC.stop(8);
\tiD.stop(8);


(
// synth bass
{
	var sens = In.kr(0, 24);
	var trg = Changed.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 4).round(1)
		// MouseX.kr(0, 4).round(1)
		// sens[12].linlin(0.45, 0.55, 0, 4).round(1)
	);
	var pch = Latch.ar(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 24, 60).round(1)
		// MouseX.kr(24, 60).midicps
		// sens[12].linlin(0.45, 0.55, 24, 80).round(1)
		, trg);
	var env = EnvGen.ar(Env.perc(0.001, 0.5), trg);
	var osc = PMOsc.ar(pch, env**50*pch*10+pch*5.5, env*4, 0, env/5);
	osc = SinOsc.ar(pch, 0, env, osc);
	osc = FreeVerb2.ar(osc, osc, 0.2, 0.7);
	osc * \amp.kr(1);
} +> \tiC;
)


(
// stacc chord
{
	var key = \key.kr(36);
	// var sens = In.kr(1, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 10).lag(2)
		// sens[6].linlin(0.45, 0.55, 0, 4).lag(2)
	).abs;

	var osc = Mix.fill(40, {|n|
		var pch = midicps(n*2.5+key);
		t = Dust.ar(amp);
		e = EnvGen.ar(Env.perc(0.01, 0.1), t);
		o = PMOsc.ar(pch, pch/2, 1, 0, e/10);
		x = Lag.ar(Latch.ar(LFNoise0.ar(100), t), 0.01);
		Pan2.ar(o, x);
	});
	osc * \amp.kr(1);
} +> \tiD;
)


(
// tutti sensors
{
	var sens = In.kr(1, 11);
	o = Array.fill(11, {|n|
		a = sens[n];
		b = a.linlin(0.45, 0.55, 24, 132).midicps;
		SinOsc.ar(b.lag(1), 0, 1/24);
	});
	Splay.ar(o) * \amp.kr(0).lag(5);
} +> \tutti;
)

s.scope;

\tutti.stop(10);
\amp <+.tutti 0.2;
\key <+.tiA 34;

Project.gui;

100.rand;