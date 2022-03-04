/*  4 Mar 2022 14:29
Use Demand Ugens to access values stored in buffers.
*/

//:Dseq
{
    var a, freq, trig;
    a = Dseq(([0, 2, 3, 6, 7, 8, 11, 12] + 80).midicps, inf);
    trig = Impulse.kr(MouseX.kr(5, 12, 1));
    freq = Demand.kr(trig, 0, a);
    SinOsc.ar(freq * [1, 1.5, 2, 2.2]).mix.dup * 0.02

} +> \test;
//:Sharpen with Decay
{
    var a, freq, trig;
    a = Dseq(([0, 2, 3, 6, 7, 8, 11, 12] + 80).midicps, inf);
    trig = Impulse.kr(5);
    freq = Demand.kr(trig, 0, a);
    SinOsc.ar(freq * [1, 1.5, 2, 2.2]).mix.dup * 0.02
	* trig.decay
} +> \test;
//:Sharpen with Decay
{
    var a, freq, trig;
    a = Dseq(([0, 2, 3, 6, 7, 8, 11, 12] + 80).midicps, inf);
    trig = Impulse.kr(5);
    freq = Demand.kr(trig, 0, a);
    SinOsc.ar(freq * [1, 1.5, 2, 2.2]).mix.dup * 0.02
	* trig.perctr(0.05, 0.3)
} +> \test;
//:Testing perctr draft code
{ | trig = 0 | WhiteNoise.ar(0.1) * Impulse.kr(1).perctr } +> \test;
//:
{ WhiteNoise.ar(0.1) *
EnvGen.kr(
        Env(
            levels: [0, 0.1, 0.2, 0.3],
            times: [0.1, 0.1, 0.1],
            curve: 8
        ),
        gate: Impulse.kr(3)
);
} +> \test;
//:
{ WhiteNoise.ar(0.1) *
EnvGen.kr(
        Env.perc(level: 0.1),
        gate: Impulse.kr(3)
);
} +> \test;
//:
{ WhiteNoise.ar(0.1) *
EnvGen.kr(
        Env.perc(level: 0.1),
        gate: \trig.tr(1)
);
} +> \test;
//:
{
	10 do: {
		\test.set(\trig, 0.1);
		0.1.wait;
	}
}.fork;