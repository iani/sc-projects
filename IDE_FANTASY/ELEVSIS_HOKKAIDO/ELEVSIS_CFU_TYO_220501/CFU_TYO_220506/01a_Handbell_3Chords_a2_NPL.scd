/// ================= NAVPLION ==============
{
	// SinOsc.ar(100 * 3, 0.0, 0.1).dup
	SinOsc.ar(50 * 7, 0.0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\x6.bamp(0.1, 0.5) < 0.51) * \amp.kr(0.5)
} +> \npl1R;

//:
{
	// SinOsc.ar(100 * 2, 0.0, 0.1).dup
	SinOsc.ar(50 * 15, 0.0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	// * Lag.kr(\x2.bin < 0.51, 1) * \amp.kr(0.5)
	* (\x5.bamp(0.1, 0.5) < 0.51) * \amp.kr(0.5)
} +> \npl1L;

//:
{
	// SinOsc.ar(100 * 4,  0, 0.1).dup
	SinOsc.ar(50 * 16, 0, 0.1)
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	// * Lag.kr(\z3.bin > 0.51, 1) * \amp.kr(0.5)
	* (\z8.bamp(0.1, 0.5) < 0.51) * \amp.kr(0.5)
} +> \npl2R;

//:
{
	// SinOsc.ar(100 * 5, 0, 0.1).dup
	SinOsc.ar(50 * 10, 0, 0.1)
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z7.bin > 0.51, 1) * \amp.kr(0.5)
} +> \npl2L;
