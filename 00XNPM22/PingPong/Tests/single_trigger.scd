/*  1 Dec 2022 00:44
Produce as single impulse every time triggered.
*/
{ Impulse.kr(1) } @>.trigtest \trigger;
//:
{ WhiteNoise.ar(0.1) * Decay.kr(\trigger.br) } +> \trigtest;
//:
nil @> \trigger;
//:
{ \x.tr(1) } @>.trigtest \trigger;
//:
{
	10 do: { | i |
		(x: 1) ++>.trigtest \trigger;
		postln("triggered" + (i + 1) + "of 10");
		[0.02, 0.1, 0.3].choose.wait;
	};
	"DONE".postln;
}.fork;
//:
\trigger.player;
//:
currentEnvironment