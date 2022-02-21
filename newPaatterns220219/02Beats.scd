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
