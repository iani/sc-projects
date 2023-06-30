{
	SinOsc.ar(100 * 3, 0.0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z1.bin > 0.5, 0.001)
} +> \tasosR;

//:
{
	SinOsc.ar(100 * 2, 0.0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z2.bin > 0.5, 0.001)
} +> \tasosL;

//:
{
	PinkNoise.ar(0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z1.bin > 0.5, 0.001)
} +> \tasosL;

//:
{
	SinOsc.ar(100 * 4, 0, 0.1)
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z3.bin > 0.5, 0.001)
} +> \nataliR;

//:
{
	SinOsc.ar(100 * 5, 0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z4.bin > 0.5, 0.001)
} +> \nataliL;
