{
	SinOsc.ar(100 * 3, 0.0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\x1.bin < 0.51, 1)
} +> \tasosR;

//:
{
	SinOsc.ar(100 * 2, 0.0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\x2.bin < 0.51, 1)
} +> \tasosL;

//:
//:
{
	SinOsc.ar(100 * 4,  0, 0.1).dup
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z3.bin > 0.51, 1)
} +> \nataliR;

//:
{
	SinOsc.ar(100 * 5, 0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z4.bin > 0.51, 1)
} +> \nataliL;
