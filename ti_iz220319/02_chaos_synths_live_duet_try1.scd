/* 19 Mar 2022 15:01

Try a live coding session with 2 chaotic algorithms by Takum Ikeda
adapted for use with sc-hacks-redux.

1. StandardL chaos UGen based algorithm
2. InFeedback rich algorithm.

*/
//:check to make sure remote zoom connected partners are not heard:
\default +> \soundcheck;
//: 1. InFeedback peb algorithm.
// corrected code with envelope for releeasing.
// use this one!!!
(
SynthDef(\aaa, { | bus = 50 |
	var src;
	src = Mix.fill(8, {
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
		\amp.kr(1)
			//			*
			// EnvGen.kr(env, \gate.kr(1), doneAction: 2) *
			*
			Pan2.ar(osc, Latch.ar(WhiteNoise.ar(1),fb),0.05)
	});
	Out.ar(0, src.adsr);
}).add; // +> \peb;
)
//: 2. StandardL algorithm.
//:peb1 with controls added
{
	var env;
	env = Env.adsr;
	\amp.kr(1) *
	EnvGen.kr(env, \gate.kr(1), doneAction: 2) *
	Pan2.ar(
		SinOsc.ar(
			Resonz.ar(
				StandardL.ar(
					SampleRate.ir/
					(\srdiv.kr(0.5) * 100 + 10)
					, 1),
				(\stdlfreq.kr(0.2) * 5000 + 10),
				\stdlbwr.kr(0.01) * 100 + 0.01)
			// * (\resinmul.kr(0.1) + 50000 + 500)
			* (\resinmul.kr(0.1) * 50000 + 500)
		)
		, \pos.kr(0), \level.kr(0.01))
} +> \peb1;
//:
\level <+.peb1 0.1;
\pos <+.peb1 -0.5;
\srdiv <+.peb1 0.7;
\stdlfreq <+.peb1 1.2;
\stdlbwr <+.peb1 0.002;
\resinmul <+.peb1 0.9;
