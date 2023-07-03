/* 19 Feb 2022 13:23

*/
//:
a
//:
a = ();
//:
a[\play];
//:
a.parent;
//:
//:
a.parent.keys;

a = ();//:
a.parent = Event.default.parent.copy;
a.parent[\play] ={ | e | postf("\n\nplaying %\n\n %\n\n", 1000.rand / 3, currentEnvironment.parent) }
//:
a.play;
//:
a[\play;];

a.splay;
//:
a.dur;
//:Problem: this replaces the parent?
a.spl bday; jjb
//:
(play: { | e | postf("\n\nplaying\n\n %\n\n", currentEnvironment.parent) }).play;


(x: Pfunc({ "x".postln }), play: { postf("\n\nplaying\n\n %\n\n", currentEnvironment.parent) }).splay;
//:
a = ().splay;

a.streamPlayer.stream;
a addDependant: { | ... args | args.postln; };
a;
//:
a.trace;
//:
a.untrace;
//:
Object respondsTo: \trace;
//:
() +> \test;
//:
(dur: 0.2) ++> \test ;
 //:
(degree: 3) +> \test2;
//:
(dur: 1) ++> \test2 ;
 //:
\test2.stop;
//:
(dur: 0.2) ++> \test ;
 //:
(degree: Pseq([0, 1, 2, 3, 4], inf)) ++> \test;
//:
(degree: [2, -1].pseq) ++> \test;
//:
(dur: 1) ++> \test;
//:
~test add: (dur: 0.2);
//:
(dur: 1.55) ++> \test;
//:
(degree: 10) ++> \test;
//:
{ WhiteNoise.ar(0.1) } +> \test;
//:
~test.isPlaying;
~test.start;
~test.isPlaying;
~test.stop;
