// Scene 4 : Elli #5, #6

(
{
	var key = \key.kr(32).midicps;
	var amp = Slope.kr(
		\x8.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.2).min(1);

	z = PMOsc.ar(key, key*2.5, amp**2*4, 0, amp/2);
	z = CombN.ar(z, 0.5, [0.23, 0.27], 1, 0.2, z);

	\amp.kr(0.9).lag(1) * z;
} +> \tiBass;
)


(
{
	var key = \key.kr(33);
	var amp = Slope.kr(
		\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z7.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
	, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	\amp.kr(0.6).lag(1) * osc;
} +> \tiChord;
)


(
{
	var pch =
	\x5.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseX.kr(-1, 1).lag(1);

	var amp = Slope.kr(
		\x5.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	);

	amp = amp.abs.max(0.1).min(1);

	a = PMOsc.ar(10, 10/pch, 1)+1/2;
	b = LFSaw.ar(3)*amp;
	b = HPF.ar(b, a**2*10000);
	c = GVerb.ar(b/\div.kr(100), 1.5, \time.kr(1));
	z = HPF.ar(c, 50, 2) + HPF.ar(c, 600, 0.5);
	z = Limiter.ar(z, -3.dbamp);

	\amp.kr(0.2).lag(1) * z;
} +> \tiGong;
)


(
\tiChord.stop(5);
\tiBass.stop(5);
\amp <+. tiGong 0.8;
)


(
{
	var amp = Slope.kr(
		\x6.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseY.kr(0, 1).lag(1)
	).abs.max(0.1).min(1);

	var pch =
	\x6.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
	// MouseY.kr(0, 1).lag(1);

	a = Impulse.ar(pch*20);
	b = LFSaw.ar(1000)+1/2*72+24;
	c = Latch.ar(b.midicps, a);
	c = Lag.ar(c, 0.01);
	d = PinkNoise.ar(amp);
	d = HPF.ar(d, 50);
	e = CombN.ar(d, 0.1, 0.5/c, 2);
	e = CombN.ar(e/8, 0.1, 1/c, 2);
	e = LPF.ar(e, 150, 4, amp.lag(2) * e);
	e = Limiter.ar(e, -3.dbamp);
	z = Pan2.ar(e, SinOsc.ar(pch*100%1**2*4));

	\amp.kr(0.3).lag(1) * z;
} +> \tiSampHold;
)


\amp <+. tiSampHold 0.7;


(
{
	var amp = Slope.kr(
		\z5.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(1)
	).abs.max(0.1).min(1);

	var pchA =
	\z5.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseX.kr(-1, 1).lag(1);

	var pchB =
	\z6.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseY.kr(-1, 1).lag(1);

	a = LFSaw.ar(pchA*30, 0, pchB*15000+5000);
	a = Latch.ar(a, Impulse.ar(\latch.kr(1000)));
	a = LFSaw.ar(a, 0, amp);
	a = LPF.ar(a, 100, 4, a);
	a = HPF.ar(a, 50);
	a = FreeVerb2.ar(a, a, 0.1, 0.7);

	\amp.kr(0.1).lag(1) * a;
} +> \tiSaw;
)
\amp <+. tiSaw 0.2;


(
\tiGong.stop(5);
\tiSampHold.stop(5);
\tiSaw.stop(5);
)



