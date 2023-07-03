Pdef(\pray2, Pbind(\instrument, \pray,
	\dur, 2,
	\beat, Pseq([7, 1, 4, 3, 6], inf),//Pseq((16..1), inf),
	\release, 16,
	\a, 2,
	\beatDiv, 16,
	\amp, 1,
	\rate, Prand([-0.5, 0.5], inf),// * Pseq([6/5, 11/10, 10/9], inf),
	\fFreq, Pseq([3000, 10000, 5000, 7000], inf)
)).play(quant: ~quant);
