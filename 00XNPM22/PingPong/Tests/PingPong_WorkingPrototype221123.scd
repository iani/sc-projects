/* 22 Nov 2022 23:47
First working test
*/
//:===================================
//:Redo. Put everything together
// Use different tones to distinguish ping and pong
1 @>.sensors \pingpong; // initialize gate bus
//:
0 @>.sensors \pingpong;
//:Input simulation - this should be replaced by input from iphones
{ LFSaw.kr(5 / 5) } @>.sensors \pingphone; // simulate input
{ LFSaw.kr(4 / 5) } @>.sensors \pongphone; // simulate input
//:
{ \x20.sr } @>.sensors \pingphone;
{ \x21.sr } @>.sensors \pongphone;
//:Test of data reception only.
{
	SinOsc.ar(\pingphone.sr.lin(400, 4000).lag(0.2), 0, 0.1).dup
} +> \test;
//:Test of data reception only.
{
	SinOsc.ar(400, 0, \pingphone.sr > 0.8).dup
} +> \test;
//:
\test.stop;
//:
{
	var trig;
	trig = \pingpong.sr * \pingphone.sr > 0.8;
	SendReply.kr(trig, '/ping');
	Env.perc.kr(gate: trig) * 0.05;
} @>.ping \amp;
//:
{  SinOsc.ar(\freq.br(440), 0, \amp.br(0.1)).dup } +> \ping;
//:
'/ping' >>>.pingpong {
	"ping played by PING".postln;
	0 @>.sensors \pingpong;
};
//:
OSC.trace1('/ping');
//:
OSC.untrace;
//:
'/pong' >>>.pingpong {
	"ping played by PONG".postln;
	1 @>.sensors \pingpong;
};
//:
{
	var trig;
	trig = [1 - \pingpong.sr] * \pongphone.sr > 0.8;
	SendReply.kr(trig, '/pong');
	Env.perc.kr(gate: trig) * 0.05;
} @>.pong \amp;

{  SinOsc.ar(\freq.br(440 * 5 / 4), 0, \amp.br(0.1)).dup } +> \pong;
