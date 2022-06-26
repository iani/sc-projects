//:
b = BeatCounter();
b.start;
b.trace;
b.stop;

b.add(\test1, { (dur: 0.01).play; });
b.remove(\test1);
b.dt = 0.15;
//:
Registry(BeatCounter, \mybeat, {
	BeatCounter()
}).start.trace;

//:
\x.beat.start;
\x.beat.stop;

//:
b = EventStream((degree: (0..16).pseq, dur: 0.01));
//:
b.addBeat(\x);
//:
b.removeBeat(\x);
//:
\x.beat.add(b, { b.next.play });
//:
b.start;
b.stop;
~test;

//:
{ | n, b | (dur: 0.01, degree: b % 8).play; }.beat(\x).start;
\x.beat.dt = 0.1;//
//:
{ | n, b | if ([0, 1, 4, 6] includes: (b % 8)) { (dur: 0.01, degree: 10).play; } }.beat(\x).start
//:
(degree: (0..16).pseq) +> \test;
//:
~test.addBeat(\x);
//:
~test.next.play;
//:
\x.startBeat;
\x.beat.trace;
\x.beat.trace;
\x.beat.untrace;

\x.stopBeat;
//: NEED TO AVOID ADDING NEW EVENTS EACH TIME
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// FIXME: debug this. Do not add new eventsstreams if same name event name
(dur: 0.01, degree: (0..10).pseq) @> \y;
(dur: 0.01, degree: (0..10).pseq) @>> \y;
//:
\y.stopBeat;
//:
\y.startBeat;
//:

a = (degree: (1..5).pseq) +> \test;
a = (degree: (0..5).pseq) ++> \test;
a = (dur: 0.1) +> \test;
a = (dur: 0.1) ++> \test; ///// ??????
a = (dur: 1) ++> \test; ///// ??????

//:
a.start;
a.stop;
//:
a.addEvent((degree: (3..5).pseq));