//  1 Nov 2021 04:39
// Change buffers while playing, using set.
//
//: ------ 1 ------ ~0:00
//: Souund check: playbuf



// kiiroi (default buffer).
{ | buf = 0 |
	var amp, src;
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src,
		Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
		Lag.kr(LinLin.kr(\asayoRx.in, 0.48, 0.55, 0.0, 0.5), 1.0) * 1) // level ath2z
} +> \asayo0;
//: !!!!!!!!!!!!!!!!!! here is a first example of simple on-off switch
{ | buf = 0 |
	var amp, src, ctl;
	src = PinkNoise.ar(0.1);
	ctl = \asayoRz.in;
	//Pan2.ar(src,
	//	1, // Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
	//		src > 0.0
	//)
		//		Lag.kr(
		//	LinLin.kr(ctl, 0.47, 0.65,  0.0, 1.5), 0.1)
		// * (src > 0.0)
	//) // level ath2z
	//src;
	src * Lag.kr(ctl > 0.55, 1.5)
} +> \asayo0;
//:
{ | buf = 0 |
	var amp, src, ctl;
	src = SinOsc.ar(400, 0, 0.1);
	ctl = \asayoRz.in;
	//Pan2.ar(src,
	//	1, // Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
	//		src > 0.0
	//)
		//		Lag.kr(
		//	LinLin.kr(ctl, 0.47, 0.65,  0.0, 1.5), 0.1)
		// * (src > 0.0)
	//) // level ath2z
	//src;
	src * Lag.kr(ctl > 0.55, 1.5)
} +> \asayo0;
//:
{ | buf = 0 |
	var amp, src, ctl;
	src = SinOsc.ar(500, 0, 0.1);
	ctl = \junLz.in;
	//Pan2.ar(src,
	//	1, // Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
	//		src > 0.0
	//)
		//		Lag.kr(
		//	LinLin.kr(ctl, 0.47, 0.65,  0.0, 1.5), 0.1)
		// * (src > 0.0)
	//) // level ath2z
	//src;
	src * Lag.kr(ctl > 0.55, 1.5)
} +> \jun0;
//:
//:  with both hands.
{ | buf = 0 |
	var amp, src1, src2, ctl1, ctl2;
	src1 = LFSaw.ar(100 * 3, 0, 0.05) * Decay.kr(Impulse.kr(2));
	src2 = LFSaw.ar(100 * (7 / 4), 0, 0.05) * Decay.kr(Impulse.kr(5));
	ctl1 = \asayoRz.in;
	ctl2 = \asayoLz.in;
	//Pan2.ar(src,
	//	1, // Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
	//		src > 0.0
	//)
		//		Lag.kr(
		//	LinLin.kr(ctl, 0.47, 0.65,  0.0, 1.5), 0.1)
		// * (src > 0.0)
	//) // level ath2z
	//src;
	[
		src1 * Lag.kr(ctl1 > 0.55, 1.5) * LFNoise1.kr(2).range(0.1, 2),
		src2 * Lag.kr(ctl2 > 0.55, 1.5)  * LFNoise1.kr(2).range(0.1, 2),
	]

} +> \asayo0;
//:  with both hands.
{ | buf = 0 |
	var amp, src1, src2, ctl1, ctl2;
	src1 = LFTri.ar(100 * (5 / 4), 0, 0.15) * Decay.kr(Impulse.kr(5));
	src2 = LFTri.ar(100 * (8 / 5), 0, 0.15) * Decay.kr(Impulse.kr(7));
	ctl1 = \junRz.in;
	ctl2 = \junLz.in;
	//Pan2.ar(src,
	//	1, // Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
	//		src > 0.0
	//)
		//		Lag.kr
		//	LinLin.kr(ctl, 0.47, 0.65,  0.0, 1.5), 0.1)
		// * (src > 0.0)
	//) // level ath2z
	//src;
	[
		src1 * Lag.kr(ctl1 > 0.55, 1.5) * LFNoise1.kr(2).range(0.1, 2),
		src2 * Lag.kr(ctl2 > 0.55, 1.5) * LFNoise1.kr(2).range(0.1, 2)
	]
} +> \jun0;
//:
{ | buf = 0 |
	var amp, src, ctl;
	src = SinOsc.ar(500, 0, 0.1);
	ctl = \junLz.in;
	//Pan2.ar(src,
	//	1, // Lag.kr(LinLin.kr(\asayoLz.in, 0.0, 1.0, 0.7, -0.7), 5.0), // pos ath1z
	//		src > 0.0
	//)
		//		Lag.kr(
		//	LinLin.kr(ctl, 0.47, 0.65,  0.0, 1.5), 0.1)
		// * (src > 0.0)
	//) // level ath2z
	//src;
	src * Lag.kr(ctl > 0.55, 1.5)
} +> \jun0;
//:
//
//
//
//
//

