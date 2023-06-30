/*  1 Dec 2022 11:27

*/
"Setting up actions from this script".postln;
// Mediator.at(\pingpongActions) use: {
// 	~startSound = { "starting sounds".postln; };
// 	~stopSound = { "stopping sounds".postln; };
// };

\pingpongActions !!>.startSound {
	"starting sounds".postln;
//  : sound sources
//  note: we keep these silent, and use notifier actions to play the
//  sound instead. This is easier to live code.
//  see script customizeSound.scd
	{ SinOsc.ar(440).dup * \amp.br(0) * 0 } +> \ping;
	{ SinOsc.ar(440 * 5 /4).dup * \amp.br(0) * 0 } +> \pong;
//  : control sources
	// dialog filtering gate signal
	1 @>.sensors \pingpong; // ping takes the ball

	// envelope making control synths
	{
		var trig, remoteTrig;
		trig = \pingpong.sr * \pingTrig.tr;
		remoteTrig = \remoteTrig.tr;
		SendReply.kr(trig, '/ping', 1);
		Env.perc.kr(gate: trig + remoteTrig) * 0.1;
	} @>.ping \amp;

	\ping >>> { | n, m, t, a |
		"ball from ping received".postln;
		0 @>.sensors \pingpong;
		1 @>.sensors \pingpong2;
		\pingpong changed: \pongIsOn;
		if (a.port == 57110) { // if received from local, then broadcast
			OscGroups.send('/ping');
		}{ // trigger sound from remote:
			(remoteTrig: 1) ++>.pong \amp;
		};
		// a.port.postln;
	};

	{
		var trig, remoteTrig;
		// trig = [1 - \pingpong.sr] * \pongTrig.tr;
		trig = \pingpong2.sr * \pongTrig.tr;
		remoteTrig = \remoteTrig.tr;
		SendReply.kr(trig, '/pong', 1);
		Env.perc.kr(gate: trig + remoteTrig) * 0.1;
	} @>.pong \amp;

	\pong >>> { | n, m, t, a |
		"ball from pong received".postln;
		// 1 @>.sensors \pingpong;
		1 @>.sensors \pingpong;
		0 @>.sensors \pingpong2;
		\pingpong changed: \pingIsOn;
		if (a.port == 57110) { // if received from local, then broadcast
			OscGroups.send('/pong');
		}{ // trigger sound from remote:
			(remoteTrig: 1) ++>.ping \amp;
		}
	};
};
//:
\pingpongActions !!>.stopSound {
	"stopping sounds".postln;
	\ping.stop;
	\pong.stop;
};
//:
\pingpongActions !!>.trigPing {
	(pingTrig: 1) ++>.ping \amp;
	// "testing!".postln;
};
//:
\pingpongActions !!>.trigPong {
	(pongTrig: 1) ++>.pong \amp;
};
//:Initialize state:
{
	1 @>.sensors \pingpong;
	\pingpong changed: \pingIsOn;
}.defer(1.0); // leave time for gui even on slow systems