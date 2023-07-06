/*  6 Jul 2023 23:49
Testing use of EditSoundPlayer
*/
//:First test
EditSoundPlayer().play; // default: entire buffer
//:adjust rate
EditSoundPlayer().set(\rate, 0.5).play;
//:adjust rate again
EditSoundPlayer().set(\rate, 0.05).play;
//:move the rate around
EditSoundPlayer().set(\rate, 0.05, \dur, 1000).play;
{ LFNoise2.kr(0.1).range(0.25, 4) } @>.s \rate;
//:very slow pilgrims
EditSoundPlayer().set(\buf, \pilgrims, \rate, 0.025, \vol, 10).play;
//:var rate slow pilgrims
EditSoundPlayer().set(\buf, \pilgrims, \rate, 0.025, \vol, 10).play;
{ LFNoise1.kr(0.2).range(0.03, 0.1) } @>.s \rate;
//:rounded var rate slow pilgrims
EditSoundPlayer().set(\buf, \pilgrims, \rate, 0.025, \vol, 10).play;
{ LFNoise1.kr(0.2).range(0.03, 0.1).round(0.01) } @>.s \rate;
//:pilgrims
EditSoundPlayer().play((buf: \pilgrims, rate: 10))