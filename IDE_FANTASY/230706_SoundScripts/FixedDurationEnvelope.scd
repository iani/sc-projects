/*  6 Jul 2023 21:02

*/
//:from help
{
    var env, envgen, trig;

	env = Env([0.0, 1.0, 1.0, 0.0], [0.05, 1.0, 1.5], -4, releaseNode: 2);
    envgen = EnvGen.ar(env, Trig.kr(1, 0.2), doneAction: Done.freeSelf);
    SinOsc.ar(1000 + 440) * envgen * 0.1
}.play
//:adapting adr
{
    var env, envgen, trig, dur = 1, ad = 0.2;

	env = Env([0.0, 1.0, 1.0, 0.0], [ad, dur - ad, ad], -4, releaseNode: 2);
    envgen = EnvGen.ar(env, Trig.kr(1, dur - ad), doneAction: Done.freeSelf);
    SinOsc.ar(1440, 0, 0.1) * envgen * 0.1
}.play;
//:turning it into a function;
f = { | dur = 1 |
    var env, envgen, trig, ad = 0.2;

	env = Env([0.0, 1.0, 1.0, 0.0], [ad, dur - ad max: 0.1, ad], -4, releaseNode: 2);
    envgen = EnvGen.kr(env, Trig.kr(1, dur - ad max: 0.1), doneAction: Done.freeSelf);
};
{ SinOsc.ar(400, 0, 0.1).dup * f.(0.9) }.play;
//:
{ SinOsc.ar(400, 0, 0.1).dup * f.(0.5) }.play;
//:
{ SinOsc.ar(400, 0, 0.1).dup * f.(0.15) }.play;
//:
{ SinOsc.ar(400, 0, 0.1).dup * f.(0.05) }.play;
//:
{ SinOsc.ar(400, 0, 0.1).dup * f.(3.05) }.play;
//:arbitrary duration, fixed attack/decay
{
	var env, trig, dur = 0.03, ad = 0.02;
	dur = 3;
	trig = Trig.kr(Impulse.kr(1), dur - ad);
	env = Env([0, 1, 1, 0], [ad, dur, ad], releaseNode: 2);
	WhiteNoise.ar(0.02) * EnvGen.kr(env, trig);
} +> \test;