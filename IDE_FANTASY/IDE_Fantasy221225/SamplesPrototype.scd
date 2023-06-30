/* 22 Dec 2022 12:52
Sample playback.
*/

\kiiroi.buf;
//:
\fones.playbuf((loop: 1));
//:
currentEnvironment;
//:
\fones.envir;
//:
{ LFNoise0.kr(10).range(0, \fones.numFrames) } @>.fones \startPos;
{ Impulse.kr(10) } @>.fones \trig;
//:
\fones.set(\trig, 1);
//:
{
	PlayBuf.ar(
		\kiiroi.buf.numChannels,
		\kiiroi.buf.bufnum,
		\rate.kr(1),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader
} +> \kiiroi;
//:
{
	PlayBuf.ar(
		\kiiroi.buf.numChannels,
		\kiiroi.buf.bufnum,
		\x5.sr.lin(0.13, 2.0), // \rate.kr(1),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader * (\z5.sr > 0.5).lag(1)
} +> \kiiroi;
//:
(rate: 0.5) ++> \kiiroi;
//:
(rate: 0.5) ++> \kiiroi;
//:
{
	PlayBuf.ar(
		\kiiroi.buf.numChannels,
		\kiiroi.buf.bufnum,
		\x5.sr.lin(0.13, 2.0), // \rate.kr(1),
		\trigger.kr(1),
		\startPos.kr(0),
		\loop.kr(1),
		2
	).fader * (\z5.sr > 0.5).lag(1)
} +> \x5;