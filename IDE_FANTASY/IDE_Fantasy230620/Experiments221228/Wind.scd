//:Versions of simple wind sound emulation:
//:
{ WhiteNoise.ar.fader(amp: 0.01).dup } +> \wind;
//:
0.05 @>.wind \amp;
//: ====== control ======
//: control on-off with x1 sensor threshold
{ \x1.sr.gt(0.5, 0.5) * 0.01 } @>.wind \amp;
//:off
0.06 @> \x1; // any value < 0.5 turns sound off
//:on
0.7 @> \x1; // any value > 0.5 turns sound on
//:Emulate lively on-off sensor movements:
{ LFNoise2.kr(10.2) } @>.sensors \x1;
//:========== variations 1: amplitude ============
{ WhiteNoise.ar.fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Ringz.ar(WhiteNoise.ar, 440, 0.1).fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Mix(Ringz.ar(WhiteNoise.ar(0.1), 440 * [1, 1.1, 1.2], 0.1)).fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Mix(Ringz.ar(PinkNoise.ar(0.1), 440 * [1, 1.1, 1.2], 0.3)).fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Mix(Ringz.ar(PinkNoise.ar(0.1), 440 * { LFNoise0.kr(5).range(0.1, 10) }.dup(3),
	0.3)).fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Mix(Ringz.ar(PinkNoise.ar(0.1), 440 * { LFNoise0.kr([5, 5.1, 5.2]).range(0.1, 10) }.dup(3),
	0.3)).fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Mix(Ringz.ar(PinkNoise.ar(0.1), 440 * { LFNoise1.kr([5, 5.1, 5.2]).range(0.1, 10) }.dup(3),
	0.3)).fader(amp: 0.01).dup * \amp2.br(1) } +> \wind;
//:adding resonance
{ Mix(Ringz.ar(PinkNoise.ar(0.1), 440 * { LFDNoise1.kr(LFNoise1.kr(1/5).range(1, 2) * [5, 5.1, 5.2]).range(0.1, 10) }.dup(3),
	0.1)).fader(amp: 0.01).dup * \amp2.br(1) * LFNoise1.kr(0.5).range(0.1, 1) } +> \wind;
//:
{ LFPulse.kr(5) } @>.wind \amp2;
//:
{ LFPulse.kr(LFNoise0.kr(1/3).range(1, 10)) } @>.wind \amp2;
//:
{ LFPulse.kr(LFNoise1.kr(1/3).range(1, 10)) } @>.wind \amp2;
//:
{ LFPulse.kr(LFNoise2.kr(1/3).range(1, 10)) } @>.wind \amp2;
//:
{ LFNoise0.kr(2).range(0, 1) } @>.wind \amp2;
//:
{ LFDNoise0.kr(LFNoise0.kr(1/3).range(1, 10)).range(0, 1) } @>.wind \amp2;
//:
{ LFDNoise1.kr(LFNoise0.kr(1/3).range(1, 10)).range(0, 1) } @>.wind \amp2;
//:
{ LFDNoise3.kr(LFNoise0.kr(1/3).range(1, 10)).range(0, 1) } @>.wind \amp2;
//:
//:
{ Out.kr(0, LFPulse.kr(10)) }.play;
//:
Server.default.scope;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar.fader(amp: 0.01),
		\freq.br(440) * [1, 1.1, 1.2],
		0.3
	)).dup } +> \wind;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar.fader(amp: 0.01),
		\freq.br(440) * {LFNoise1.kr(5.01).range(0.8, 1.2)}.dup(3),
		0.13
	)).dup } +> \wind;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar(0.01).fader(amp: 0.01),
		\freq.br(440) * {LFNoise0.kr(1.01 * [1, 1.1, 1.2]).range(0.18, 7.2)}.dup(3),
		1.3
	)).dup } +> \wind;
//:
{
	Mix(Ringz.ar(
		WhiteNoise.ar(0.1).fader(amp: 0.01),
		\freq.br(440) * {LFNoise2.kr(1.01 * [1, 1.1, 1.2]).range(0.18, 7.2)}.dup(3),
		0.03
	)).dup } +> \wind;
//:
//:
//: control amplitude with x1 sensor threshold
{ \x1.sr.gt(0.5, 0.5) * 0.01 } @>.wind \amp;
//:off
0.06 @> \x1; // any value < 0.5 turns sound off
//:on
0.7 @> \x1; // any value > 0.5 turns sound on
//:Emulate lively on-off sensor movements:
{ LFNoise2.kr(10.2) } @>.sensors \x1;

//:
(freq: )
//:
{ LFNoise1.kr(5).range(400, 800) } @>.wind \freq;
//:
\wind stop: 1.5;
//:
500 @>.wind \freq;
//:
0.01 @>.wind \amp;
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
{  SinOsc.ar(\freq.br(400)).fader(amp: \amp.br(0.1)).dup } +> \wind;

{  SinOsc.ar(\freq.br(400)).fader(amp: \amp.br(0.1)).dup }.play
