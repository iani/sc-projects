PhaseBuf_.bplay;
PhaseBuf_ bplay: \crickets;
PhaseBuf_.bplay(\crickets);
PhaseBuf_.bplay;
//:plays in default envir!
Grain0_.bplay(\crickets, (startframe: 40000, rate: 0.2));
currentEnvironment; // = \default .... !
//:
Grain0_.bplay(\crickets, (startframe: 40000, rate: 0.2, vol: 0.0));
//:implies current envir, = default!
1.0 @> \vol;
//:
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
//:
//:--[1.0]  osc msg -> amp
'/on' >>> { /* "on".postln; */ 1.0 @>.default \vol };
'/off' >>> { /* "off".postln; */ 0.0 @>.default \vol };
//:
{ SinOsc.ar(400, 0, 0.1).dup * \vol.br(0) } +>.default \test;
//:
\test.stop(5, \default);
//:
Grain0_.bplay(\crickets, (startframe: 40000, rate: 0.2, vol: 0.0));
//:
{  LFNoise0.kr(5).range(0, 1) } @>.default \pos;