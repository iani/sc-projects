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
		Lag.kr(LinLin.kr(\junLz.in, 0.46, 0.54, 0.7, -0.7), 5.0), // pos ath1z
		Lag.kr(LinLin.kr(\junLx.in, 0.5, 0.64, 0.0, 0.3), 0.1 ) // level ath2z
	)
} +> \jun0;
//:
\jun0.set(\buf, \birdcarman.index);
//
//: ------ 2 ------ ~0:30
\jun0 stop: 5;
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
		LinLin.kr(\junLz.in, 0.46, 0.54, 0.7, -0.7),
		5.0),
		Lag.kr(\junRz.in, 1.0) * 1)
} +> \jun0
//: ------ 3.1 ------ ~3:00
\jun0 stop: 5;
//: ------ 4 ------ ~3:05
// BRICKWALL with changeable buffer
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1,
		Lag.kr(LinLin.kr(In.kr(\junLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BrickWall.new(chain,
		Lag.kr(LinLin.kr(\junLz.in, 0, 1, -0.99, 0.9), 1.0)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\junRx.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\junRz.in, 0, 1, -1.0, 1.0)

	);
	//	Pan2.ar(src, \junLy.in - 0.5, \junLz.in - 0.3);
} +> \jun0;
//: ------ 5 ------ ~5:00
// MAGABOVE - bufctl in left hand z
// conrtrol seeems best on this one for dialog
// WE KEEP THIS ONE FOR Jun
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\junLx.index), 0, 1, 0, 10).round(1), 1.0),
		// Lag.kr(\junLy.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\junLz.in, 0, 1, 0, 15), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\junLx.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\junRz.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \junLy.in - 0.5, \junLz.in - 0.3);
} +> \jun0;
//: ------ 6 ------ ~7:00
// MAGBELOW - bufctl in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		Lag.kr(LinLin.kr(In.kr(\junLx.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagBelow(chain,
		Lag.kr(LinLin.kr(\junLz.in, 0.42, 0.59, 0, 30), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\junRy.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(LinLin.kr(\junRz.in, 0.45, 0.55, 0.0, 1.0), 1.0),
	);
	//	Pan2.ar(src, \junLy.in - 0.5, \junLz.in - 0.3);
} +> \jun0;
//: ------ 7 ------ ~9:00
// BINSHIFT - with buf selection in left hand z
{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\junLy.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\junLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\junLx.in * 4,
		\junLz.in * 4,
		1
		// Lag.kr(LinLin.kr(\junLx.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\junRy.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\junRz.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \junLz.in - 0.3);
} +> \jun0;
//: ------ 8 ------ ~11:00
// MAGSHIFT - with buf control in left hand z
// MARY SHOULD PLAY WITH THE CONTRASTS OF VERY HIGH AND VERY LOW FREQUENCIES
{
	var buf, in, chain;
	buf = \buf.kr(\cricket_ff.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\junLy.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\junLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagShift(chain,
		// \stretch.kr(1),
		Lag.kr(\junLx.in, 1.0) * 4,
		Lag.kr(\junLy.in, 1.0) * 4,
		// \junLz.in * 4,
		// \junLz.in * 4,
		1
		// Lag.kr(LinLin.kr(\junLx.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		Lag.kr(LinLin.kr(\junRy.in, 0, 1, -1.0, 1.0), 1.0),
		Lag.kr(\junRz.in, 1.0)
	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \junLz.in - 0.3);
} +> \jun0;
//==================================================
//: ------ 9 ------ ~13:00
\jun0 stop: 5;
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
		Lag.kr(LinLin.kr(In.kr(\junLx.index), 0, 1, 0, 10).round(1), 1.0),
		// Lag.kr(\junLy.in, 0.5),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_MagAbove(chain,
		Lag.kr(LinLin.kr(\junLz.in, 0.44, 0.56, 0, 35), 0.5),
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\junLx.in, 0, 1, -1.0, 1.0),
		Lag.kr(LinLin.kr(\junRz.in, 0, 1, 0, 1), 0.5)
	) * 3;
	//	Pan2.ar(src, \junLy.in - 0.5, \junLz.in - 0.3);
} +> \jun0;

//: ------ 11 ------ ~15:30
// BINSHIFT - with buf selection in left hand z

{
	var buf, in, chain;
	buf = \buf.kr(\melodic_road.bufnum);
	in = PlayBuf.ar(1, // buf,
		// Lag.kr(\junLy.in, 0.5),
		Lag.kr(LinLin.kr(In.kr(\junLz.index), 0, 1, 0, 10).round(1), 1.0),
		1,
		1, 0, 1, 2
	);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain,
		// \stretch.kr(1),
		\junLx.in * 4,
		\junLz.in * 4,
		1
		// Lag.kr(LinLin.kr(\junLx.in, 0, 1, 0, 10), 0.5)
	);
    Pan2.ar(IFFT(chain),
		LinLin.kr(\junRy.in, 0, 1, -1.0, 1.0),
		LinLin.kr(\junRz.in, 0, 1,  0.0, 1.0),

	);
	//	Pan2.ar(src, \pporo1y.in - 0.5, \junLz.in - 0.3);
} +> \jun0;


//: ------ 12 ------ ~17:30
// END

\jun0.stop(5);
\jun0.stop(15);
\jun0.stop(20);