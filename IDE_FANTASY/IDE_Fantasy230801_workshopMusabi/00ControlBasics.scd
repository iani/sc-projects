
//:
{ SinOsc.ar(400, 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(400.rrand(5000), 0, 0.1).dup } +> \test;
//:*
{ SinOsc.ar(400.rrand(5000), 0, 0.1).dup } +> \test;
1.wait;
//:*
{ SinOsc.ar(400.rrand(5000), 0, 0.1).dup } +> \test;
0.1.wait;
//:*
{ SinOsc.ar(40.rrand(80).midicps, 0, 0.1).dup } +> \test;
0.1.wait;
//:*
{ LFSaw.ar(40.rrand(80).midicps, 0, 0.1).dup } +> \test;
0.1.wait;
//:*
{ LFPulse.ar(40.rrand(80).midicps, 0, 0.5, 0.1).dup } +> \test;
0.1.wait;
//:*
[
	{ LFPulse.ar(40.rrand(80).midicps, 0, 0.5, 0.1).dup },
	{ LFSaw.ar(40.rrand(80).midicps, 0, 0.1).dup },
	{ SinOsc.ar(40.rrand(80).midicps, 0, 0.1).dup }
].choose
	+> \test;
0.1.wait;
//:*
[
	{ LFPulse.ar(40.rrand(80).midicps, 0, 0.5, 0.1).dup },
	{ LFSaw.ar(40.rrand(80).midicps, 0, 0.1).dup },
	{ SinOsc.ar(40.rrand(80).midicps, 0, 0.1).dup }
].choose
	+> \test;
[0.1, 0.2, 0.4].choose.wait;
//:
\test.stop;
//:
\test.stop(0.01);
//:
\test stop: 5;
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
500 @>.test \freq;
//:*
500.rrand(1000) @>.test \freq;
0.1.wait;
//:
{ SinOsc.ar(\x1.sr().exp(100, 6000), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\x1.sr().lin(20, 100).midicps, 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\x1.sr().lag(0.2).exp(100, 6000), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ \x1.sr.exp(100, 1000) } @>.test \freq;
//:
{ \x1.sr.lag(0.1).lin(20, 100).round(1).midicps } @>.test \freq;
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(400) * LFNoise0.kr(10).range(0.9, 1.1), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(400) * LFNoise1.kr(10).range(0.9, 1.1), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(400) *
	LFNoise1.kr(\vrate.br(10))
	.range(\vlo.br(0.9), \vhi.br(1.1)), 0, 0.1).dup
} +> \test;
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ LFNoise0.kr(10).range(400, 4000) } @>.test \freq;
//:
{ LFNoise0.kr(1).range(400, 4000) } @>.test \freq;
//:
{ LFNoise0.kr(20).range(400, 4000) } @>.test \freq;
//:
{ LFNoise0.kr(20).range(Line.kr(100, 1000, 60), Line.kr(150, 1500, 60)) } @>.test \freq;
//:
{ LFNoise0.kr(20).range(XLine.kr(100, 1000, 10), XLine.kr(150, 1500, 10)) } @>.test \freq;
//:
{ LFNoise0.kr(20).range(XLine.kr(100, 6000, 5), XLine.kr(150, 6500, 5)) } @>.test \freq;
//:
{ LFNoise0.kr(20).range(XLine.kr(6000, 100, 5), XLine.kr(6500, 150, 5)) } @>.test \freq;
//:
{
	var lo, hi;
	lo = XLine.kr(6000, 100, 5);
	hi = lo * 1.5;
	LFNoise0.kr(20).range(lo, hi)
} @>.test \freq;
//:
{
	var lo, hi;
	lo = XLine.kr(100, 6000, 5);
	hi = lo * 1.5;
	LFNoise0.kr(20).range(lo, hi)
} @>.test \freq;
//:
{
	var lo, hi;
	lo = XLine.kr(100, 6000, 2);
	hi = lo * 1.5;
	LFNoise0.kr(20).range(lo, hi)
} @>.test \freq;
//:*
{
	var lo, hi;
	var base, other;
	base = 1000 rrand: 2000;
	other = base * [0.5, 2].choose;
	lo = XLine.kr(base, other, 0.5.rrand(2));
	hi = lo * 1.5;
	LFNoise0.kr(20).range(lo, hi)
} @>.test \freq;
0.1.rrand(5.0).wait;
//:*
{
	var lo, hi;
	lo = XLine.kr(100, 6000, 0.5.rrand(2));
	hi = lo * 1.5;
	LFNoise0.kr(20).range(lo, hi)
} @>.test \freq;
1.rrand(2.0).wait;
//:
{ \x1.sr.lin(20, 100).round(1).midicps } @>.test \freq;
{ \z1.sr.lag(0.1).lin(1, 20) } @>.test \vrate;
{ \x2.sr.lin(20, 100).round(1).midicps } @>.test \freq;
{ \x1.sr.lag(0.1).lin(20, 100).round(1).midicps } @>.test \freq;
//:
