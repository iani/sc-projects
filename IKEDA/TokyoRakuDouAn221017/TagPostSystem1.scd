/* 20 Oct 2022 00:07
From https://doc.sccode.org/Classes/DbufTag.html
*/

b = Buffer.alloc(s, 11125, 1);



// One of the examples by Emil Post
// directly listen to the tag system output (audification)
// when the tape is empty, the synth is freed (doneAction: 2)
//:
{
    var tag, index, axiom, rules, dt;
    dt = SampleDur.ir; // play with audio rate
    axiom = [1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1];
    rules = [[1, 0], [1, 1, 0, 1]];
    // axiom = axiom.scramble.keep(rrand(4, 16)).postln; // vary the axiom
    v = 3;

    tag = DbufTag(b.bufnum, v, axiom, rules);

    Duty.ar(dt, 0, tag, doneAction: 2).dup * 0.1
}.play;

//:
(
{
    var tag, axiom, rules, index;
    var freq = 15000;
    var deletionNumber = MouseX.kr(1, 6);

    axiom = [1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1];
    rules = [[0, 1], [1, 1, 0, 1, 0]];

    tag = DbufTag(b.bufnum, deletionNumber, axiom, rules);
    tag = Dseq([tag, Dseq([0], freq * 0.3)], inf); // a 0.1 sec pause each overrun.

    index = Duty.ar(1 / freq, Dseq([2], inf), tag, doneAction:2);

    SinOsc.ar(index * 1200 + 400).dup * 0.1
}.play;
)
//:
(
{
    var tag, axiom, rules, index;
    var freq = 15000;
    var recycle = MouseY.kr(1, 34);
    var deletionNumber = MouseX.kr(1, 6);

    axiom = [1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1];
    rules = [[0, 1], [1, 1, 0, 1, 0]];

    tag = DbufTag(b.bufnum, deletionNumber, axiom, rules, recycle, 4); // mode 4: post info

    index = Duty.ar(1 / freq, 0, tag);
    SinOsc.ar(index * 1200 + 400 * Rand(1, 1.6)).dup * 0.1
}.play;
)
//:
(
SynthDef(\post, { |bufnum, out|
    var tag, axiom, rules, index;
    var freq = Rand(10000, 15000);
    var deletionNumber = MouseX.kr(1, 6); // modulate deletion number

    axiom = [1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1];
    rules = [[0, 1], [1, 1, 0, 1, 0]];

    tag = DbufTag(bufnum, deletionNumber, axiom, rules);

    index = Duty.ar(1 / freq, 0, tag, doneAction:2);

    Out.ar(
        out,
        Pan2.ar(index * 0.1, LFNoise1.kr(1))
    )
}).send(s);
)
//:

(
fork {
    loop {
        Synth(\post, [\bufnum, b.bufnum]);
        rrand(0.3, 0.6).wait;
    }
}
)
//:

(
b.zero; // empty the buffer.
{
    var tag, trig;
    var deletionNumber = 2;
    var axiom = [1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1];
    var rules = [[0, 0], [1, 1, 0, 1]];
    tag = DbufTag(b.bufnum, deletionNumber, axiom, rules);
    trig = Impulse.kr(1, 0.5);

    SinOsc.ar(
        Demand.kr(trig, 0, tag).poll(trig, "rule index")
        * 100 + 300 + SinOsc.kr([4, 4.1], 0, 5)
    )
    * 0.1 ! 2
}.play;

fork {
    var deletionNumber = 2, tag = 0;
    0.1.wait;
    loop {

        b.getn(0, 70, {|x|
            x = x.copy.insert(tag, "|");
            x.join.postln;
            tag = tag + deletionNumber;
        }); // post the first 70 symbols every second.
        1.wait;

    }
}

);
