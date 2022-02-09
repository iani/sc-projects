(
Pdef(\choir, Pbind(\instrument, \choir,
	\dur, 10,
	\beat, Pseq((2048..256), inf),//Pseq((256..2048), inf),//Pseq((16..1), inf),
	\release, 16,
	\a, 8,
	\beatDiv, 2048,
	\amp, 0.5,
	\rate, Prand([-0.5, 0.5], inf),//* Pseq([6/5, 11/10, 10/9], inf),
	// \fFreq, Pseq([3000, 10000, 5000, 7000], inf)
)).play(quant: ~quant);
)