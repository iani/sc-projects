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
//:
\test.startBeat;
//:
() +>! \test;
//:
~test addBeat: \test;
//:
~test.getNextEvent;
//:
~test.getNextEvent.play;
//:
() +> \test;
//:
\x addDependant: ~test;
//:
\x changed: \beat;
//:
~test;
//:
\test.beat addDependant: ~test;
//:
\test.beat changed: \beat;
//:
//:

//:
() @> \test;

() +>! \test;
~test.addBeat(\test2);
\test2.startBeat;
~test.removeBeat(\test2);
\test2.stopBeat;
\test.beat.dependants;
\test.beat.dependants.asArray.first.inspect;
\test.beat.trace;
Notification.notifications;

\x.addNotifier(\test.beat, \beat, { "testing".postln; });

\x.addNotifier(\y, \beats, { "done".postln; });
\y.changed(\beats);