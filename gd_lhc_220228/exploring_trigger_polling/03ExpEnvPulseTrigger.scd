[{ Impulse.kr(XLine.kr(1, 20, 5)) }] +>> \test;
// [{ Impulse.kr(XLine.kr) }] +>> \test; // steady pulse!

{
	\test >>> { (dur: 0.05, amp: 0.05).play; };
	8.wait;
	\test.stop(0.01);
	"Stopped the triggering synth".postln;
}.fork;