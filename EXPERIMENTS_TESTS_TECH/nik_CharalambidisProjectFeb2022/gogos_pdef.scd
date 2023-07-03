//:
Pdef(\gogos, Pbind(\instrument, \gogos,
	\dur, 4,
	\beat, Pseq((8..1), inf),
	\a, 1,
	\release, 64,
	\beatDiv, 128,
	\amp, 0.2,
	\rate, Prand([0.5, -0.5], inf),
	\fFreq, Prand([3000, 10000, 5000, 7000], inf)
)).play(quant: ~quant);
