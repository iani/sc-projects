/*  5 Mar 2022 09:25
Getting demand values from a buffer.

THis is a way to send performance data from sclang to scsynth.


*/
//:Prepare a test array:
1234567.asBinaryDigits(16).postln @> \test;
//:Test the buffer:
16 do: { | i | \test.buf.get(i, _.postln) };
//: studying Dbufrd :
// from: https://doc.sccode.org/Classes/Dbufrd.html

b = Buffer.alloc(s, 24, 1);
b.setn(0, { exprand(200, 500) } ! b.numFrames);
b.getn(0, b.numFrames, {|x| x.postln })
//:
(
{ var indexPattern;
    indexPattern = Dseq([Dseq([0, 3, 5, 0, 3, 7, 0, 5, 9], 3), Dbrown(0, 23, 1, 5)], inf);
    SinOsc.ar(
        Demand.kr(Dust.kr(10), 0, Dbufrd(b, indexPattern))
    ) * 0.1
} +> \test;
)
//:
(
{ var indexPattern;
    indexPattern = Dseq([Dseq([0, 3, 5, 0, 3, 7, 0, 5, 9], 3), Dbrown(0, 23, 1, 5)], inf);
    SinOsc.ar(
        Demand.kr(Impulse.kr(10), 0, Dbufrd(b, indexPattern))
    ) * 0.1
} +> \test;
)
//:
(
{ var indexPattern;
    indexPattern = Dseq((0..7), inf);
    SinOsc.ar(
        Demand.kr(Impulse.kr(5), 0, Dbufrd(b, indexPattern))
    ) * 0.1
} +> \test;
)
//:
(
{ var indexPattern, trig;
	trig = Impulse.kr(7);
    indexPattern = Dseq((0..7), inf);
    SinOsc.ar(
        Demand.kr(trig, 0, Dbufrd(b, indexPattern))
    ) * 0.1
	* Demand.kr(trig, 0, Dbufrd(\test.buf, Dseq((0..7), inf)))
} +> \test;
)
//:
({ | i | i % 2; } ! 16).scramble @> \test;
//;
(
{ var indexPattern, trig, decaytrig;
	trig = Impulse.kr(10);
    indexPattern = Dseq((0..15), inf);
	decaytrig = Demand.kr(trig, 0, Dbufrd(\test.buf, Dseq((0..15), inf)));
    SinOsc.ar(
        Demand.kr(trig, 0, Dbufrd(b, indexPattern))
    ) * 0.1
	* decaytrig.perctr(0.01, 0.05)
} +> \test;
)
//:
({ | i | i % 2; } ! 16).scramble @> \test;
//;
(
{ var indexPattern, trig, decaytrig, bitamps;
	trig = Impulse.kr(10);
    indexPattern = Dseq((0..15), inf);
	bitamps = Demand.kr(trig, 0, Dbufrd(\test.buf, Dseq((0..15), inf)));
    SinOsc.ar(
        Demand.kr(trig, 0, Dbufrd(b, indexPattern))
    ) * 0.1
	* bitamps * trig.perctr(0.01, 0.1)
} +> \test;
)
//:
// buffer as a time pattern

c = Buffer.alloc(s, 24, 1);
c.setn(0, { [1, 0.5, 0.25].choose } ! c.numFrames);
c.getn(0, c.numFrames, {|x| x.postln })

(
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
)

// free buffers

b.free; c.free;
