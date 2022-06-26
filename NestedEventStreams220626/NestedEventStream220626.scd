/* 26 Jun 2022 08:50

*/
//:
Event.addEventType(\test, {
	"testing".postln;
	(degree: [10, 11, 10, 12, 10, 13].pseq(1), dur: 0.05).asEventStream.start(0);
});
//:
() +> \test;
(type: \note) ++> \test;
(type: [\test, \note, \test, \note, \note].pseq, dur: 2) ++> \test;

//:
\test.start(4);
\test.start(0);
