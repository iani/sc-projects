{  SinOsc.ar(\freq.br(400)).fader(amp: 0.1).dup } +> \test;
{  SinOsc.ar(\freq.br(400)).fader(amp: 0.2).dup } +> \test;
{ WhiteNoise.ar.fader(amp: 0.01).dup } +> \test;
//:
{ \x1.sr.gt(0.5, 0.5) * 0.01 } @>.test \amp;
{ LFNoise2.kr(10.2) } @>.sensors \x1;
0.06 @> \x1;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar.fader(amp: 0.01),
		\freq.br(440) * [1, 1.1, 1.2],
		0.3
	)).dup } +> \test;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar.fader(amp: 0.01),
		\freq.br(440) * {LFNoise1.kr(5.01).range(0.8, 1.2)}.dup(3),
		0.13
	)).dup } +> \test;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar.fader(amp: 0.01),
		\freq.br(440) * {LFNoise0.kr(7.01 * [1, 1.1, 1.2]).range(0.18, 7.2)}.dup(3),
		0.13
	)).dup } +> \test;
//:
(freq: )
//:
{ LFNoise1.kr(5).range(400, 800) } @>.test \freq;
//:
\test stop: 1.5;
//:
500 @>.test \freq;
//:
0.01 @>.test \amp;
//:
//:

//:
{ \x1.sr.lin(60, 70).midicps } @> \freq;
//:
0.9 @> \x1;
//:
0.09 @> \x1;
//:
//:
{  SinOsc.ar(\freq.br(400)).fader(amp: \amp.br(0.1)).dup } +> \test;

{  SinOsc.ar(\freq.br(400)).fader(amp: \amp.br(0.1)).dup }.play
