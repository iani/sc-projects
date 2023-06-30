/* 25 Dec 2022 12:27

*/
{
	var buf;
	buf = \buf.kr(\pilgrims.buf);
	PlayBuf.ar(
		1,
		buf,
		BufRateScale.kr(buf) * \rate.kr(1),
		\trigger.tr(1),
		\startPos.kr(0) * BufSampleRate.kr(buf),
		\loop.kr(1),
		2
	).fader.dup;
} +> \startpos;
//:
\pilgrims.buf.play;
//:
(buf: \weddell.bufnum) ++> \startpos;
(rate: 0.1, amp: 5) ++> \startpos;
(startPos: 47.35, trigger: 1, rate: 0.1, amp: 5) ++> \startpos;
(amp: 0.1) ++> \startpos;
(amp: 2.1) ++> \startpos;
(startPos: 50, trigger: 1) ++> \startpos;
(rate: 1, amp: 1, startPos: 7, trigger: 1) ++> \startpos;
(rate: 0.01, amp: 10) ++> \startpos;
(amp: 0.1) ++> \startpos;
//:

(buf: \pilgrims.bufnum) ++> \startpos;
(rate: 0.1, amp: 1.5) ++> \startpos;
(rate: 0.3, amp: 1.5) ++> \startpos;
(buf: \crickets.bufnum) ++> \startpos;
(rate: 0.12, amp: 1) ++> \startpos;
(startPos: 10, trigger: 1) ++> \startpos;
(startPos: 10, trigger: 1) ++> \startpos;
(startPos: 50, trigger: 1) ++> \startpos;
(startPos: 5, trigger: 1) ++> \startpos;
(rate: 1, amp: 1) ++> \startpos;
//:
(buf: \crickets.bufnum) ++> \startpos;
(buf: \crickets.bufnum) ++> \startpos;
(buf: \crickets.bufnum) ++> \startpos;