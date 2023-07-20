//code
//:--[1.0] //:= !!! = combine 3d slope + env in one function (for class)
// Theee settings avoid repeats while keeping response relatively sharp
{
	var trig, envsig;
	// Fader(); // make releasable;
	trig = 	AmpSlopeXyz() > 1.5;
	envsig = EnvGen.kr(
        Env([0, 1, 1, 0], [0.02, 1, 0.3], releaseNode: 2),
        gate: trig,
		doneAction: 0
    );
	SendReply.kr(envsig > 0, '/on', 10.rand);
	SendReply.kr(envsig.lag(0.0) <= 0, '/off', 10.rand);
	envsig;
} @>.trigenv \amp3dslope;
//:--[1.0]  osc msg -> amp
'/on' >>> { /* "on".postln; */ 0.1 @>.onoff \amp };
'/off' >>> { /* "off".postln; */ 0.0 @>.onoff \amp };
//:--[1.0]  test sound
{	// start silent
	SinOsc.ar(\freq.br(440), 0, \amp.br(0.0)).dup
} +> \onoff;
//:--[1.0]  more tests
'/on' >>>.hi { (degree: 10 rrand: 20, dur: 0.1).play };
'/off' >>>.lo { (degree: -5 rrand: 0, dur: 0.1).play };
//:--[1.0]  Trace ---
OSC.trace1('/on');
OSC.trace1('/off');
//:--[1.0] Sound Check --
(dur: 0.1.rrand(0.5), degree: [-10, 20, 3].pbrown) +> \test;
