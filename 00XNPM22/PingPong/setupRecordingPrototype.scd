/*  4 Dec 2022 14:05
Set up groups, buffer and synths for recording.
This must be done before starting the main playing synths,
so that all synths are in the right order.

We have 3 groups in following order:

bufRecordingGroup: records the raw input from the interactive ping-pong sounds
bufPlaybackGroup: plays back the recorded input (later)
fxGroup: applies effects to the buffer playback.

We have 1 private stereo bus used for effects: fxBus;

bufPlaybackGroup writes to fxBus.
fxGroup reads from fxBus and writes to audio output.

bufPlaybackGroup plays back the buffer
*/

//:
~recBuffer = Buffer.alloc(
	Server.default,
	Server.default.sampleRate * 60 * 5,
	2
);

Buffer.addBuffer(\recBuffer, ~recBuffer);

//:
~fxBus = Bus.audio(Server.default, 2);
~fxGroup = Group();
~bufPlaybackGroup = Group.before(~fxGroup);
~bufRecordingGroup = Group.before(~bufPlaybackGroup);
//: testing order:
{ Impulse.ar(1) }.play(~bufPlaybackGroup, ~fxBus);
//:
{ Ringz.ar(In.ar(~fxBus), 4000, 0.1).dup }.play(~fxGroup);
//:
\fx.addBus(Bus.audio(Server.default, 2), \fxBus);
\fx.envir;
//:
~startRecording = {
	{
		RecordBuf.ar(In.ar(0, 2), \recBuffer.bufnum, loop: 1);
	}.play(~bufRecordingGroup);
};
//:
~startPlayback = {
	//	{ Impulse.ar(5) }.play(~bufPlaybackGroup, ~fxBus);
	{ PlayBuf.ar(2, \recBuffer.bufnum, loop: 1) }.play(~bufPlaybackGroup, ~fxBus);
};
~startFx = {
	{ Ringz.ar(In.ar(~fxBus, 2), LFNoise1.kr(1).range(400, 4000), 0.1).dup }.play(~fxGroup);
};
//:

//:
~startRecording.value;
//:
~startPlayback.value;
//:
~startFx.value;
//:======
ServerTree add: {
	var envir;
	envir = \audiobus.envir;
	envir keysValuesDo: { | key, value |
		if (value isKindOf: Bus and: { value.rate == \audio }) {
			envir[key] = nil;
		}
	};
};
//:
ServerTree add: {
	~bus = \fxbus.audiobus(2);
	~fxGroup = Group();
	~bufPlaybackGroup = Group.before(~fxGroup);
	~bufRecordingGroup = Group.before(~bufPlaybackGroup);
};
//:
{ Impulse.ar(1) }.play(~bufPlaybackGroup, ~bus);
{ Ringz.ar(In.ar(~bus), 4000, 0.1).dup }.play(~fxGroup);

a = \y.audiobus(4);
a.rate == \audio
~bus;
~fxGroup;
a.numChannels
\audiobus.envir;
//:
a = Bus.audio(Server.default, 1);