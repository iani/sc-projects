/*  6 Jul 2023 15:42
Triggering events from the sensors
*/
//:Start: sending a trigger
{ SendReply.kr(Impulse.kr(1), '/hello', 1) } +> \sendreply;
//:listening to the trigger
'/hello' >>> { (dur: 0.1, degree: 10.rand).play; };
//:Stop the first sendreply test synth
\sendreply.free;
//:a sendreply triggered by a control signal
{
	var ctl;
	Fader();
	ctl = LFSaw.kr(0.8);
	SendReply.kr(ctl > 0.5, '/hello', 1);
} +> \sendreply;
//:triggered by watching a sensor
{
	var ctl;
	Fader();
	ctl = \x1.sr > 0.5;
	SendReply.kr(ctl, '/hello', 1);
} +> \sendreply;
//:make sensor input configurable:
{
	Fader(); // ctl
	SendReply.kr(\trig1.br, '/hello', 1);
} +> \sendreply;
//:Try x1>0.5 as trigger:
{ \x1.sr > 0.5 } @>.sendreply \trig1;
//:Try z1>0.5 as trigger:
{ \z1.sr > 0.5 } @>.sendreply \trig1;
//:try a combination of x1 and z1 as trigger
{ (\z1.sr > 0.5) * (\x1.sr > 0.5)  } @>.sendreply \trig1
//:try slope of x1 as trigger
{ Slope.kr(\x1.sr.lag(0.5)) > 2.9  } @>.sendreply \trig1
//:x1>0.5 cleanest! on when down
{ \x1.sr > 0.5 } @>.sendreply \trig1;
//: x1<0.5 on when up
{ \x1.sr < 0.5 } @>.sendreply \trig1;
//:========= <> as on-off combined
{
	Fader(); // ctl
	SendReply.kr(\on.br, '/on', 1);
} +>.sendreply \triggeron;
'/on' >>> { "on received".postln; (degree: 10).play };
{ \x1.sr(0.7) > 0.5 } @>.sendreply \on;
//:off part
{
	Fader(); // ctl
	SendReply.kr(\off.br, '/off', 1);
} +>.sendreply \triggeroff;
'/off' >>> { "off received".postln; (degree: -1).play };
{ \x1.sr < 0.3 } @>.sendreply \off;
//:Releasing envelope for sound
{
	SinOsc.ar(400, 0, 0.01).dup *
    EnvGen.kr(
        Env([0, 1, 1, 0], [0.2, 1, 0.2], releaseNode: 2),
        gate: \trig.br(1),
		doneAction: 0
    );
} +> \trigenv;
//:manually set off
0.0 @>.trigenv \trig;
//:manually set on againg
1.0 @>.trigenv \trig;
//:set on (-off?) with sensor
{ \x1.sr > 0.5 } @>.trigenv \trig;
//:Not good: slope x1 only
{ Slope.kr(\x1.sr).lag(0.5) > 0.05 } @>.trigenv \trig;
//:GOOD: improved slope on 3d
{ (Amplitude.kr(Slope.kr(\x1.sr)) +
	Amplitude.kr(Slope.kr(\y1.sr)) +
	Amplitude.kr(Slope.kr(\z1.sr))).lag(0.15) > 0.5 } @>.trigenv \trig;
//:= !!! = combine 3d slope + env in one function (for class)
{
	var trig;
	Fader(); // make releasable;
	trig = 	(Amplitude.kr(Slope.kr(\x1.sr)) +
	Amplitude.kr(Slope.kr(\y1.sr)) +
	Amplitude.kr(Slope.kr(\z1.sr))).lag(0.15) > 0.5;
	EnvGen.kr(
        Env([0, 1, 1, 0], [0.52, 1, 0.52], releaseNode: 2),
        gate: trig,
		doneAction: 0
    )
} @>.trigenv \amp3dslope;
//:amp controlled sound
{
	SinOsc.ar(400, 0, 0.01).dup * \amp3dslope.br;
} +> \trigenv;
//:sharper attack?
{
	var trig;
	Fader(); // make releasable;
	trig = 	(Amplitude.kr(Slope.kr(\x1.sr)) +
	Amplitude.kr(Slope.kr(\y1.sr)) +
	Amplitude.kr(Slope.kr(\z1.sr))).lag(0.15) > 0.5;
	EnvGen.kr(
        Env([0, 2, 0.1, 0], [0.01, 1, 0.52], releaseNode: 2),
        // Env.adsr,
        gate: trig,
		doneAction: 0
    )
} @>.trigenv \amp3dslope;
//:
{
	WhiteNoise.ar(0.01).dup * \amp3dslope.br;
} +> \trigenv;
//:amp controlled sound
{
	SinOsc.ar(400, 0, 0.01).dup *
    EnvGen.kr(
        Env([0, 1, 1, 0], [0.2, 1, 0.2], releaseNode: 2),
        gate: \trig.br(1),
		doneAction: 0
    );
} +> \trigenv;
//:=========================== Further tries
1 @>.sendreply \on;
//:x1 > 0.5 Sensor trigger:
//:Same with off
{
	Fader(); // ctl
	SendReply.kr(\off.br, '/off', 1);
} +>.off \sendreply;
'/off' >>> { "off received".postln; (degree: -5).play };
{ \x1.sr < 0.5 } @>.sendreply \off
//:trigger off:
1 @>.sendreply \on;
//:x1 > 0.5 Sensor trigger:
{ \x1.sr > 0.5 } @>.sendreply \on;
//:failed. debug????
{	Fader();
	SendReply.kr(\on.br, '/on', 1);
} +>.on \sendreply;
{	Fader();
	SendReply.kr(\off.br, '/off', 1);
} +>.off \sendreply;
//:
{ \x1.sr > 0.5 } @>.sendreply \on;
{ \x1.sr < 0.5 } @>.sendreply \off;
//:
'/on' >>> { (degree: 30).play };