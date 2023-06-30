
SynthDef(\ev1, {|bus|
	var src;
	src = GrainSin.ar(1,
		Dust.ar(50),
		0.1,
		WhiteNoise.ar(1000))/10;
	Out.ar(bus, src.adsr);
}).store;

SynthDef(\ev2, {|bus|
	var src;
	src = DelayL.ar(
		Mix.fill(10, { LFSaw.ar(1000.rand, 0, 0.1) }),
		0.2,
		LFNoise2.ar(2, 0.1, 0.1));
	Out.ar(bus, src.adsr);
}).store;

SynthDef(\ev2b, {|bus|
	// this synth has no adsr envelope and cannot release!
	a = Mix.fill(10, {
		LFSaw.ar(1000.rand, 0, 0.1)
	});
	b = LFNoise2.ar(2, 0.1, 0.1);
	c = DelayL.ar(a, 0.2, b);
	Out.ar(bus, c);
}).store;

SynthDef(\ev3, {|bus|
	a = LFNoise0.ar(LFNoise0.ar(1), 20, 30);
	b = LFNoise1.ar(a, 48, 64).midicps;
	c = SinOsc.ar(b)/4;
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev4, {|bus|
	a = Dust.ar(10);
	b = LFNoise0.ar(700, 800);
	c = Mix.fill(8, {|i|
		d = PulseDivider.ar(a, 8, i);
		e = EnvGen.ar(Env.perc(0, 0.1), d);
		f = Latch.ar(b, d);
		PMOsc.ar(f, f*2.5, e**2, 0, e/4);
	});
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev5, {|bus|
	a = LFNoise1.ar(1, 3, 4);
	b = SinOsc.ar(a);
	c = BrownNoise.ar(b)/3;
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev6, {|bus|
	a = SinOsc.ar(55)/4;
	Out.ar(bus, a.adsr);
}).store;