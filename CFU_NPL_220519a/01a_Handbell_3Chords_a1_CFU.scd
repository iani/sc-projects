
{
SinOsc.ar(100 * 3, 0.0, 0.1).dup
//    +
//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
* (\z2.bamp(0.1, 0.5) < 0.51) * \amp.kr(1.0)
} +> \cfu1R;

//:
{
SinOsc.ar(100 * 2, 0.0, 0.1).dup
//    +
//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
// * Lag.kr(\x2.bin < 0.51, 1) * \amp.kr(1.0)
* (\z1.bamp(0.1, 0.5) < 0.51) * \amp.kr(1.0)
} +> \cfu1L;

//:
//:
{
SinOsc.ar(100 * 4,  0, 0.1).dup
//
//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
// * Lag.kr(\z3.bin > 0.51, 1) * \amp.kr(1.0)
* (\z4.bamp(0.1, 0.5) < 0.51) * \amp.kr(1.0)
} +> \cfu2R;

//:
{
SinOsc.ar(100 * 5, 0, 0.1).dup
//    +
//	SinOsc.ar(100 * Rand(1, 12).round, 0.0, 0.1)
* (\z3.bamp(0.1, 0.5) < 0.51) * \amp.kr(1.0)

// * Lag.kr(\z3.bin > 0.51, 1) * \amp.kr(1.0)
// * Lag.kr(\z3.bin > 0.51, 1) * \amp.kr(1.0)
} +> \cfu2L;

