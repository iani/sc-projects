/* 15 Mar 2022 10:37
First test sounds for class.
*/
//:
{ WhiteNoise.ar(0.1).dup } +> \soundcheck;

//:
{ SinOsc.ar(In.kr(\x1.bus.index).linlin(0.47, 0.53, 400, 1200), 0, 0.1).dup } +> \test;
//: test 1
//:
{ SinOsc.ar(
	Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 400, 1200),
		0.5
), 0, 0.1).dup } +> \test1;
//
{ SinOsc.ar(
	Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 400, 1200),
		0.5
), 0, 0.1).dup } +> \test2;
//
{ SinOsc.ar(
	Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 400, 1200),
		0.5
), 0, 0.1).dup } +> \test3;
//
{ SinOsc.ar(
	Lag.kr(In.kr(\x4.bus.index).linlin(0.47, 0.53, 400, 1200),
 		0.5
), 0, 0.1).dup } +> \test4;
//: test 2
{ SinOsc.ar(
	Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 200, 300),
		0.5
), 0, 0.1).dup } +> \test1;
//
{ SinOsc.ar(
	Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 400, 500),
		0.5
), 0, 0.1).dup } +> \test2;
//
{ SinOsc.ar(
	Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 800, 1000),
		0.5
), 0, 0.1).dup } +> \test3;
//
{ SinOsc.ar(
	Lag.kr(In.kr(\x4.bus.index).linlin(0.47, 0.53, 1600, 1700),
		0.5
), 0, 0.1).dup } +> \test4;
//: test 3a
{ SinOsc.ar(
	Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 200, 300),
		0.5
), 0, 0.1).dup } +> \test1;
//: test 3a.2
{ SinOsc.ar(
	Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
), 0, 0.1).dup } +> \test1;
//: test 3a.3
{ SinOsc.ar(
	Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
	), 0,
	Lag.kr(In.kr(\z1.bus.index).linlin(0.47, 0.53, 0.0, 0.5)
	).dup
} +> \test1;
//: 3b
{ SinOsc.ar(
	Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
), 0, 0.1).dup } +> \test1;
//: 3b.2
{ SinOsc.ar(
	Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
), 0, 0.1).dup } +> \test1;
//: 3c
{ SinOsc.ar(
	Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
), 0, 0.1).dup } +> \test1;
//: 3c.2
{ SinOsc.ar(
	Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
), 0, 0.1).dup } +> \test1;
//: 3d
{ SinOsc.ar(
	Lag.kr(In.kr(\x4.bus.index).linlin(0.47, 0.53, 1600, 1700),
		0.5
), 0, 0.1).dup } +> \test1;
//: 3d.2
{ SinOsc.ar(
	Lag.kr(In.kr(\x4.bus.index).linlin(0.47, 0.53, 300, 3000),
		0.5
), 0, 0.1).dup } +> \test1;
//:================ introducing amplitude
//: test 3a.1
{
	SinOsc.ar(
		Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 300, 3000),
			0.5
		), 0,
		Lag.kr(In.kr(\z1.bus.index).linlin(0.47, 0.53, 0.0, 0.5),
			0.5
		)
	).dup
} +> \test1;
//: test 3a.2
{
	SinOsc.ar(
		Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 300, 3000),
			0.5
		), 0,
		Lag.kr(In.kr(\z2.bus.index).linlin(0.47, 0.53, 0.0, 0.5),
			0.5
		)
	).dup
} +> \test1;
//: test 3a.3
{
	SinOsc.ar(
		Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 300, 3000),
			0.5
		), 0,
		Lag.kr(In.kr(\z3.bus.index).linlin(0.47, 0.53, 0.0, 0.5),
			0.5
		)
	).dup
} +> \test1;
//: test 3a.4
{
	SinOsc.ar(
		Lag.kr(In.kr(\x4.bus.index).linlin(0.47, 0.53, 300, 3000),
			0.5
		), 0,
		Lag.kr(In.kr(\z4.bus.index).linlin(0.47, 0.53, 0.0, 0.5),
			0.5
		)
	).dup
} +> \test1;
//:
SenseData().setxyz(1, 2, 3, 4);
SenseData().post(1);
//:
SenseData().setxyz(1);
SenseData().post(1);
//:
\x1.bus.get;
\x5.bus.get;

// ===================== infeedback algorithm
//: PEB + noise param control - working original without busses
{ | bus = 50 |
	Mix.fill(8, {
		var fb, env, fq, osc;
		fb = (LFSaw.ar(
			Latch.ar(
				WhiteNoise.ar(0.5).abs
				+ 0.5,
				InFeedback.ar(bus,1)),1)
			+ (\fadd.kr(0.05) * 10 + 0.1 ) //  add * 5 ???
		) / (\ldiv.kr(0.5) * 2 + 0.3);
		Out.ar(bus, fb);
		env = 1-fb;
		fq = Latch.ar(WhiteNoise.ar(
			\noise.kr(0.5) * 10000 + 10)
			+ (\noisep.kr(0.6) + 10000 + 10), fb);
		osc = SinOsc.ar(SinOsc.ar(fq*5/3,0,env**2*10000,fq),0,LPF.ar(env,100));
		Out.ar(0, \amp.kr(1)*Pan2.ar(osc, Latch.ar(WhiteNoise.ar(1),fb),0.05))})
} +> \peb;

//: PEB + noise param control
{ | bus = 50 |
	Mix.fill(8, {
		var fb, env, fq, osc;
		fb = (LFSaw.ar(
			Latch.ar(
				WhiteNoise.ar(0.5).abs
				+ 0.5,
				InFeedback.ar(bus,1)),1)
			+ (
				// \fadd.kr(0.5) (0.05)
				Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 0.01, 1.0),
					0.5
				)
				* 10 + 0.1 ) //  add * 5 ???
		) / (
			// \ldiv.kr(0.5)
			Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 0.01, 1.0),
			 		0.5
			 )
			* 2 + 0.3);
		Out.ar(bus, fb);
		env = 1-fb;
		fq = Latch.ar(WhiteNoise.ar(
			// \noise.kr(0.5)
			Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 0.01, 1.0),
					0.5
				)
			* 10000 + 10)
			+ (
				//\noisep.kr(0.6)
				Lag.kr(In.kr(\x4.bus.index).linlin(0.47, 0.53, 0.01, 1.0),
					0.5
				)
				+ 10000 + 10), fb);
		osc = SinOsc.ar(SinOsc.ar(fq*5/3,0,env**2*10000,fq),0,LPF.ar(env,100));
		Out.ar(0, \amp.kr(1)*Pan2.ar(osc, Latch.ar(WhiteNoise.ar(1),fb),0.05))})
} +> \peb;

//: PEB + noise param control PPPPP ====== BROKEN
{ | bus = 50 |
	Mix.fill(8, {
		var fb, env, fq, osc;
		fb = (LFSaw.ar(
			Latch.ar(
				WhiteNoise.ar(0.5).abs
				+ 0.5,
				InFeedback.ar(bus,1)),1)
			+ (
				//  \fadd.kr(0.5)
				Lag.kr(In.kr(\x1.bus.index).linlin(0.47, 0.53, 300, 3000),
			0.5
		)
				* 10 + 0.1 ) //  add * 5 ???
		) / (
			// \ldiv.kr(0.5)
			Lag.kr(In.kr(\x2.bus.index).linlin(0.47, 0.53, 300, 3000),
			0.5
		)
			* 2 + 0.3);
		Out.ar(bus, fb);
		env = 1-fb;
		fq = Latch.ar(WhiteNoise.ar(
			// \noise.kr(0.5)
			Lag.kr(In.kr(\x3.bus.index).linlin(0.47, 0.53, 300, 3000),
				0.5
			)
			* 10000 + 10)
			+ (
				// \noisep.kr(0.6)
				Lag.kr(In.kr(\z4.bus.index).linlin(0.47, 0.53, 300, 3000),
					0.5
				)
				+ 10000 + 10), fb);
		osc = SinOsc.ar(SinOsc.ar(fq*5/3,0,env**2*10000,fq),0,LPF.ar(env,100));
		Out.ar(0, \amp.kr(1)*Pan2.ar(osc, Latch.ar(WhiteNoise.ar(1),fb),0.05))})
} +> \peb;
