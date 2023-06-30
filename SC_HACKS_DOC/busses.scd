/*  5 Nov 2022 21:48
*/
/* 31 Oct 2022 19:49
How to do bus mapping.
*/
currentEnvironment
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \bustest;
//:[1]
600 @>.bustest \freq;
//:[1]
600 @> \freq;
//:[1]
300 @>.bustest \freq;
//:[1]
300 @> \freq;
//:[1]
300 @> \freq;
//:[1]
1200 @>.blah \freq;
//:
{ LFNoise2.kr(15).range(500, 1500) } @> \freq;
//:
{ LFNoise0.kr(1.5).range(500, 1500) } @> \freq;
//:
nil @> \freq;
//:
nil @>.blah\freq;
//:
nil @>.pulsetest \freq;
//:
nil @>.bustest \freq;
//:
{ LFNoise0.kr(5).range(500, 1500) } @>.bustest \freq;
//:
{ LFNoise0.kr(15).range(500, 1500) } @>.blah \freq;

//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \blah;

//:[1]
{ \pulsetest.br(0.5).linexp(0.1, 1.0, 400, 4000) } @> \freq;
//:[1]
{ \pulsetest.br(0.5).linexp(0.1, 1.0, 400, 4000) } @> \freq;
//: This is to test from pinetime data!: ====== !!!!!
{ \pinetime_x1.br(0.5).linlin(-1200.0, 1200.0, 400, 4000) } @> \freq;
//:
0.2 @> \pulsetest;
//:
{ LFNoise1.kr(2).range(0.1, 1.0) } @> \pulsetest;
//:
\bustest.stop(\bustest);
\pulsetest.stop(\pulsetest);
//:Stop player which was playing into pulsetest
nil @> \pulsetest;
//:stop the bustest source player
\bustest.stop;
//:
\blah.stop;
//:
nil @>.bustest \bustest
//:
\blah.stop;
//:
currentEnvironment;
//:
a = (a: 1, b: 2);
a.put(\a, nil)