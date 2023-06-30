//: Sea + Wind - controllled by 2nd sensor on ankle (NOR hand)
{ Resonz.ar(WhiteNoise.ar.dup * (\x1.sr > 0.3).lag(1),
	 // \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1)
	\z2.sr.exp(50, 5000).lag(0.4),
	\x2.sr.exp(0.01, 5).lag(0.4)
) * 0.1// * XLine.kr(0.001, 0.1, 20)
} +> \justine;
//: Sea + Wind - controllled by 2nd sensor on ankle (NOR hand)
/// crescendo
{ Resonz.ar(

	Mix(
		SinOsc.ar(
			({ Rand(30, 6000) } ! 50) * \z3.sr.exp(0.5, 2).lag(0.1),
			0, 0.05 // \x3.sr.linexp(0.001, 0.1)
		))
	* \x3.sr.exp(1.1, 3.9)

	* (\x3.sr > 0.3).lag(1),

	 // \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1)
	\z4.sr.exp(50, 5000).lag(0.4),
	\x4.sr.exp(0.01, 5).lag(0.4)
) * 0.1 //  * XLine.kr(0.001, 0.1, 20)
} +> \natali;
//:
