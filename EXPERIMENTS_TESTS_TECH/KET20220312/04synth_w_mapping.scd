/* 12 Mar 2022 14:49
Put the feedback algorithm togehter with sensor input.
Using kr functions to change the mapping live.
*/
//:
OSC.verbose;
OSC.silent;
SenseData().verbose;
SenseData().silent;

SenseData().setxyz(1, 2, 3, 4);
SenseData.scope;
//: PEB with more sensitivity for Jun
{ | bus = 50 |

	Mix.fill(8, {
		var fb, env, fq, osc;
		fb = (LFSaw.ar(
			Latch.ar(
				WhiteNoise.ar(0.5).abs
				+ 0.5,
				InFeedback.ar(bus,1)),1)
			+ (\fadd.kr(0.5).linlin(0.47, 0.53, 0.1, 0.9) * 5 + 0.1 ) //  add * 5 ???
		) / (\ldiv.kr(0.5) * 1.0 + 1.3);
		Out.ar(bus, fb);
		env = 1-fb;
		fq = Latch.ar(WhiteNoise.ar(
			\noise.kr(0.5) + 1 ** 15 + 10)
			+ (\noisep.kr(0.6) + 1 ** 15 + 10), fb);
		osc = SinOsc.ar(SinOsc.ar(fq*
			//5/3,
			(\fqmul.kr(0.5) * 10 + 5/3),
			0,
			env**2*
			// 10000,
			(\oscamp.kr(0.5) * 10000 + 10),
			fq),0,LPF.ar(env,100));
		Out.ar(0, \amp.kr(1)
			//			*
			// EnvGen.kr(env, \gate.kr(1), doneAction: 2) *

			Pan2.ar(osc, Latch.ar(WhiteNoise.ar(1),fb),0.05))})
} +> \peb;

//: Initialize busses;
\x1 <+@ 0.5;// (0.5)
\z1 <+@ 0.5; // (0.5)
\x2 <+@ 0.5; // (0.5)
\z2 <+@ 0.6;// (0.6)
\x3 <+@ 0.5;// (0.5)
\z3 <+@ 0.6; // (0.6)
\z4 <+@ 1.0; // (1)
//: ================================================================
//: Map busses
// Direct version

\fadd <@.peb \x1;// (0.5)
\ldiv <@.peb \z1; // (0.5)
\noise <@.peb \x2; // (0.5)
\noisep <@.peb \z2;// (0.6)
\fqmul <@.peb \x3;// (0.5)
\oscamp <@.peb \z3; // (0.6)
\amp <@.peb \z4; // (1)

//: ================================================================
// Indirect version
\fadd <+@ 0.5;// (0.5)
\ldiv <+@ 0.5; // (0.5)
\noise <+@ 0.5; // (0.5)
\noisep <+@ 0.6;// (0.6)
\fqmul <+@ 0.5;// (0.5)
\oscamp <+@ 0.6; // (0.6)
\amp <+@ 1.0; // (1)
//: Map busses
\fadd <@.peb \fadd;// (0.5)
\ldiv <@.peb \ldiv; // (0.5)
\noise <@.peb \noise; // (0.5)
\noisep <@.peb \noisep;// (0.6)
\fqmul <@.peb \fqmul;// (0.5)
\oscamp <0.peb \oscamp; // (0.6)
\amp <@.peb \amp; // (1)

//:use synths to map sensor bus values to input busses
//:
{
	Out.kr(\fadd.bus.index,
		In.kr(\x1.bus.index).linlin(0.47, 0.53, 0.01, 1.5));
} +> \myfreq;
//:
{
	Out.kr(\ldiv.bus.index,
		In.kr(\z1.bus.index).linlin(0.47, 0.53, 0.01, 1.5));
} +> \myfreq;
//:
{
	Out.kr(\noise.bus.index,
		In.kr(\x2.bus.index).linlin(0.47, 0.53, 0.01, 1.5));
} +> \myfreq;
//:
{
	Out.kr(\noisep.bus.index,
		In.kr(\z2.bus.index).linlin(0.47, 0.53, 0.01, 1.5));
} +> \myfreq;
//:
{
	Out.kr(\fqmul.bus.index,
		In.kr(\x3.bus.index).linlin(0.47, 0.53, 0.01, 1.5));
} +> \myfreq;
//:
{
	Out.kr(\oscamp.bus.index,
		In.kr(\z3.bus.index).linlin(0.47, 0.53, 0.01, 1.5));
} +> \myfreq;
//:
{
	Out.kr(\amp.bus.index,
		In.kr(\z4.bus.index).linlin(0.47, 0.53, 0.0, 1.0));
} +> \myfreq;
//:
