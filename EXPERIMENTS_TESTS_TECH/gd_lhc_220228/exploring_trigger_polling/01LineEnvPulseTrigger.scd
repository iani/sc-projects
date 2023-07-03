[{ Impulse.kr(Line.kr(1, 20, 5)) }] +>> \test;

{
	\test >>> { (dur: 0.05, amp: 0.05).play; };
	8.wait;
	\test.stop;
}.fork;