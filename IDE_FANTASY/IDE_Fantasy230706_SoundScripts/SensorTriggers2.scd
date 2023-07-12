/*  8 Jul 2023 09:36
Add SendReply and standardize busses + names, to prepare class.
*/
//:= !!! = combine 3d slope + env in one function (for class)
// Theee settings avoid repeats while keeping response relatively sharp
{
	var trig, envsig;
	Fader(); // make releasable;
	trig = 	(
		Amplitude.kr(Slope.kr(\x1.sr)).lag(0.15) +
		Amplitude.kr(Slope.kr(\y1.sr)).lag(0.15) +
		Amplitude.kr(Slope.kr(\z1.sr)).lag(0.15)
	) > 1.5;
	envsig = EnvGen.kr(
        Env([0, 1, 1, 0], [0.02, 1, 0.3], releaseNode: 2),
        gate: trig,
		doneAction: 0
    );
	SendReply.kr(envsig > 0, '/on');
	SendReply.kr(envsig.lag(0.0) <= 0, '/off');
	envsig;
} @>.trigenv \amp3dslope;
// osc msg -> amp
'/on' >>> { "on".postln; 0.1 @>.onoff \amp };
'/off' >>> { "off".postln; 0.0 @>.onoff \amp };
// test sound
{	// start silent
	SinOsc.ar(\freq.br(440), 0, \amp.br(0.0)).dup
} +> \onoff;
//: watch on signal
OSC.trace1('/on');
OSC.trace1('/off');
//:on off osc signal controlled sound
OSC.untrace1('/on');
OSC.untrace1('/off');
'/on' >>> { "on".postln; 0.1 @>.onoff \amp };
'/off' >>> { "off".postln; 0.0 @>.onoff \amp };
{	// start silent
	SinOsc.ar(\freq.br(440), 0, \amp.br(0.03)).dup
} +> \onoff;
//:debug
// 500 @>.onoff \freq;
{ LFNoise0.kr(4).range(400, 500) } @>.onoff \freq;
//:debug
0.1 @>.onoff \amp;
0.0 @>.onoff \amp;
//:Debug @>.not working
EditSoundPlayer().play((buf: \crickets, playfunc: \magshift, dur: 10000));
//:
-100 @>.s \shift;
//:
{ LFNoise1.kr(1).range(-500, 500) } @>.s \shift;
//:
{ LFNoise1.kr(7).range(-500, 500) } @>.s \shift;
//:
{ LFNoise1.kr(0.1).range(-500, 500) } @>.s \shift;
//:
{ SinOsc.ar(\freq.br(0).linlin(-500, 500, 400, 900), 0, 0.2).dup } +> \onoff;
//:
100.1 @>.onoff \freq;
400.0 @>.onoff \freq;
//:
//:amp controlled sound - old style
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
