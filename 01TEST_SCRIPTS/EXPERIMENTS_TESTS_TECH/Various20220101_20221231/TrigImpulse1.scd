/* 25 Nov 2022 11:09

//:How to produce a single kr impulse on a trigger
*/
//:Preparatory
{
	var trig, seq, freq;
    trig = Impulse.kr(1);
    trig = \trig.tr(0);
    SinOsc.ar(440).cubed.cubed.scaleneg(MouseX.kr(-1,1))
	* Env.perc.kr(gate: trig);
} +> \impulse;
//:
1 +>.impulse \trig;
//:============================================================
//:Next version: Send tigger to control bus
//:Use tr trigger directly in Synth func:
{
	SinOsc.ar(400) * 0.1 * Env.perc.kr(gate: \trig.tr);
} +> \trigtest;
//:Can also use shortcut method: gate
{
	SinOsc.ar(600) * 0.1 * Env.perc.gate(\trig.tr);
} +> \trigtest;
//:Manually test the trigger:
1 +>.trigtest \trig; // any value > 0 issues a trigger
//:Test from a bus wached by Slope:
{
	SinOsc.ar(600) * 0.1 * Env.perc.gate(\trig.br(0));
} +> \trigtest;
//: Only triggers the first time
1 @>.trigtest \trig;
//: Set the triggers with Dust writing to bus
{ Dust.kr(5) } @>.trigtest \trig;

//: Set the triggers with Changed writing to bus
{ Changed.kr(LFNoise0.kr(5)) } @>.trigtest \trig;

//: Set the triggers with Slope writing to bus
// abs: Trigger both upward and downward slope
{ Slope.kr(LFNoise0.kr(2)).abs } @>.trigtest \trig;

//: If not abs, only positive slope triggers:
{ Slope.kr(LFNoise0.kr(2)) } @>.trigtest \trig;
//:stop the noise triggering control synth
nil @>.trigtest \trig;
//:Control func: Produce only 1 impulse when triggered
{ \trig.tr(0) } @>.trigtest \trig;
//:trigger the triggering kr synth
(trig: 1) ++>.trigtest \trig;
