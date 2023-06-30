/* 21 Nov 2022 17:47
Ping - Pong reply mechanism.

2 Players wait to respond to each other.
When player ping plays, it wait until it receives an answer from pong, and v.v.

This is done by setting the bus "ping".
When bus ping is 1, it is player ping's turn.  When it is 0, it is pong's turn.
Players ping and pong play in their own environments, and share bus ping
whih is stored in default global bus environment 'sensors'.

IMPORTANT: MapFunc must be coded to accept the custom osc message sent by ZigSim.
Each device sends a different device-id as message. This is used to
distinguish which device the message comes from (it takes the place of
ID number sent by minibee or pinetime devices.)


*/
//:Create the bus holding the turn-status value.
// 1 for ping player's turn, 0 for pong player's turn.
1 @>.sensors \pingpong;
//:Ping player's trigger
{
	var thresh;
	thresh = (\pingphone.sr > 0.8) * \pingpong.sr;
	SendReply.kr(thresh, '/ping');
	thresh.lag(1.5) * 0.5;
} @>.ping \amp;
//:Pong player's trigger
{
	var thresh;
	thresh = (\pingphone.sr > 0.8) * [1 - \pingpong.sr];
	SendReply.kr(thresh, '/pong');
	thresh.lag(1.5) * 0.5;
} @>.pong \amp;
//:Toggle value of ping bus when receiving triggers
// from ping and pong.
'/ping' >>>.pingpong { 0 @>.sensors \pingpong; };
'/pong' >>>.pingpong { 1 @>.sensors \pingpong; };
//:============================================
//:running a simulation with synthetic sensor input
//:simulate ping's phone.
1 @>.sensors \pingpong;
{ LFSaw.kr(1) } @>.sensors \pingphone;
//:Try trigger without the pingpong switch:
{ (\pingphone.sr > 0.8).lag(1.5) * 0.15 } @>.ping \amp;
//:Add the pingpong switch:
// Note this version needs a Delay because the
// pingpong bus silences the trig signal immediately after
// it is set, thereby silencing also the amp.
// TO TEST: This can be avoided by using an envelope instead of lag.
{
	var trig;
	trig = \pingpong.sr * \pingphone.sr > 0.8;
	// SendReply.kr(Impulse.kr(1), '/ping');
	SendReply.kr(DelayC.kr(trig, 1), '/ping');
	trig.lag(1.5) * 0.15
} @>.ping \amp;
//:
{
	var trig;
	trig = \pingpong.sr * \pingphone.sr > 0.8;
	SendReply.kr(trig, '/ping');
	Env.perc.kr(gate: trig) * 0.05;
} @>.ping \amp;

//:Sonify pingphone - without the pingpong switch:
{  PinkNoise.ar(\amp.br(0.1)).dup } +> \ping;
//:
'/ping' >>>.pingpong {
	"ping played by PING".postln;
	0 @>.sensors \pingpong;
};
//:
'/pong' >>>.pingpong {
	"ping played by PONG".postln;
	1 @>.sensors \pingpong;
};
//:Reset the ping gate manually.
1 @>.sensors \pingpong;
//:===================================
//:Now the pong part
{
	var trig;
	trig = [1 - \pingpong.sr] * \pingphone.sr > 0.8;
	SendReply.kr(trig, '/pong');
	Env.perc.kr(gate: trig) * 0.05;
} @>.pong \amp;
//:
{  PinkNoise.ar(\amp.br(0.1)).dup } +> \pong;
//:
OSC.trace;
OSC.untrace;
//:===================================
//:Redo. Put everything together
// Use different tones to distinguish ping and pong
1 @>.sensors \pingpong; // initialize gate bus
{ LFSaw.kr(21/20) } @>.sensors \pingphone; // simulate input
{ LFSaw.kr(22/30) } @>.sensors \pongphone; // simulate input
//:alternative input simulation
{ Impulse.kr(2/1) } @>.sensors \pingphone; // simulate input
{ Impulse.kr(3/2) } @>.sensors \pongphone; // simulate input
//:sound production and exchange of ball
{
	var trig;
	trig = \pingpong.sr * \pingphone.sr > 0.8;
	SendReply.kr(trig, '/ping');
	Env.perc.kr(gate: trig) * 0.05;
} @>.ping \amp;

{  SinOsc.ar(\freq.br(440), 0, \amp.br(0.1)).dup } +> \ping;

'/ping' >>>.pingpong {
	"ping played by PING".postln;
	0 @>.sensors \pingpong;
};

'/pong' >>>.pingpong {
	"ping played by PONG".postln;
	1 @>.sensors \pingpong;
};
{
	var trig;
	trig = [1 - \pingpong.sr] * \pongphone.sr > 0.8;
	SendReply.kr(trig, '/pong');
	Env.perc.kr(gate: trig) * 0.05;
} @>.pong \amp;

{  SinOsc.ar(\freq.br(440 * 5 / 4), 0, \amp.br(0.1)).dup } +> \pong;
