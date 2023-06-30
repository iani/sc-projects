/* 30 Nov 2022 22:20
This first draft does not use input from sensors.
The next version will do that.

*/
// { SinOsc.ar(400, 0, 0.1) * \amp.br(0) } +> \ping;
{ [0, SinOsc.ar(600, 0, 0.1) *
	Env.perc.gate(\amp.br(0))] } +> \pong;
{ SinOsc.ar(400, 0, 0.1) *
	Env.perc.gate(\amp.br(0))
} +> \ping;
{ \pingpong.sr.gt(0) * 0.1 } @>.ping \amp;
{ (1 - \pingpong.sr.gt(0)) * 0.1 } @>.pong \amp;
//:================================================================
//:new amp control synth - produces the env and sets pingpong
{
	var trig;
	trig = \pingpong.sr * \pingphone.sr > 0.8;
	SendReply.kr(trig, '/ping');
	Env.perc.kr(gate: trig) * 0.05;
} @>.ping \amp;
// this here sets the pingpong when triggered by the control synth
'/ping' >>>.pingpong {
	"ping played by PING".postln;
	0 @>.sensors \pingpong;
};
//:Trigger ping phone manually: try step by step.
//:silence pong for clarity:
\pong.stop;
//: untrigger pingphone
0 @>.sensors \pingphone;
//: enable ping's triggering gate
1 @>.sensors \pingpong;
//: trigger pingphone
1 @>.sensors \pingphone;
//:cannot retrigger - until enabled by ping:
1 @>.sensors \pingphone; // no sound until enabled by ping.
//:
1 @>.sensors \pingphone;
//:
1 @>.sensors \pingpong;
//:do pong like ping
{
	var trig;
	trig = [1 - \pingpong.sr] * \pongphone.sr > 0.8;
	SendReply.kr(trig, '/pong');
	Env.perc.kr(gate: trig) * 0.05;
} @>.ping \amp;
// this here sets the pingpong when triggered by the control synth
'/pong' >>>.pingpong {
	"ping played by PING".postln;
	1 @>.sensors \pingpong;
};
//: untrigger pongphone
0 @>.sensors \pongphone;
//: enable pong's triggering gate
0 @>.sensors \pingpong;
//: trigger pongphone
1 @>.sensors \pongphone;
//:cannot retrigger - until enabled by ping:
0 @>.sensors \pongphone; // no sound until enabled by ping.
//:
1 @>.sensors \pingphone;
//:
1 @>.sensors \pingpong;