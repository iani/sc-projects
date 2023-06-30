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

/*
// Transfer stuff from setupRecording later when tested.

~fxBus = Bus.audio(Server.default, 2);
~fxGroup = Group();
~bufPlaybackGroup = Group.before(~fxGroup);
~bufRecordingGroup = Group.before(~bufPlaybackGroup);
//: testing order:
{ Impulse.ar(1) }.play(~bufPlaybackGroup, ~fxBus);
//:
{ Ringz.ar(In.ar(~fxBus), 4000).dup }.play(~fxGroup);
//:
*/