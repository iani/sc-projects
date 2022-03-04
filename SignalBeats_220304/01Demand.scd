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
    trig = Impulse.kr(MouseX.kr(5, 12, 1));
    freq = Demand.kr(trig, 0, a);
    SinOsc.ar(freq * [1, 1.5, 2, 2.2]).mix.dup * 0.02
	* trig.decay
} +> \test;