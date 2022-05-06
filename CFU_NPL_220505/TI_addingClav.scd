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
} +> \TIa;
)


(
{
	f = InFeedback.ar(80);
	g = Limiter.ar(f);
	FreeVerb2.ar(g, g, 0.7, 0.95) * \amp.kr(0.5);
} +> \TIb;
)


(
SynthDef(\clav, {|pch|
	a = EnvGen.ar(Env.perc(0, 2), doneAction:2);
	b = pch.midicps;
	c = LPF.ar(LFNoise0.ar(6000, a**100/4), 10000);
	d = HPF.ar(CombN.ar(c, 1, 1/b, 1.5), 200);
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
	a = MouseX.kr(0, 24);
	// a = sens[6].linlin(0.45, 0.55, 0, 24);
	b = Changed.kr(a.round);
	c = Dseq([1], inf);
	d = Demand.kr(b, 0, c);
	e = Slope.kr(a).sign;
	SendReply.kr(b, '/clav', d*e);
	\amp.kr(0);
} +> \TIa;
)

\TIa.stop;
\TIb.stop;