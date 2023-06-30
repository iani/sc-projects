//// Session 220506 //////
/*
\x1.bin
\x1.bamp

\x1 is broken

\z1 Tasos R
\x2 Tasos L
\x3 Student A
\x4 Student B

MUTE on stage

1. Tasos solo
Haruka solo

2. Tasos solo
+ nikki eri
*/

(
{
	a = MouseX.kr(0, 10);
	b = Changed.kr(a.round);
	c = Dseq([1, 2], inf);
	d = Demand.kr(b, 0, c);
	e = Slope.kr(a).sign;
	f = Integrator.kr(d*e);	// ???
	(d*e).poll(b);
	f.poll(b);
	\amp.kr(0);
} +> \tiA;
)


(
//// Master
{
	f = InFeedback.ar(80);
	g = Limiter.ar(f);
	FreeVerb2.ar(g, g, 0.7, 0.95) * \amp.kr(0.5);
} +> \tiX;
)


(
SynthDef(\clav, {|pch|
	a = EnvGen.ar(Env.perc(0, 2), doneAction:2);
	b = pch.midicps;
	c = LPF.ar(LFNoise0.ar(6000, a**100/4), 10000);
	d = HPF.ar(CombN.ar(c, 1, 1/b, 1.5, \mul.kr(0.3)), 200);
	Out.ar(80, d);
}).store;

o.free;
o = OSCFunc({|msg|
	~pch = msg[3].round(0.1) + ~pch ;
	s.sendMsg(\s_new, \clav, -1, 0, 0, \pch, ~pch);
}, '/clav');

~pch = 60;

{
	var sens = In.kr(0, 24);
	// a = MouseX.kr(0, 24);
	a = \z1.bamp.linlin(0.45, 0.55, 0, 10);
	b = Changed.kr(a.round);
	c = Dseq([2, 3], inf);
	d = Demand.kr(b, 0, c);
	e = Slope.kr(a).sign;
	SendReply.kr(b, '/clav', d*e);
	\amp.kr(0);
} +> \tiA;
)

(
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0).min(0.5);
	var osc = PMOsc.ar(8000, 5000, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.05);
} +> \tiA;
)

(
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\x2.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(1);
	var osc = PMOsc.ar(50, 50*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.7);
} +> \tiB;
)

\tiA.stop;
