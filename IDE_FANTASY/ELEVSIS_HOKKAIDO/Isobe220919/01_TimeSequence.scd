/* 19 Aug 2022 17:01
Simple example of time sequence.
*/
// Note: To play a time sequence, you must always put it in a routine.
// A simple way to make a routine is to send fork to a function: {  }.fork;

//:example 1:
~routine1 = {
	(degree: 10).play;
	3.wait;
	(degree: 15).play;
}.fork;
//:example 2: Loop :
~routine2 = {
	loop {
		(degree: 0).play;
		0.5.wait;
		(degree: 5).play;
		0.2.wait;
	}
}.fork;
//: to stop the routine send it the message stop:
~routine2.stop;

//:A different way to play sequences is by using patterns:
(dur: 0.1, degree: (0..15).pseq) ++> \test;
//:you can change the timing or any other parameter at any point
(dur: [0.1, 0.2].pseq) ++> \test;
(dur: [0.1, 0.2, 0.5].prand) ++> \test;
(degree: (0..15).prand) ++> \test;
//:
{ SinOsc.ar() } +>.pedrosDefault \test;
//:
600 ++>.freq \test
//:
\test <+.freq 600;
//:
//:
~test.push;
~fadeTime = 10;

EventStream