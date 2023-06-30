/* 25 Jun 2023 13:36

*/
//:
{
	[
		SinOsc.ar(\freq.br(200)).fader * (\z1.sr > 0.5).lag(1) * 0.01,
		SinOsc.ar(\freq.br(300)).fader * (\z2.sr > 0.5).lag(1) * 0.01
	]
} +> \jun;
//: on is up!!!!!
{

	(SinOsc.ar(\freq.br(600)).fader * (\x3.sr < 0.5).lag(1) * 0.5)
	+
	(SinOsc.ar(\freq.br(700)).fader * (\x4.sr < 0.5).lag(1) * 0.5)
} +> \asayo;
//:

{

	SinOsc.ar(\freq.br(600)).fader * (\x3.sr < 0.5).lag(1) * 0.1
} +> \asayo1;
//:
{
	SinOsc.ar(\freq.br(700)).fader * (\x4.sr < 0.5).lag(1) * 0.1
} +> \asayo2
//:
\jun.stop;
//>
{

	SinOsc.ar(\freq.br(400)).fader * (\x1.sr < 0.5).lag(1) * 0.1
} +> \jun1;
//:
{
	SinOsc.ar(\freq.br(500)).fader * (\x2.sr < 0.5).lag(1) * 0.1
} +> \jun2
//:
\jun.stop;