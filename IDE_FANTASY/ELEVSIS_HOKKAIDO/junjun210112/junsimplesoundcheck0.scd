{
	var src;
	src = SinOsc.ar(
		LinLin.ar(\junLz.in, 0.45, 0.55, 1600, 2000),
		0,
		LinLin.ar(
			\junRz.in + \junRx.in + \junRy.in
			, 1.45, 2.55, 0.0, 0.15)
	);
	Pan2.ar(src);

} +> \jun0
//:
{
	var src;
	src = SinOsc.ar(
		LinExp.ar(Lag.kr(\junLz.in, 0.5), 0.45, 0.55, 400, 600),
		0,
		LinLin.ar(\junRx.in, 0.45, 0.55, 0.0, 0.15)
	);
	Pan2.ar(src);

} +> \jun0