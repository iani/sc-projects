/* 28 Dec 2022 20:15
Here we try to combine the filtered noise sound with the
cricket playbuf sound for Asayo.

*/
//: THIS ONE:
//: ASAYO
{
	var dur;
	dur = 5 * 60;
	Ringz.ar(
		PinkNoise.ar(0.01),
		// \z5.sr.round(XLine.kr(0.0001, 0.2, dur)).exp(50, 2500).lag(0.05),
		\z1.sr.round(0.05).exp(50, 2500)
		*
		XLine.kr(0.1, 5, 300)
		, // .lag(0.05),
		0.15
		// XLine.kr(0.01, 0.5, dur) // three minutes
	).dup * \noiseamp.br(1)
	+
	PlayBuf.ar(
		1,
		\buf.kr(\crickets.buf),
		//!!!!!!!!! RESTORE FOLLOWING 4 LINES AFTER TESTING!
		// \x5.sr.lin(0.005, 0.150).lag(0.5),
		// \x1.sr.lin(0.005, 1.250).lag(0.5)
		// *
		// XLine.kr(0.1, 5, 300),
		XLine.kr(0.2, 5, 300),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader.dup;
	//	;// * (\z6.sr - 0.3).lin(0.0, 15.0)
} +> \asayo;
// adding volume control
{ XLine.kr(0.2, 2, 300) } @>.asayo \noiseamp;
{ XLine.kr(0.2, 2, 300) } @>.asayo \amp;
//:
\asayo stop: 30;
//: We need an audio marker to signal minutes passing 1,2,3,4,5.!!!
(dur: 60, instument: ????) // an instrument playing a short chime at each minute.

//: ============== sound check
0 @>.asayo \noiseamp;
1 @>.asayo \noiseamp;
5 @>.asayo \noiseamp;
10 @>.asayo \noiseamp;
//:
0 @>.asayo \amp;
1 @>.asayo \amp;
5 @>.asayo \amp;
10 @>.asayo \amp;
