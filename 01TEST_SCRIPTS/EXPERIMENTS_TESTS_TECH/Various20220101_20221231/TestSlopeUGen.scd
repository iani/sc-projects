/*

10 Nov 2022 11:00
Generate some mock data data simulating sensor input,
and to test input mapping algorithms.

*/

//: setup reception and gui for pinetime
MapXyz('/pinetime/data', '/pine', -1200, 1200);
InputXyz.enable(12).addMessage(\pine).gui;
//:Start sines for x,y,z on pinetime 1
(
dur: 0.05, msg: '/pinetime/data', id: 1,
x: Pseries(0, 0.1, inf).sin * 1200,
y: Pseries(0, 0.05, inf).sin * 1200,
z: Pseries(0, 0.02, inf).sin * 1200
).osc(\id, \x, \y, \z) +> \datasim1;
//:Start test sound
{ SinOsc.ar(\freq.br(400), 0, \amp.br(0.1)).dup } +> \test1;
//:map x to frequency
{ \x1.sr.exp(100, 1000).lag(0.1) } @>.test1 \freq;
//: set y1 as threshold for amp
{ (\y1.sr > 0.5 * 0.1).lag(1) } @>.test1 \amp;
//: set y1 as threshold for amp
{ (\y1.sr > 0.7 * 0.1).lag(1) } @>.test1 \amp;
//: set y1 slope as threshold for amp, without lag
{ (Slope.kr(\y1.sr /* .lag(0.1) */) > 15.9 * 0.1) } @>.test1 \amp;
//:=================== 23 Nov 2022 09:39 preventing repeats ====================
//:Use an envelope for the triggered sound
{
	var env;
	env = Env.perc(0.01, 0.1, level: 0.1).kr(gate: \amp.br(0.0));
	SinOsc.ar(400).dup * env;
} +> \test1;
//:Add gate signal blocking triggers for limited duration
{
	var env, blocker, trigger;
	trigger = \amp.br(0.0);
	blocker = 1 - DelayN.kr(Env.square(1, 1).kr(gate: trigger), 0.01);
	trigger = trigger * blocker;
	env = Env.perc(0.01, 0.1, level: 0.1).kr(gate: trigger);
	SinOsc.ar(400).dup * env;
} +> \test1;
//:Build the trigger filter into the control function:
{
	var trigger, blocker;
	trigger = Slope.kr(\y1.sr /* .lag(0.1) */) > 15.9;
	// blocker = 1 - DelayN.kr(Env.square(1, 1).kr(gate: trigger), 0.01);
	blocker = 1 - Env.square(1, 0.1).kr(gate: trigger);
	trigger * blocker;
} @>.test1 \amp;
//:Test the trigger-blocker with (plain) sound func
{
	SinOsc.ar(600).dup * Env.perc(0.01, 0.1, 0.1).kr(gate: \amp.br(0));
} +> \test1
//:Trigger for testing
{ Impulse.kr(5) } @>.test1 \amp;


//: set y1 slope as threshold for amp, without lag
{ (Slope.kr(\y1.sr.lag(0.1)) > 1.0 * 0.1) } @>.test1 \amp;
//: set y1 slope abs value as threshold for amp, without laga
{ (Slope.kr(\y1.sr.lag(0.1)).abs > 1.0 * 0.1) } @>.test1 \amp;
//: slope threshold, source lag 0.5
{ (Slope.kr(\y1.sr.lag(0.5)).abs > 0.5 * 0.1) } @>.test1 \amp;
//: slope threshold 0.5 + output lag 0.5
{ (Slope.kr(\y1.sr.lag(0.5)).abs > 0.5 * 0.1).lag(0.5) } @>.test1 \amp;
//: slope threshold 0.5 + envelope for smoothing instead of lag
{
	var trig, env;
	trig = 	Slope.kr(\y1.sr).abs > 18;
	env = Env([0, 0.1, 0.1, 0], [0.02, 0.5, 0.1]).kr(gate: trig, doneAction: 0);
	env;
} @>.test1 \amp;
//: slope threshold 0.6
{ (Slope.kr(\y1.sr.lag(0.5)).abs > 0.6 * 0.1).lag(0.5) } @>.test1 \amp;
//: slope threshold 0.4
{ (Slope.kr(\y1.sr.lag(0.5)).abs > 0.4 * 0.1).lag(0.5) } @>.test1 \amp;
//: z1 slope - z1 changes more slowly!
{ (Slope.kr(\z1.sr.lag(0.5)).abs > 0.2 * 0.1).lag(0.5) } @>.test1 \amp;
//
//: z1 slope - z1 changes more slowly!
{ (Slope.kr(\x1.sr.lag(0.5) +
	\y1.sr.lag(0.5) +
	\z1.sr.lag(0.5)
).abs > 0.5 * 0.1).lag(0.5) } @>.test1 \amp;
//:variant using envelope
{
	var trig, env;
	trig = 	Slope.kr(\x1.sr.lag(0.5) +
	\y1.sr.lag(0.5) +
	\z1.sr.lag(0.5)
	).abs > 0.5;
	env = Env([0, 0.1, 0.1, 0], [0.02, 0.5, 0.1]).kr(gate: trig, doneAction: 0);
	env;
} @>.test1 \amp