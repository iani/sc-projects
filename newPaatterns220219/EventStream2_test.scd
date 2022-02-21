/* 21 Feb 2022 14:11

*/
// =====================================================================
// SuperCollider Workspace
// =====================================================================
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
\x.beat.add(\test1, { (dur: 0.01).play; });
//:
{ | n, b | (dur: 0.01, degree: b % 8).play; }.beat(\x).start;
\x.beat.dt = 0.1;//
//:
{ | n, b | if ([0, 1, 4, 6] includes: (b % 8)) { (dur: 0.01, degree: 10).play; } }.beat(\x).start
//:
e = EventStream2((degree: (0..16).pseq, dur: 0.25.pn(40)));
e.start;
//:
e addEvent: (dur: 0.1);
//:
e addEvent: (dur: 0.1.pn(5));
//:
e addEvent: (degree: (0..16).prand);
//:
e.reset;
//:
e.reset.start;
//:
e.stop;

//:
1.pn(2);

1.pn(3).asStream;
