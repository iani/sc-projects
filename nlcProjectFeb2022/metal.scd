(
Pdef(\metal, Pbind(\instrument, \metaloph,
	\dur, 0.2,//2,//Prand([2, 4, 8, 6, 32], inf),
	\beat, Pseq((2..3), inf),//Pseq((16..1), inf),
	\release, 32,//Prand([16, 32, 64, 128, 256, 512], inf),
	\a, 0.5,
	\beatDiv, 4,
	\amp, 1,
	\rate, Prand([-2, 2], inf),// * Pseq([1, 3/2, 9/8, 6/5, 11/10, 10/9], inf),
	\fFreq, Pseq([300, 1000, 500, 700], inf)
)).play(quant: ~quant);
)