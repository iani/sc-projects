/*  5 Dec 2022 00:20

*/
//:
ServerTree add: {
	~fxBus = Bus.audio(Server.default, 2);
	~fxGroup = Group();
	~playBackGroup = Group.before(~fxGroup);
	~recordingGroup = Group.before(~playBackGroup);
	~sourceGroup = Group.before(~recordingGroup);
	// \outbus <+.src ~fxBus;
	// \target <+.src ~sourceGroup;
};
//:
	\fxBus <+.fx ~fxBus;
	\target <+.fx ~fxGroup;
};
//:
\outbus <+.src ~fxBus;
\target <+.src ~sourceGroup;
\fxBus <+.fx ~fxBus;
\target <+.fx ~fxGroup;
//:
{ Impulse.ar(5) } +> \src;
//:
{ Impulse.ar(5) }.play(~playbackGroup, ~fxBus);
{ Ringz.ar(In.ar(~fxBus), 4000, 0.1).dup }.play(~fxGroup);
//:
\src.envir[\outbus];
\src.envir.keys;
//:
\x <+.test 1;
\test.envir;
\src.envir;

AudioBus