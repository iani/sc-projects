/*  4 Jan 2023 18:23

*/
//:version 1 - sines
{
	SinOsc.ar(\freq.br(400)).dup.fader * (\z5.sr > 0.5).lag(1);
} +> \jun;

{
	SinOsc.ar(\freq.br(600)).dup.fader * (\z7.sr > 0.5).lag(1);
} +> \jun2;
//:version 2 - whitenoise + filter
{ Resonz.ar(WhiteNoise.ar(0.1), 300, 5) } +> \test;

//:
{
	Resonz.ar(
		PinkNoise.ar(1),
		10,
		10
	).dup // * (\z5.sr > 0.5).lag(1);
} +> \jun;
//:
{
	SinOsc.ar(\freq.br(600)).dup.fader * (\z7.sr > 0.5).lag(1);
} +> \jun2;
//:
{ XLine.kr(400, 1600, 1.5) } @>.jun \freq;

//:
{
	SinOsc.ar(\freq.br(500)).dup.fader *(\z6.sr > 0.5).lag(1);
} +> \asayo;

{
	SinOsc.ar(\freq.br(650)).dup.fader *(\z6.sr > 0.5).lag(1);
} +> \asayo2;

//:
0.1 @>.jun \amp;
{ LFNoise0.kr(5).range(390, 420) } @>.jun \freq;
//:
{ XLine.kr(400, 1200, 90) } @>.jun \freq;
{ XLine.kr(1200, 400, 90) } @>.asayo \freq;
//:
{ XLine.kr(200, 200 * 8, 180) } @>.jun \freq;
{ XLine.kr(200 * 8, 200, 180) } @>.asayo \freq;
//:
0.1 @>.asayo \amp;

{ LFNoise1.kr(5).range(390 * 2, 420 * 2) } @>.asayo \freq;