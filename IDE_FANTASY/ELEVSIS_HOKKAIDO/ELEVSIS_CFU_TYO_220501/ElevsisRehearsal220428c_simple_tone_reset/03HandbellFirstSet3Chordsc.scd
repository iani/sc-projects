{
	SinOsc.ar(10 * 23, 0.0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z1.bin > 0.5, 0.001)
} +> \tasosR;

//:
{
	SinOsc.ar(10 * 22, 0.0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z2.bin > 0.5, 0.001)
} +> \tasosL;

//:
//:
{
	SinOsc.ar(10 * 24, 0, 0.1)
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z3.bin > 0.5, 0.001)
} +> \nataliR;

//:
{
	SinOsc.ar(10 * 25, 0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z4.bin > 0.5, 0.001)
} +> \nataliL;
