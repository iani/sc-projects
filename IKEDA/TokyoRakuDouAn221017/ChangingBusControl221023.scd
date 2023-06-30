/* 23 Oct 2022 11:35
*/
//:
OSC.trace;
OSC.untrace;
//:
OSCRecorder3.enable;

//

SenseData().setxyz(1, 2, 3, 4, 5, 6, 7, 8);

OscGroups.enable;
//:
Project.gui;
//:
1000.rand;
//:
{ LFSaw.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ LFSaw.ar(In.kr(\z6.bus.index.postln).linlin(0.45, 0.55, 500, 600), 0, 0.1).dup } +> \test;
//:
{ LFNoise1.kr(0.5).range(300, 1600) } @> \freq;

{ In.kr(\x6.bus.index).linlin(0.45, 0.55, 100, 200) } @> \freq;

{ x2.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 27.5) } @> \freq;


1600 @> \freq2;
600 @> \freq;

{ LFNoise1.kr(5).range(300, 1600) } @> \freq;
\freq @> \freq2 ++> \test;
\freq @> \freq ++> \test;
\freq.pget;

nil @> \freq;

\freq @> \freq2;

\freq2.bus;

\bus.bus;
//:
{ LFSaw.ar(\freq.br(400), 0, 0.01).dup } +> \test;
//:
{ LFNoise0.kr(2).range(300, 1600) } @> \freq2;
//:
600 @> \freq2;
//:
\freq @> \freq2 ++> \test;
//:
\freq @> \freq ++> \test;
//:
//:

\freq @> \freq ++> \test;
\freq.bus.pget;
//:
\test.player;
//:
//:
//:
//:
400 @> \freq;
//:
600 @> \freq;
//:
300 @> \freq2;
//:
{ LFSaw.ar(\freq.br(400), 0, 0.01).dup }.play;
//:
//:

//:
{ LFNoise2.kr(10).range(300, 600) } @> \freq;
//:
nil @> \freq;
//:
\freq.bus.index;
//:
PlayerHistory.gui;