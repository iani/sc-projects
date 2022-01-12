//: Souund check: playbuf
// kiiroi (default buffer).
{ | buf = 0 |
	var amp, src;
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	// Pan2.ar(
	// 	src,
	// 	LinLin.kr(\junRz.in, 0.0, 1.0, -0.7, 0.7),
	// 	LinLin.kr(\junLz.in, 0.0, 1.0, 0.0, 1.0)
	// )
} +> \jun0;
//:

\jun0.set(\buf, '14pilgrims'.index)
//:
\jun0.set(\buf, 'birdcarmanshort'.index)
//:
{ | buf = 0 |
	var amp, src;
	buf = 'birdcarmanshort'.bufnum;
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\junRz.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\junL2z.in, 1.0) * 1)
} +> \jun0;