/// ================= NAVPLION ==============
{
	// SinOsc.ar(100 * 3, 0.0, 0.1).dup
	// SinOsc.ar(50 * 7, 0.0, SinOsc.kr(5).range(0.05, 0.15))
	// SinOsc.ar(50 * 7, 0.0, SinOsc.kr(3).range(0.1, 0.15))
	SinOsc.ar(200 * 1, 0.0, SinOsc.kr(3).range(0.1, 0.15))
	//    + fd
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* (\z6.bamp(0.1, 0.5) < 0.51).lag(0.9) * \amp.kr(1.5)
} +> \npl1R;

//:
{
	// SinOsc.ar(100 * 2, 0.0, 0.1).dup
	SinOsc.ar(200 * (9/8), 0.0, SinOsc.kr(2.5).range(0.1, 0.15))
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	// * Lag.kr(\x2.bin < 0.51, 1) * \amp.kr(1.0)
	* (\z5.bamp(0.1, 0.5) < 0.51).lag(0.9) * \amp.kr(1.5)
} +> \npl1L;

//:
{
	// SinOsc.ar(100 * 4,  0, 0.1).dup
	SinOsc.ar(200 * (5/4), 0, SinOsc.kr(3.5).range(0.1, 0.15))
	//
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	// * Lag.kr(\z3.bin > 0.51, 1) * \amp.kr(1.0)
	* (\z8.bamp(0.1, 0.5) < 0.51).lag(0.9) * \amp.kr(1.5)
} +> \npl2R;

//:
{
	// SinOsc.ar(100 * 5, 0, 0.1).dup
	SinOsc.ar(200 * (3/2), 0, SinOsc.kr(4).range(0.1, 0.15))
	//    +
	//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
	* Lag.kr(\z7.bin < 0.51, 1).lag(0.9) * \amp.kr(1.5)
} +> \npl2L;
