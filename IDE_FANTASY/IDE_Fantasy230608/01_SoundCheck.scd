/*  6 Jun 2023 15:27

*/


{ SinOsc.ar(400, 0, 0.1).dup; } +> \ampcheck1;
{ SinOsc.ar(400, 0) * (\x2.sr < 0.5) * 0.2 } +> \ampcheck1;
{ SinOsc.ar(400, 0) * (\x2.sr < 0.5) } +> \ampcheck1;
{ WhiteNoise.ar * (\x2.sr < 0.5) } +> \ampcheck1;


{ WhiteNoise.ar * \x2.sr } +> \ampcheck1;
//:
{ WhiteNoise.ar * \x2.sr * (\x2.sr > 0.3).lag(1) } +> \ampcheck1;
//:
{ WhiteNoise.ar * \x2.sr.exp(0.01, 1.9).dup * (\x2.sr > 0.3).lag(1) } +> \ampcheck1;
//:
{ Resonz.ar(WhiteNoise.ar * \x2.sr * (\x2.sr > 0.3).lag(1), 1000) } +> \ampcheck1;
{ Resonz.ar(WhiteNoise.ar * \x2.sr * (\x2.sr > 0.3).lag(1), 1000) } +> \ampcheck1;
// WEAR ON Palm of HAND
//: Sea
{ Resonz.ar(WhiteNoise.ar * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(50, 5000), 2.9)
} +> \ampcheck1;
//: Wind
{ Resonz.ar(WhiteNoise.ar.dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(50, 5000), 0.1)
} +> \ampcheck1;
//:
// WEAR ON CHEST
//: Sea
{ Resonz.ar(WhiteNoise.ar.dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(10, 15000), 2.9)
} +> \ampcheck1;
//: Sea - with chromatic pitches
{ Resonz.ar(WhiteNoise.ar.dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	(\z2.sr.round(1).lin(20, 50) * 2).midicps.lag(0.1), 2.9)
} +> \ampcheck1;
//: Wind
{ Resonz.ar(WhiteNoise.ar.dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(50, 5000), 0.1)
} +> \ampcheck1;
//: Wind 2
{ Resonz.ar(WhiteNoise.ar.dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(50, 5000), 0.02) * 5
} +> \ampcheck1;
//: Sea + Wind - controllled by 2nd sensor on ankle (NOR hand)
{ Resonz.ar(WhiteNoise.ar.dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(50, 5000),
	\x1.sr.exp(0.01, 5)
) * 5
} +> \ampcheck1;
//: Variation - different types of sound sources
{ Resonz.ar(LFSaw.ar(\z1.sr.exp(40, 4000)).dup * \x2.sr.exp(0.01, 1.9) * (\x2.sr > 0.3).lag(1),
	\z2.sr.exp(50, 5000),
	\x1.sr.exp(0.01, 5)
) * 5
} +> \ampcheck1;
