().play;
() +> \test;
(degree: 10) ++> \test;
(counter: Pseries()) ++> \test;
(play: { "hello world".postln; }) ++> \test;
(play: { ~counter.postln; }) ++> \test;

\x.addNotifier(\test.player, \played, { | n, args | [n, args].postln;  });
\x.removeNotifier(\test.player, \played, { | n, args | [n, args].postln;  });

\test.stop;
\test.player;
