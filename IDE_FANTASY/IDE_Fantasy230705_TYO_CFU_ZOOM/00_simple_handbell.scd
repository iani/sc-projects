/*  5 Jul 2023 20:29

*/

/*  2 Jul 2023 18:12

*/
//:
{  SinOsc.ar(200, 0, 0.1) * (\x5.sr > 0.5).lag(0.2) } +> \mary1;
{  SinOsc.ar(300, 0, 0.1) * (\x7.sr > 0.5).lag(0.2) } +> \mary2;
//:
{  SinOsc.ar(400, 0, 0.1) * (\x9.sr > 0.5).lag(0.3) } +> \yoshimitsu1;
{  SinOsc.ar(500, 0, 0.1) * (\x10.sr > 0.5).lag(0.3) } +> \yoshimitsu2;
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
	Resonz.ar(PinkNoise.ar(0.5), XLine.kr(200, 500, 120), 0.5) * (\z1.sr < 0.5).lag(0.1)
} +> \jun1;

{
	Resonz.ar(PinkNoise.ar(0.5), XLine.kr(500, 200, 120), 0.5) * (\z2.sr < 0.5).lag(0.1)
} +> \jun2;
//:
{
	Resonz.ar(PinkNoise.ar(0.5),
		LFNoise0.kr(14).range(1, 1.5)

		* XLine.kr(200, 500, 120), 0.5) * (\z1.sr < 0.5).lag(0.2)
} +> \jun1;

{
	Resonz.ar(PinkNoise.ar(0.5),
	LFNoise0.kr(14).range(1, 1.5) *
		XLine.kr(500, 200, 120), 0.5) * (\z2.sr < 0.5).lag(0.2)
} +> \jun2;

{  SinOsc.ar(XLine.kr(300, 700, 120)
	* LFNoise0.kr(14).range(1, 1.5)
	* [1.0, 5/4], 0, 0.05) * (\x3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(XLine.kr(5000, 200, 120)
	* LFNoise0.kr(14).range(1, 1.5)
	* [1.0, 6/5], 0, 0.05) * (\x4.sr < 0.5).lag(0.3) } +> \asayo2;
//:
{  SinOsc.ar(XLine.kr(300, 700, 120) * [1.0, 5/4]
	* LFNoise0.kr(7).range(1, 1.1)
	, 0, 0.05) * (\x3.sr < 0.5).lag(0.3) } +> \asayo1;
{  SinOsc.ar(XLine.kr(5000, 200, 120) * [1.0, 6/5]
	* LFNoise0.kr(7).range(1, 1.1)
	, 0, 0.05) * (\x4.sr < 0.5).lag(0.3) } +> \asayo2;
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
//:
\jun1 stop: 15;
\jun2 stop: 15;
\asayo1 stop: 15;
\asayo2 stop: 15;