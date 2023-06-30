{
	SinOsc.ar(100 * 3, 0.0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\x1.bamp(0.1, 0.5) < 0.51)// .lag(1)
} +> \tasosR;

//:
{
	SinOsc.ar(100 * 2, 0.0, 0.1).dup
	//    + fd
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\x2.bamp(0.1, 0.5) < 0.51)// .lag(0.5)
} +> \tasosL;

//:
//:
{
	SinOsc.ar(100 * 4,  0, 0.1).dup
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\z3.bamp(0.1, 0.5) > 0.51).lag
} +> \nataliR;

//:
{
	SinOsc.ar(100 * 5, 0, 0.1).dup
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\z4.bamp(0.1, 0.5) > 0.51).lag
} +> \nataliL;
