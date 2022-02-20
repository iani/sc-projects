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