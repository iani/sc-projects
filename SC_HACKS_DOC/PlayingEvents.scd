/*  5 Nov 2022 21:48

*/
//:Play an empty event as pattern (=EventStream)
() +> \test;
//:stop the event
\test.stop;
//:
\test.start;
//:modify the playing pattern
(dur: 0.5) ++> \test;
//:modify the playing pattern
(degree: (0..10).pseq) ++> \test;
//:modify the playing pattern
(degree: (0..10).pseq) ++> \test;
//:get the EventSream stored in 'test':
\test.player;
//:reset:
\test.reset;
//:reset:
\test.player.reset;
//:change (overwrite)
{ WhiteNoise.ar(0.1).dup } +> \test;
//:
\default +> \test;
//:
currentEnvironment;