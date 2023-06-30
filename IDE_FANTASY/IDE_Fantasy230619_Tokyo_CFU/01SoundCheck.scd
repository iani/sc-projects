/*  6 Jun 2023 15:27

*/
\default +> \test;


{ WhiteNoise.ar([0.05, 0]); } +> \ampcheck1;
{ WhiteNoise.ar([0, 0.05]); } +> \ampcheck1;

//:Stereo output check
{ SinOsc.ar(400, 0, [0.1, 0]); } +> \ampcheck1;
{ SinOsc.ar(400, 0, [0.0, 0.1]); } +> \ampcheck1;
//:Sensor control check
{ WhiteNoise.ar([0.1, 0]); } +> \ampcheck1;
{ WhiteNoise.ar([0.0, 0.1]); } +> \ampcheck1;
//: absolute oriention basic check
{ SinOsc.ar(400, 0, 0.1).dup * (\x5.sr > 0.3) } +> \ampcheck1;
//: movement basic check
{
	var env, src;
	env = Env.perc(0.5, 1.0);
	src = PinkNoise.ar(0.1) * env.kr(gate:
		Amplitude.kr(Slope.kr(\x5.sr.lag(0.1))) > 0.9, doneAction: 0
	);
	Ringz.ar(src, \z6.sr.exp(30, 6000).lag(0.1),
		\z5.sr.lag(0.1).linexp(0.01, 1.0, 0.001, 1.6)
	) * 0.1
} +> \natali;
//:


{ SinOsc.ar(400, 0, 0.1).dup * (\x1.sr < 0.5) } +> \ampcheck1;
{ WhiteNoise.ar(0.05).dup * (\x1.sr < 0.5) } +> \ampcheck1;
