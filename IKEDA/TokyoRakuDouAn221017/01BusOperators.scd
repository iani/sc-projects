/* 18 Oct 2022 09:26
Demonstrating the use of bus operators.

*/

{ SinOsc.ar(\freq.bin(400), 0, \amp.bin(0.1)).dup } +> \test;
//:
600 @> \freq;
//:
{ LFNoise0.kr(5).range(200, 1000) } @> \freq;
//:
{ LFNoise1.kr(50).range(200, 1000) } @> \freq;
//:
{ LFNoise2.kr(1).range(100, 5000) } @> \freq;
//: !!!!!
{ LFNoise2.kr.range(700, 1500) } @> \freq;
//:
(degree: (0..21).pseq, dur: 1/4) @> \freq;
//:
(degree: (0..21).prand, dur: [0.1, 0.2, 1].prand) @> \freq;
//:
(degree: (0..21).prand, dur: 0.05) @> \freq;
//:
(degree: ((0..4) * 2).prand, dur: 0.05) @> \freq;
//:
(degree: ((0..4) * 3).prand, dur: 0.1) @> \freq;

//: =============== TESTING! ================
// Introducing control of amplitude
//:Direct control
{ MouseX.kr(0.1, 0) } @> \amp;
//:Simulate a sensor:
{ MouseX.kr(0, 1) } @> \x1_sim;
//:Use simulated sensor input to switch amplitude on-off
{ \x1_sim.bin > 0.5 * 0.1 } @> \amp;
//:Random source as sensor simulation
{ LFNoise2.kr(1).range(0, 1) } @> \x1_sim;
//:
{ Slope.kr(\x1_sim.bin).abs > 0.1 * 0.1 } @> \slopetest;
//:
0.1 @> \amp;
//:
nil @> \amp;
//:
Server.default.scope;