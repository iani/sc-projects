//:
Pdef(\plane2, Pbind(\instrument, \plane,
	\dur, 8,
	\beat, Pseq([3], inf),
	\release, 512,
	\a, 4,
	\beatDiv, 8,
	\amp, Pseq([0.2], inf),
	\rate, Prand([-0.7, 0.25, -2, 2, 4, -5], inf),// * Pseq([6/5, 1, 3/2, 11/10], inf),
	\fFreq, Pseq([3000, 10000, 5000, 7000, 666, 110, 220, 440], inf),
)).play(quant: ~quant);
