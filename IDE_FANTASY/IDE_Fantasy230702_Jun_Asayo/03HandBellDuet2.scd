/*  2 Jul 2023 18:12

*/
//:
{  SinOsc.ar(200, 0, 0.1) * (\x1.sr > 0.5).lag(0.2) } +> \jun1;
{  SinOsc.ar(300, 0, 0.1) * (\x2.sr > 0.5).lag(0.2) } +> \jun2;

{  SinOsc.ar(400, 0, 0.1) * (\x3.sr > 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500, 0, 0.1) * (\x4.sr > 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(200 * 1.1, 0, 0.05) * (\x1.sr > 0.5).lag(0.2) } +> \jun1;
{  SinOsc.ar(300 * 1.1, 0, 0.05) * (\x2.sr > 0.5).lag(0.2) } +> \jun2;

{  SinOsc.ar(400 * 0.9, 0, 0.05) * (\x3.sr > 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500 * 0.9, 0, 0.05) * (\x4.sr > 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(200 * 1.0, 0, 0.05) * (\x1.sr < 0.5).lag(0.2) } +> \jun1;
{  SinOsc.ar(300 * 1.00, 0, 0.05) * (\x2.sr < 0.5).lag(0.2) } +> \jun2;

{  SinOsc.ar(400 * 1.0, 0, 0.05) * (\x3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500 * 1.0, 0, 0.05) * (\x4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(200 * 1.0, 0, 0.05) * (\z1.sr < 0.5).lag(0.2) } +> \jun1;
{  SinOsc.ar(300 * 1.00, 0, 0.05) * (\z2.sr < 0.5).lag(0.2) } +> \jun2;

{  SinOsc.ar(400 * 1.0, 0, 0.05) * (\z3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500 * 1.0, 0, 0.05) * (\z4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(XLine.kr(200, 2000, 120) * 1.0, 0, 0.05) * (\z1.sr < 0.5).lag(0.2) } +> \jun1;
{  SinOsc.ar(XLine.kr(2000, 200, 120), 0, 0.05) * (\z2.sr < 0.5).lag(0.2) } +> \jun2;

{  SinOsc.ar(XLine.kr(100, 200, 60) * 1.0, 0, 0.05) * (\z3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(XLine.kr(5000, 2000, 30) * 1.0, 0, 0.05) * (\z4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
{
	Ringz.ar(PinkNoise.ar(0.1), XLine.kr(200, 2000, 120) * (\z1.sr < 0.5).lag(0.2)
} +> \jun1;
	{  Ringz.ar(PinkNoise.ar(0.1), XLine.kr(2000, 200, 120)) * (\z2.sr < 0.5).lag(0.2)
	} +> \jun2;

{  SinOsc.ar(XLine.kr(100, 200, 60) * 1.0, 0, 0.05) * (\z3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(XLine.kr(5000, 2000, 30) * 1.0, 0, 0.05) * (\z4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(200 * 1.0, 0, 0.05) *
	(\z1.sr < 0.5).lag(0.2)
	* (Slope.kr(\x1.sr).lag(1))
} +> \jun1;
{  SinOsc.ar(300 * 1.00, 0, 0.05) *
	(\z2.sr < 0.5).lag(0.2)
	* (1 - Slope.kr(\x2.sr).lag(1))
} +> \jun2;
//:
{  LFDNoise1.ar(200 * 1.0, 0.05) *
	(\z1.sr < 0.5).lag(0.2)
	* (Slope.kr(\x1.sr).lag(1))
} +> \jun1;
{  SinOsc.ar(300 * 1.00, 0, 0.05) *
	(\z2.sr < 0.5).lag(0.2)
	* (1 - Slope.kr(\x2.sr).lag(1))
} +> \jun2;
//:
{  SinOsc.ar(400 * 1.0, 0, 0.05) * (\z3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500 * 1.0, 0, 0.05) * (\z4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
//
{  SinOsc.ar(200 * 1.01, 0, 0.05) * (\x1.sr < 0.5).lag(0.2) } +> \jun1;
{  SinOsc.ar(300 * 1.001, 0, 0.05) * (\x2.sr < 0.5).lag(0.2) } +> \jun2;

{  SinOsc.ar(400 * 0.99, 0, 0.05) * (\x3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500 * 0.999, 0, 0.05) * (\x4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(200 * 1.0, 0, 0.05) * (\x1.sr > 0.5).lag(0.2)
	* \z2.sr.lag(0.1)
} +> \jun1;
{  SinOsc.ar(300 * 1.00, 0, 0.05) * (\x2.sr > 0.5).lag(0.2)
	* \z2.sr.lag(0.1)
} +> \jun2;

{  SinOsc.ar(400 * 1, 0, 0.05) * (\x3.sr > 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(500 * 1, 0, 0.05) * (\x4.sr > 0.5).lag(0.3) } +> \asayo2;
