/* 22 Nov 2022 23:58
Avoid repeats when working with slope on data from sensors
*/
//:Draft simulating repeated impulse triggers:
{
	var trig;
	trig = Impulse.kr(5);
	SinOsc.ar(400 * [1, 1.2], 0, 0.05) *
	Env.sine(0.5, 1.5).kr(gate: trig)
} +> \smooth;
//:Introduce silence
{
	var trig, blocker;
	trig = Impulse.kr(5);
	// STOP ALLOWING TRIGGERING FOR 1 second!!!!!!!!!!!!!!
	blocker = 1 - Env.square(1, 1).kr(gate: \gate1.tr(0));
	blocker * SinOsc.ar(400 * [1, 1.2], 0, 0.05) *
	Env.sine(0.5, 1.5).kr(gate: trig)
} +> \smooth;
//:*
\smooth.player.set(\gate1, 1);
0.5.rrand(2).wait;
//: Test again with different source
{
	var trig, blocker;
	var n = 2; // duration of retrigger blocking
	trig = Impulse.kr(7);
	// STOP ALLOWING TRIGGERING FOR n seconds!!!!!!!!!!!!!
	blocker = 1 - Env.square(1, 2).kr(gate: \gate1.tr(0));
	blocker * WhiteNoise.ar([0.5, 0.5]) *
	Env.sine(0.01, 0.05).kr(gate: trig)
} +> \smooth;
//:*
\smooth.player.set(\gate1, 1);
0.5.rrand(2).wait;
//: Customizing shape of sounding envelope:
{
	var trig, blocker;
	var n = 2; // duration of retrigger blocking
	trig = Impulse.kr(10);
	// STOP ALLOWING TRIGGERING FOR n seconds!!!!!!!!!!!!!
	blocker = 1 - Env.square(1, 2).kr(gate: \gate1.tr(0));
	blocker * WhiteNoise.ar([0.05, 0.05]) *
	Env([0, 1, 1, 0], [0.01, 0.1, 0.01]).kr(gate: trig)
} +> \smooth;
//:*
\smooth.player.set(\gate1, 1);
0.5.rrand(2).wait;