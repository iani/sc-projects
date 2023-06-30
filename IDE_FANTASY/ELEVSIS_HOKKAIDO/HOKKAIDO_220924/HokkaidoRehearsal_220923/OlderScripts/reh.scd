Project.gui;

Server.killAll;

// TASOS sensor #3 (Ikeda) #4 (Zannos)

// Download Soundfile
(
~path = Platform.userHomeDir;

d = Download("http://de-dicto.net/metal1.wav", ~path +/+ "hoge.wav",
	{\finished.postln}, {\error.postln}, {|rec, tot| [rec, tot].postln});

// d.cancel;
)

s.sendMsg(\b_allocRead, 0, ~path +/+ "hoge.wav");
play{PlayBuf.ar(1, 0)}

// #1
(
{
	var key = \key.kr(32).midicps;
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.2).min(1);

	z = PMOsc.ar(key, key*2.5, amp**2*4, 0, amp/2);
	z = CombN.ar(z, 0.5, [0.23, 0.27], 1, 0.2, z);

	\amp.kr(0.4).lag(1) * z
	* (\z3.bin > 0.5).lag(1);
} +> \phoeBass;
)

\amp <+. phoeBass 0.8;
\phoeBass.stop(5);


// #2
(
{
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(2)
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	\amp.kr(0.3).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoeChord;
)

\amp <+. phoeChord 0.3;
\phoeChord.stop(5);


// #3
(
{
	var pch =
	\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseX.kr(-1, 1).lag(1);

	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
	);

	amp = amp.abs.max(0.1).min(1);

	a = PMOsc.ar(10, 10/pch, 1)+1/2;
	b = LFSaw.ar(3)*amp;
	b = HPF.ar(b, a**2*10000);
	c = GVerb.ar(b/\div.kr(100), 1.5, \time.kr(1));
	z = HPF.ar(c, 50, 2) + HPF.ar(c, 600, 0.5);
	z = Limiter.ar(z, -1.dbamp);

	\amp.kr(0.2).lag(1) * z
	* (\z3.bin > 0.5).lag(1);
} +> \phoeGong;
)

\amp <+. phoeGong 0.8;
\phoeGong.stop(5);


// #4
(
{
	var frq = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseY.kr(0, 1).lag(1)
	).abs.max(0.01).min(1);

	a = Impulse.ar(frq * \mul.kr(10));
	a = EnvGen.ar(Env.perc(0, 0.5), a);
	a = SinOsc.ar(a**30*2000+60, 0, a/2);
	a = HPF.ar(a, 50);
	b = (\root.kr(48) + [0, 5, 10]).midicps.reciprocal;
	c = CombN.ar(a, 0.1, b, 0.7, 0.5);
	a = Splay.ar(c) + a;
	a = FreeVerb2.ar(a[0], a[1], 0.1, 0.8);

	\amp.kr(0.8).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoeKick;
)

\root <+. phoeKick 49;
\amp <+. phoeKick 0.8;
\phoeKick.stop(5);

Project.gui;

// #5
(
{
	var len, rte, frq, trg, pch, loc, dur, pan;
	len = BufDur.kr(\hoge.b.bufnum);
	// rte = \x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.1, 4);
	// rte = MouseY.kr.linlin(0, 1, 0.2, 4);
	rte = LFNoise1.ar(1, 2, 3);
	frq = LFNoise0.kr(rte, 10, 11).lag(1);
	trg = Impulse.ar(frq);
	pch = 1;
	loc = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, len);
	// loc = MouseX.kr.linlin(0, 1, 0, len);
	loc = LFNoise0.ar(1, len/2, len/2);
	dur = LFNoise0.kr(rte, 1, 1).lag(1);
	pan = WhiteNoise.ar;
	z = TGrains.ar(2, trg, \hoge.b.bufnum, pch, loc, dur/frq, pan, 1);
	z = Limiter.ar(z*4, 0.9);

	z = FreeVerb2.ar(z[0], z[1], 0.1, 0.8);
	// z = DelayC.ar(z, 1, LFNoise2.ar(rte*1, 0.1, 0.1));
	// z = HPF.ar(CombN.ar(z, 0.1, 1/700, 0.15), 50);
	// z = SinOsc.ar(500, 0, HPF.ar(z, 3000, 1, z));

	z = Limiter.ar(z, -1.dbamp);
	\amp.kr(0.2).lag(1) * z;
	* (\z3.bin > 0.5).lag(1);
} +> \phoeGrains;
)

\amp <+. phoeGrains 0.05;
\phoeGrains.stop(2);


// #6
(
{
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(1)
	).abs.max(0.1).min(1);

	var pch =
	\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
	// MouseX.kr(0, 1).lag(1);

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

	\amp.kr(0.3).lag(1) * z
	* (\z3.bin > 0.5).lag(1);
} +> \phoeSampHold;
)

\amp <+. phoeSampHold 0.8;
\phoeSampHold.stop(5);


// #7
(
{
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1)
		// MouseX.kr(0, 1).lag(1)
	).abs.max(0.1).min(1);

	var pchA =
	\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseX.kr(-1, 1).lag(1);

	var pchB =
	\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, -1, 1).lag(1);
	// MouseY.kr(-1, 1).lag(1);

	a = LFSaw.ar(pchA*30, 0, pchB*15000+5000);
	a = Latch.ar(a, Impulse.ar(\latch.kr(1000)));
	a = LFSaw.ar(a, 0, amp);
	a = LPF.ar(a, 100, 4, a);
	a = HPF.ar(a, 50);
	a = FreeVerb2.ar(a, a, 0.1, 0.7);

	\amp.kr(0.1).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoeSaw;
)

\amp <+. phoeSaw 0.4;
\phoeSaw.stop(5);



/******** DUEL ********/

Project.gui;

Duel.initialize;

// Duel.newgame;


/* Executing tactics */
~tasosL = \x3.bamp(0.1, 0.5);

~tactic.(0, {{ Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20)), -0.7) } +> \phoenix });
~tactic.(1, {{ ~tasosL.linlin(0.46, 0.56, 1, 50); Pan2.ar(SinOsc.ar(LFNoise0.ar(50, 100)), -0.7) } +> \phoenix });
~tactic.(2, {{ ~tasosL.linlin(0.46, 0.56, 0, 0.5); Pan2.ar(PinkNoise.ar(x), -0.7) } +> \phoenix });
~tactic.(3, {{ ~tasosL.linlin(0.46, 0.56, 0.5, 2); Pan2.ar(SinOsc.ar(10000, 0, LFPulse.ar(x, 0, 0.01)), -0.7) } +> \phoenix });
~tactic.(4, {{ ~tasosL.linlin(0.46, 0.56, 1, 20); Pan2.ar(SinOsc.ar(LFPulse.ar(x, 0, 0.5, 100, 50), 0, 0.2), -0.7) } +> \phoenix });
~tactic.(5, {{ } +> \phoenix });

\phoenix.stop(5);

{ Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 50)), WhiteNoise.ar) } +> \phoenix

(
{
	a = PinkNoise.ar(0.1);
	a = SinOsc.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10)) * a;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)

(
{
	a = SinOsc.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)

(
{
	a = LFPulse.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps)/20;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a = CombN.ar(a, 0.1, 1/250, 0.5);
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)

(
{
	a = PinkNoise.ar;
	a = BPF.ar(a, \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)

(
{
	a = Dust.ar;
	b = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps;
	b = LFNoise0.ar(100, 100, b);
	a = CombN.ar(a, 0.1, 1/b, 0.5);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)

