/*  7 Apr 2022 10:27
Tiny Birds
*/

//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, ofq, oev, mod, osc, pan;
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.5), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 0.5, 0.999 / 2);// / 2; //2;		// 0.999 <- trick for Latch
		// saw = LFSaw.ar(rt, 1, 1, 0.999) / 2; //2;		// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;
		ofq = WhiteNoise.ar(\noise.kr(0.5) + 1 ** 15 + 10) // !
		+ (\noisep.kr(-2.6) + 1 ** 15 + 10); // !
		ofq = Latch.ar(ofq, saw);
		oev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10); // !
		mod = ofq * (\fqmul.kr(0.5) * 10 + 5/3); // !
		mod = SinOsc.ar(mod, 0, oev, ofq);
		env = LPF.ar(env, 100); // !
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		Pan2.ar(osc, pan, 1/4); // ! mix down 4 channels at 1/4 amp
	}).adsr;
	\amp.kr(0.05).lag(1) * sig;
} +> \pebl;
)
//:
// =================== TINY BIRDS
// RANGE: -3.12 - -3.14

\noisep <+.pebl -3.12; // tiny !!! little birds
\noisep <+.pebl -3.125; // tiny !!! little birds.
\noisep <+.pebl -3.13; // tiny !!! little birds.
\noisep <+.pebl -3.135; // tiny !!! little birds.
\noisep <+.pebl -3.15; // tiny !!! little birds.

// ==============================================
//: First preliminary chosen transition
// light bells to birds.
// Starting at -03.01 ending at -3.15
{
	(-3.01, -3.02 .. -3.15) do: { | val |
		postln("setting noisep to" + val);
		\noisep <+.pebl val;
		0.5.wait;
	}
}.fork;

//:=========================================
// WIDER REGION -2.6 - -3.15
{
	(-2.6, -2.61 .. -3.15) do: { | val |
		postln("setting noisep to" + val);
		\noisep <+.pebl val;
		0.5.wait;
	}
}.fork;


/// ==================================
// OUTTAKES
//: Full range bells to birds
{
	(-2.6, -2.61 .. -3.16) do: { | val |
		postln("setting noisep to" + val);
		\noisep <+.pebl val;
		0.5.wait;
	}
}.fork;
//: hint of bells to birds
{
	(-3.01, -3.02 .. -3.15) do: { | val |
		postln("setting noisep to" + val);
		\noisep <+.pebl val;
		0.5.wait;
	}
}.fork;
//: hint of bells to birds
{
	(-3.08, -3.09 .. -3.15) do: { | val |
		postln("setting noisep to" + val);
		\noisep <+.pebl val;
		1.5.wait;
	}
}.fork;
//:
{
	(-2.6, -2.61 .. -3.15) do: { | val |
		postln("setting noisep to" + val);
		\noisep <+.pebl val;
		0.5.wait;
	}
}.fork;