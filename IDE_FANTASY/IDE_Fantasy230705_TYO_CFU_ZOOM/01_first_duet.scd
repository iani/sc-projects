//:
{  SinOsc.ar(200, 0, 0.1) * (\x5.sr > 0.5).lag(0.2) } +> \mary1;
{  SinOsc.ar(300, 0, 0.1) * (\x7.sr > 0.5).lag(0.2) } +> \mary2;
//:
{
	Resonz.ar(PinkNoise.ar(0.5), LFNoise0.kr(15).range(1, 2.2) * XLine.kr(200, 500, 120), 0.5) * (\x5.sr > 0.5).lag(1.0)
} +> \mary1;

{
	Resonz.ar(PinkNoise.ar(0.5), LFNoise0.kr(15).range(1, 2.2) * XLine.kr(500, 200, 120), 0.5) * (\x7.sr > 0.5).lag(1.0)
} +> \mary2;

//:
{
	Resonz.ar(PinkNoise.ar(0.5), LFNoise1.kr([15, 16]).range(1, 2.2) * XLine.kr(200, 500, 120), 0.5) * (\x5.sr > 0.5).lag(1.0)
} +> \mary1;

{
	Resonz.ar(PinkNoise.ar(0.5), LFNoise1.kr([21, 22]).range(1, 2.2) * XLine.kr(500, 200, 120), 0.5) * (\x7.sr > 0.5).lag(1.0)
} +> \mary2;

//:
{  SinOsc.ar(400, 0, 0.1) * (\x9.sr > 0.5).lag(0.3) } +> \yoshimitsu1;
{  SinOsc.ar(500, 0, 0.1) * (\x10.sr > 0.5).lag(0.3) } +> \yoshimitsu2;
//:
{  SinOsc.ar(400 * LFNoise0.kr(15).range(1, 1.2), 0, 0.1) * (\x9.sr > 0.5).lag(1.3) }+> \yoshimitsu1;
{  SinOsc.ar(500 * LFNoise0.kr(15).range(1, 1.2), 0, 0.1) * (\x10.sr > 0.5).lag(1.3) } +> \yoshimitsu2;
//:
{  SinOsc.ar(400 * LFNoise0.kr(15).range(1, 1.2), 0, 0.1) * (\x9.sr > 0.5).lag(1.3) }+> \yoshimitsu1;
{  SinOsc.ar(500 * LFNoise0.kr(15).range(1, 1.2), 0, 0.1) * (\x10.sr > 0.5).lag(1.3) } +> \yoshimitsu2;
//:
{  SinOsc.ar(
	XLine.kr(200, 1000, 100) * LFNoise0.kr(15).range(1, 1.2), 0, 0.1) * (\x9.sr > 0.5).lag(1.3) }+> \yoshimitsu1;
{  SinOsc.ar(
	XLine.kr(1000, 200, 100) * LFNoise0.kr(15).range(1, 1.2), 0, 0.1) * (\x10.sr > 0.5).lag(1.3) } +> \yoshimitsu2;
//:
{  SinOsc.ar(
	XLine.kr(200, 1000, 100) * LFNoise0.kr([15, 16]).range(1, 1.2), 0, 0.1) * (\x9.sr > 0.5).lag(1.3) }+> \yoshimitsu1;
{  SinOsc.ar(
	XLine.kr(1000, 200, 100) * LFNoise0.kr([17, 18]).range(1, 1.2), 0, 0.1) * (\x10.sr > 0.5).lag(1.3) } +> \yoshimitsu2;
//:
{  SinOsc.ar(
	XLine.kr(200, 1000, 100) * LFNoise0.kr([5, 6]).range(1, 1.2), 0, 0.1) * (\x9.sr > 0.5).lag(1.3) }+> \yoshimitsu1;
{  SinOsc.ar(
	XLine.kr(1000, 200, 100) * LFNoise0.kr([7, 8]).range(1, 1.2), 0, 0.1) * (\x10.sr > 0.5).lag(1.3) } +> \yoshimitsu2;
//:
{  SinOsc.ar(
	XLine.kr(200, 1000, 100) * LFNoise1.kr([5, 6]).range(1, 1.5), 0, 0.1) * (\x9.sr > 0.5).lag(1.3) }+> \yoshimitsu1;
{  SinOsc.ar(
	XLine.kr(1000, 200, 100) * LFNoise1.kr([7, 8]).range(1, 1.5), 0, 0.1) * (\x10.sr > 0.5).lag(1.3) } +> \yoshimitsu2;
//:
{