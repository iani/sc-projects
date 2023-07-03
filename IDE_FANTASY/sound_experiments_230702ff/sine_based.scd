/*  2 Jul 2023 23:11

*/


{ SinOsc.ar(Array.rand(10, 40, 400), 0, 0.1).mix }.scope;
//:
{ SinOsc.ar(Array.rand(50, 140, 180), Array.rand(50, 0, 2pi), 0.1).amix }.scope;
//:
{ SinOsc.ar(
	Line.kr(400,Array.rand(50, 800, 1600), 120),
	Array.rand(50, 0, 2pi), 0.1).amix }.scope;
//:
{ SinOsc.ar(
	XLine.kr(400,Array.rand(50, 800, 1600), 20),
	{ LFNoise1.kr(0.2).range(0, 2pi) } ! 50,
	0.1
).amix }.scope;
//:
{
	var r = 5;
	SinOsc.ar(
	XLine.kr(400,Array.rand(r, 800, 1600), 20),
	{ LFNoise1.kr(0.2).range(0, 2pi) } ! r,
	0.1
).amix } +> \sines;
//:
{
	var r = 50;
	SinOsc.ar(
	XLine.kr(400,Array.rand(r, 180, 1600), 60, doneAction: 2),
	{ LFNoise1.kr(0.2).range(0, 2pi) } ! r,
	0.1
).amix } +> \sines;
//:
{
	var r = 50;
	SinOsc.ar(
	XLine.kr(400, Array.rand(r, 80, 1600), 60),
	{ LFNoise1.kr(0.2).range(0, 2pi) } ! r,
	{ LFNoise1.kr(0.2 exprand: 10).range(0, 0.1) } ! r,
).amix } +> \sines;
//:
{
	var r = 50;
	SinOsc.ar(
	{ LFNoise1.kr(0.2 exprand: 2).range(200, 450) } ! r,
	{ LFNoise1.kr(0.2).range(0, 2pi) } ! r,
	{ LFNoise1.kr(0.2 exprand: 10).range(0, 0.1) } ! r,
).amix } +> \sines;
//:
{
	var r = 50;
	SinOsc.ar(
	{ LFNoise1.kr(10 exprand: 20).range(80, 90) + 0.rrand(400) } ! r,
	{ LFNoise1.kr(0.2).range(0, 2pi) } ! r,
	{ LFNoise1.kr(0.2 exprand: 10).range(0, 0.1) } ! r,
).amix } +> \sines;
//:+Mon  3 Jul 2023 19:35
500 @>.test \freq; // initialize! (stop previous synth func.)
\test play: { SinOsc.ar(\freq.br(500), 0, 0.1).dup };
1.wait;
{ LFNoise0.kr(20).range(XLine.kr(500, 100, 10), XLine.kr(500, 6000, 10)) } @>.test \freq;
10.wait;
\test stop: 5;
//:+variant with many sines.
//Need to assign different control names for freq of individual sines
//controlled by discrete ugens!
500 @>.test \freq; // initialize! (stop previous synth func.)
\test play: {
	{ | i |
		SinOsc.ar(format("freq%", i).asSymbol.br(500).lag(1), 0, 0.1)
	}.dup(10).amix.dup
};
1.wait;
{ | i |
	{
		LFNoise0.kr(20).range(XLine.kr(500, 100, 10), XLine.kr(500, 6000, 10))
	} @>.test format("freq%", i).asSymbol;
} ! 10;
10.wait;
// \test stop: 5;
//:
{
	loop {
		0.5.exprand(5).wait;
		Array.rand(10, 400, 4000) @>.test \freq;
		0.1.exprand(1.2).wait;
		Array.rand(10, 140, 400) @>.test \freq;
	}
}.fork;
//:
//:
{ SinOsc.ar(\freq0.br(600), 0, 0.1).dup } +> \test;

100 @>.test \freq0;

//:Testing immediate stopping of control players
500 @>.test \freq; // initialize! (stop previous synth func.)
\test play: { SinOsc.ar(\freq.br(500), 0, 0.1).dup };
{ LFNoise0.kr(20).range(XLine.kr(500, 100, 10), XLine.kr(500, 6000, 10)) } @>.test \freq;
100 @>.test \freq;
//:glides
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:+Testing lag time
1000@1 @>.test \freq;
//{ XLine.kr(400, 1000, 1) } @>.test \freq;
1.wait;
'NOW'.postln;
1000 @>.test \freq;
//:* // too small values of lag and wait may leave lines on, causing artefacts
var lag;
lag = 0.05.exprand(0.95);
(200.rrand(8000)@(lag)) @>.test \freq;
(lag + 0.02).wait;