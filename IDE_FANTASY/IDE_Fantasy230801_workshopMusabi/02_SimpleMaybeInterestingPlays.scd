/* 31 Jul 2023 18:13

*/
//: this one is particularly interesting
(
{
	loop {
		Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7].scramble + -5.rrand(5), 6.rand), \dur, [0.2, 0.1].choose).play;
		((1..10)/5).choose.wait;
	}

}.fork
)
//:


(
{RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar([0.3, 0.2]).range(100, 3000), 0.02)}.play;
)

(
{Saw.ar(LFNoise0.kr([2, 3]).range(100, 2000), LFPulse.kr([4, 5]) * 0.1)}.play;
)

(
~myFreqs = [415, 220, 440, 880, 220, 990];
~myDurs = [0.1, 0.2, 0.2, 0.5, 0.2, 0.1];
Pbind(\freq, Pseq(~myFreqs), \dur, Pseq(~myDurs)).play;
)


Pbind(\degree, Pseries(0, 1, 30), \dur, 0.05).play;
(
{
	loop {
		Pbind(\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7].scramble + -5.rrand(5), 6.rand), \dur, [0.2, 0.1].choose).play;
		((1..10)/5).choose.wait;
	}

}.fork
)
//
//:
Pbind(\dur, 0.1, \degree, 0).play;
Pbind(\dur, 0.1, \degree, Pseq([0, 1, 2], 3)).play;
Pbind(\dur, 0.1, \degree, Pseq([0, 1, 2], inf)).play;
//:
