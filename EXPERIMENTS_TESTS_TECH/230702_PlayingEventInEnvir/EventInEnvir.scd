/*  2 Jul 2023 23:25

*/

//:ok
(dur: 1, freq: 2000).play;
//:error: cannot play event with \br outside a Mediator
(dur: 1, freq: \f.br(2000)).play;
//:error: cannot play event with \br outside a Mediator
(dur: 1, freq: \f.br(2000)) +> \x;
//:OK
{ SinOsc.ar(\f.br(2000), 0, 0.1) }.play;
//:OK
{ SinOsc.ar(\f.br(2000), 0, 0.1) } +> \x;
//:OK
~play = { { SinOsc.ar(4000, 0, 0.01) }.play };
currentEnvironment.envir.play;
//:OK
~play = { { SinOsc.ar(\freq.br(500), 0, 0.01) }.play };
currentEnvironment.envir.play;
//:
currentEnvironment.play({ postln("mediator is" + ~mediator) });
//:
~play = {
	var bus, envir, player, server;
	// server = server.asTarget.server;
	// player = player ?? { currentEnvironment.name };
	// player.postln;
	currentEnvironment.postln;
	currentEnvironment.proto.postln;
	currentEnvironment.parent.postln;
	~mediator.postln;
	// envir = Mediator.at(player);
	// bus = envir.busses.at(this);

};
//:

~play = { "Hello".postln; };
~play = { Synth(\default) };
//:
\default +> \test;
() +> \test;
{ WhiteNoise.ar(0.02).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(500), 0, 0.1).dup } +> \xaderfos;
//:OK
currentEnvironment play: { SinOsc.ar(\freq.br(500), 0, 0.1).dup }
//:OK
e = ();
e[\play] = { { SinOsc.ar(\freq.br(600), 0, 0.1).dup }.play };
e[\mediator] = \default;
e.play;
//:
{ SinOsc.ar(\freq.br(500), 0, 0.1).dup }.play
//:
currentEnvironment play: { SinOsc.ar(\freq.br(500 rrand: 1000), 0, 0.1).dup };
//:
400 rrand: 4000 @>.default \freq;
//
\test.push;
//:
currentEnvironment;