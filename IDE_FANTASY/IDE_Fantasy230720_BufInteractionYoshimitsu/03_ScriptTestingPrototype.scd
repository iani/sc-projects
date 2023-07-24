//: Sensor setup
{ // setup trigger from sensor input
	var trig, envsig;
	// Fader(); // make releasable;
	trig = 	AmpSlopeXyz(9) > 1.5;
	envsig = EnvGen.kr(
        Env([0, 1, 1, 0], [0.02, 1, 0.3], releaseNode: 2),
        gate: trig,
		doneAction: 0
    );
	SendReply.kr(envsig > 0, '/on', 10.rand);
	SendReply.kr(envsig.lag(0.0) <= 0, '/off', 10.rand);
	envsig;
} @>.trigenv \amp3dslope;
// setup response from trigger
'/on' >>> { "on".postln; 1.0 @>.default \vol };
'/off' >>> { "off".postln;  0.0 @>.default \vol };
//: \crickets
Grain0_.bplay(\crickets, (startframe: 0, rate: 0.2, vol: 1.0));
//: \default
Grain0_.bplay(\weddell, (startframe: 0, rate: 0.2, vol: 1.0));
//: \default
Grain0_.bplay(\default, (startframe: 0, rate: 0.2, vol: 1.0));
//: \default
Grain0_.bplay(\fones, (startframe: 0, rate: 0.2, vol: 1.0));
