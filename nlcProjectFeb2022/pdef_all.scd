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
//:
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
//:
Pdef(\pray, Pbind(\instrument, \pray,
	\dur, 4,
	\beat, Pseq([7, 1, 4, 3, 6], inf),//Pseq((16..1), inf),
	\release, 64,
	\a, 2,
	\beatDiv, 16,
	\amp, 16,
	\rate, Prand([-0.5, 0.5], inf),// * Pseq([6/5, 11/10, 10/9], inf),
	\fFreq, Pseq([3000, 10000, 5000, 7000], inf)
)).play(quant: ~quant);

//:
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

//:
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

//:

Pdef(\plane, Pbind(\instrument, \plane,
	\dur, 1,
	\beat, Prand((1..4), inf),
	\release, 256,
	\a, 4,
	\beatDiv, 8,
	\amp, Pseq([0.2], inf),
	\rate, Prand([-1, 1], inf) * Pseq([6/5, 1, 3/2, 11/10], inf),
	\fFreq, Pseq([3000, 10000, 5000, 7000, 666, 110, 220, 440], inf),
	\pan, Prand([-0.8, -0.3, 0, 0.25, 0.6, 0.9], inf)
)).play(quant: ~quant);

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
