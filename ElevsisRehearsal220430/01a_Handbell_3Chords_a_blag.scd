{
	SinOsc.ar(100 * 3, 0.0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\x1.blag < 0.51)
} +> \tasosR;

//:
{
	SinOsc.ar(100 * 2, 0.0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\x2.blag < 0.51)
} +> \tasosL;

//:
//:
{
	SinOsc.ar(100 * 4,  0, 0.1).dup
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\z3.blag > 0.51)
} +> \nataliR;

//:
{
	SinOsc.ar(100 * 5, 0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\z4.blag > 0.51)
} +> \nataliL;
