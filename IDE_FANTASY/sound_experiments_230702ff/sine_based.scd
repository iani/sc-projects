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
//: