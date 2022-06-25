/* 24 Jun 2022 17:21

*/
//:
a = ().asEventStream;
a.start;
a.stop;
a.addBeat(\beat);
//:
\beat.changed(\beat);
//:
\beat.beat;
//:
\beat.beat.start;
\beat.beat.stop;
//:
\beat.beat.dt = 3;
