// [{ Impulse.kr(Line.kr(1, 20, 5)) }] +>> \test;
// the above works
// but Line without arguments produces a steady signal
[{ Impulse.kr(Line.kr) }] +>> \test;

{
	\test >>> { | n, msg, time |
		postln("time:" + time);
		(dur: 0.05, amp: 0.05).play; };
	8.wait;
	\test.stop;
}.fork;