//: ------ 2 ------ ~0:30
\asayo0

//: ------ 2 ------ ~0:30
\asayo0 stop: 5;
\asayo0.set(\buf, \birdcarmanshort.index);
//: ------ 3 ------ ~0:35
// preacherman solo - then takunia - then dialog preacherman-takunia
{ | buf = 0 |
	var amp, src;
	buf = 'birdcarmanshort'.bufnum;
	src = PlayBuf.ar(1, buf,
		1,
		1, 0, 1, 2
	);
	Pan2.ar(src, Lag.kr(
		LinLin.kr(\asayoLz.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\asayoRz.in, 1.0) * 1)
} +> \asayo0
//: ------ 3.1 ------ ~3:00
\asayo0 stop: 5;
//: ------ 4 ------ ~3:05
// BRICKWALL with changeable buffer
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1,
		Lag.kr(LinLin.kr(In.kr(\asayoLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\asayoLz.in, 0, 1, -0.99, 0.9), 1.0)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\asayoRx.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\asayoRz.in, 0, 1, -1.0, 1.0)

	);
	//	Pan2.ar(src, \asayoLy.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;
//: ------ 5 ------ ~5:00
// MAGABOVE - bufctl in left hand z
// conrtrol seeems best on this one for dialog
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\asayoLx.index), 0, 1, 0, 10).round(1), 1.0),
		// Lag.kr(\asayoLy.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\asayoLz.in, 0, 1, 0, 15), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\asayoLx.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\asayoRz.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \asayoLy.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;
//: ------ 6 ------ ~7:00
// MAGBELOW - bufctl in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\asayoLx.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\asayoLz.in, 0.42, 0.59, 0, 30), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\asayoRy.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(LinLin.kr(\asayoRz.in, 0, 1, 0.0, 1.0), 1.0),
	);
	//	Pan2.ar(src, \asayoLy.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;
//: ------ 7 ------ ~9:00
// BINSHIFT - with buf selection in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\asayoLy.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\asayoLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\asayoLx.in * 4,
		\asayoLz.in * 4,
		1
		// Lag.kr(LinLin.kr(\asayoLx.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\asayoRy.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\asayoRz.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;
//: ------ 8 ------ ~11:00
// MAGSHIFT - with buf control in left hand z
// MARY SHOULD PLAY WITH THE CONTRASTS OF VERY HIGH AND VERY LOW FREQUENCIES
{
	var buf, in, chain;
	buf = \buf.kr(\cricket_ff.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\asayoLy.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\asayoLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagShift(chain,
		// \stretch.kr(1),
		Lag.kr(\asayoLx.in, 1.0) * 4,
		Lag.kr(\asayoLy.in, 1.0) * 4,
		// \asayoLz.in * 4,
		// \asayoLz.in * 4,
		1
		// Lag.kr(LinLin.kr(\asayoLx.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\asayoRy.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(\asayoRz.in, 1.0)
	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;
//==================================================
//: ------ 9 ------ ~13:00
\asayo0 stop: 5;
//==================================================
// TAKUNIA! -> see corfu!
//==================================================
//
//: ------ 10 ------ ~13:30
// MAGABOVE - bufctl in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\asayoLx.index), 0, 1, 0, 10).round(1), 1.0),
		// Lag.kr(\asayoLy.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\asayoLz.in, 0.44, 0.56, 0, 35), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\asayoLx.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\asayoRz.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \asayoLy.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;

//: ------ 11 ------ ~15:30
// BINSHIFT - with buf selection in left hand z

{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\asayoLy.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\asayoLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\asayoLx.in * 4,
		\asayoLz.in * 4,
		1
		// Lag.kr(LinLin.kr(\asayoLx.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\asayoRy.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\asayoRz.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \asayoLz.in - 0.3);
} +> \asayo0;


//: ------ 12 ------ ~17:30
// END

\asayo0.stop(5);
\asayo0.stop(15);
\asayo0.stop(20);