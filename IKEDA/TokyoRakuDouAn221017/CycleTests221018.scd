/* 18 Oct 2022 14:40
Building a simple approach for cycles of beats based on
impulses written in a bus by Impulse.kr.
*/

//:
{ Impulse.kr(2) } @> \c1;
//:
{ Impulse.kr(20) } @>.b \c1;
//:
{ Dust.kr(2) } @>.c \c1;
//:
{ WhiteNoise.ar(Decay.kr(\c1.bin)).dup * 0.1 } +> \test;
//:
nil @> \c1;
nil @> \b;
nil @> \c
//:
{
	WhiteNoise.ar
	*
	Env([0, 0.1, 0], [0.02, 0.2], curve: -5).kr(gate: \c1.bin)
} +> \test;
//:
{
	WhiteNoise.ar
	*
	Env.square(0.1, 0.05).kr(gate: \c1.bin)
} +> \test;
//:
{
	WhiteNoise.ar
	*
	Env.square(0.09, 0.09).gate(\c1)
} +> \test;
///: -------- Try with demand ugens --------
//:
{
    var a, freq, trig;
    a = Dseq([0, 0, 2, 2, 4, 2, 7, 8, 11, 0, 0, 0, 12, 12, 12] + 70, inf);
    trig = Impulse.kr(5);
    freq = Demand.kr(trig, 0, a).midicps;
    SinOsc.ar(freq) * 0.1

} +> \dtest;
//:
{ Impulse.kr(3) } @> \trig;
//:
{
    var a, freq, trig;
    a = Dseq([0, 0, 2, 2, 4, 2, 7, 8, 11, 0, 0, 0, 12, 12, 12] + 70, inf);
    trig = \trig.bin;
    freq = Demand.kr(trig, 0, a).midicps;
    SinOsc.ar(freq) * Env.perc(level: 0.1).gate(trig)

} +> \dtest;
//:
{
    var midiseq, freq, trig;
    midiseq = Dseq([0, 0, 2, 2, 4, 2, 7, 8, 11, 0, 0, 0, 12, 12, 12] + 70, inf);
    trig = \trig.bin;
    freq = Demand.kr(trig, 0, midiseq).midicps;
    SinOsc.ar(freq) * Env.square.gate(trig)
} +> \dtest;
//:
{
    var midiseq, freq, ampseq, amp, trig;
    midiseq = Dseq([0, 0, 2, 2, 4, 2, 7, 8, 12, 0, 0, 0] + 70, inf);
	ampseq = Dseq([0.2, 0.01, 0.01 /*, 0.01 */], inf);
    trig = \trig.bin;
    freq = Demand.kr(trig, 0, midiseq).midicps;
	amp = Demand.kr(trig, 0, ampseq);
    SinOsc.ar(freq) * Env.square(1).gate(trig) * amp
} +> \dtest;
//:
{
    var freqseq, freq, ampseq, amp, trig;
    freqseq = Dseq(([0, 0, -20, 2, 4, 20, 7, 8, 12, 0, 0, 0] + 70).midicps, inf);
	ampseq = Dseq([0.2, 0.01, 0.01 /*, 0.01 */], inf);
    trig = \trig.bin;
	#freq, amp = Demand.kr(trig, 0, [freqseq, ampseq]);
    LFSaw.ar(freq) * Env.square(1).gate(trig) * amp
} +> \dtest;
//:
{
    var freq, amp, trig;
    trig = \trig.bin;
	#freq, amp = Demand.kr(trig, 0, [
		Dseq(([0, 0, -20, 2, 4, 20, 7, 8, 12, 0, 0, 0] + 70).midicps, inf),
		Dseq([0.2, 0.01, 0.01 /*, 0.01 */], inf)
	]);
    LFSaw.ar(freq) * Env.square(1).gate(trig) * amp
} +> \dtest;
//:

{ Dust.kr(1) } @> \trig;
//:============ trying with buffer bufrd
c = Buffer.alloc(s, 24, 1);
c.setn(0, { [1, 0.5, 0.25].choose } ! c.numFrames);
c.getn(0, c.numFrames, {|x| x.postln })
//:
b = Buffer.alloc(s, 24, 1);
b.setn(0, { exprand(200, 500) } ! b.numFrames);
b.getn(0, b.numFrames, {|x| x.postln })

//:

{ var indexPattern;
    indexPattern = Dseq([Dseq([0, 3, 5, 0, 3, 7, 0, 5, 9], 3), Dbrown(0, 23, 1, 5)], inf);
    SinOsc.ar(
        Duty.kr(
            Dbufrd(c, Dseries(0, 1, inf)) * 0.5,
            0,
            Dbufrd(b, indexPattern)
        )
    ) * 0.1
}.play;


//: free buffers

b.free; c.free;