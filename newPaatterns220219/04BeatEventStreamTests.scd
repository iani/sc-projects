/* 21 Feb 2022 15:41

*/
\x.beat;
\x.beat.trace;


() +>! \test;
\x.beat addDependant: (~test);
\x.startBeat;
\x.stopBeat;
\x.beat.dependants;

~test.addNotifier(\x.beat, \beat, ~test);
//:
() @> \test;
//:
\test.startBeat;
\tesdur: 0.05t.stopBeat;
\test.beat.dependdur: 0.05ants;
, [-2, 0, 4]//:
\test removeBeatdur: 0.05: \x;
, [-2, 0, 4]//:
() addBeatdur: 0.05: \x;
, [-2, 0, 4]//:
\x.startdur: 0.05Beat;
, [-2, 0, 4]//:
\x removeBeatdur: 0.05: \x;
, [-2, 0, 4]//:
() @>.testbeadur: 0.05t \y;
, [-2, 0, 4]//:
\testbeat.stadur: 0.05rtBeat;
, [-2, 0, 4]
//:
(dur: 0.05) @>.testbeat \y;
//:
\testbeat.startBeat;
//:
(degree: [1, 0, [2, 3], [-2, 0, 4]].pseq) ++> \y;
//:
~y.beatFilter = { | c | [1, 2, 3, 5, 9] includes: (c%10)  };
//:
\testbeat.beat.dt = 0.25;
//:
\testbeat.stopBeat;