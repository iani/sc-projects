/* 20 Nov 2022 13:56
Just some first tests.

old code as model for mapping:
a = SinOsc.ar(\x1.bamp(0.1, 0.5).linlin(0.46, 0.56, 68, 88).midicps, 0, 0.1);

*/
//: main player
{
	var src, pan;
	src = SinOsc.ar(\freq.br(440), 0, 0.1);
	pan = Pan2.ar(src, SinOsc.ar(0.2));
	src * \amp.br(1.0);
} +> \a4h_moan;
//:trying out some mappings : x1  exp freq
{ \x1.sr.lag(0.1).exp(200, 2000) } @>.a4h_moan \freq;
//:trying out amp: z1 > 0.5
// { (\z1.sr > 0.5).lag(0.5) * 1 } @>.a4h_moan \amp;
//:trying out amp: z1 > 0.5
// { (Slope.kr(\z1.sr).lag(0.1) > 0.5).lag(0.5) * 1 } @>.a4h_moan \amp;
//:trying out amp: z1 > 0.5
{ (
	(Slope.kr(\x1.sr).lag(0.1)
		+
		Slope.kr(\z1.sr).lag(0.1)
	)
	> 0.5).lag(0.5) * 1
} @>.a4h_moan \amp;
//:
