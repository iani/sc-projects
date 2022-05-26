// Scene 2-2 : Elli #7, Stefania #8
// Scene 4 : Elli #5, #6

(
{
	var key = \key.kr(32).midicps;
	var amp = Slope.kr(
		\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.05).min(1);

	z = PMOsc.ar(key, key*2.5, amp**2*2, 0, amp/3);
	z = CombN.ar(z, 0.5, [0.23, 0.27], 1, 0.2, z);

	\amp.kr(0.5).lag(1) * z;
} +> \tiBass;
)

\tiBass.stop(5);


(
{
	var key = \key.kr(36);
	var amp = Slope.kr(
		\x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z8.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
	, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	\amp.kr(0.5).lag(1) * osc;
} +> \tiChord;
)

\tiChord.stop(5);


(
{
	var pch =
	\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, range).lag(1);
	// MouseX.kr(-1, 1).lag(1);

	var amp =
	\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
	// MouseY.kr(0, 1).lag(1);
	amp = amp.abs.max(0.1).min(1);

	a = PMOsc.ar(10, 10/pch, 1)+1/2;
	b = LFSaw.ar(4)*amp;
	b = HPF.ar(b, a**2*10000);
	c = GVerb.ar(b/\div.kr(100), 1, \time.kr(1));
	z = HPF.ar(c, 50, 2) + HPF.ar(c, 600, 0.5);
	z = Limiter.ar(z, -3.dbamp);

	\amp.kr(0.1).lag(5) * z;
} +> \tiGong;
)

\amp <+. tiGong 1;
\tiGong.stop(5);




(
{
	var pch = Slope.kr(
		\x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.01).min(1);

	a = Impulse.ar(pch*10);
	a = EnvGen.ar(Env.perc(0, 0.2), a);
	a = SinOsc.ar(a**20*8000+50, 0, a/4)!2;
	// a = CombN.ar(HPF.ar(a, 100), 0.1, 0.02, 0.2, 1, a);

	\amp.kr(0.5).lag(1) * a!2;
} +> \tiKick;
)

\tiKick.stop(5);









(
{
	var amp = Slope.kr(
		\x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.05).min(1);

	var pch =
	\x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, range).lag(1);
	// MouseY.kr(0, 1).lag(1);

	a = Impulse.ar(pch*20);
	b = LFSaw.ar(1000)+1/2*72+24;
	c = Latch.ar(b.midicps, a);
	c = Lag.ar(c, 0.01);
	d = PinkNoise.ar(amp);
	d = HPF.ar(d, 1000);
	e = CombN.ar(d, 0.1, 0.5/c, 0.5);
	e = CombN.ar(e/8, 0.1, 1/c, 0.5);
	e = Limiter.ar(e);
	z = Pan2.ar(e, SinOsc.ar(pch*100%1**2*4));

	\amp.kr(0.1).lag(5) * z;
} +> \tiSampHold;
)

\tiSampHold.stop(5);

