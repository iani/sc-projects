/* 25 Nov 2022 21:57
See OscDataReader, OscDataPlayer


You should have times and messages collected or constructed
as done by OscDataReader, OscDataPlayer.
*/

//:
(
	dur: 1,
	message: messages.pseq(repeats),
	play: {
		var theMessage, x;
		// let;s do something with data in the message array;
		theMessage = ~message;
		// hypothetical case: x is in position 1 of the message
		(freq: theMessage[1].lin(500, 1000), dur: ~dur).play;
	}
)
//:
d = OscDataReader.readLastSaved;
p = OscDataReader.makePlayer;
p.inspect;
m = p.messages;
e = p.makePlayEvent;
e[\dur] = 0.1;
e[\play] = { ~message[2] /* treat this as ... parameter */ }
//:
'/fly' >>>.covid { | msg |
	e[\dur] = msg[2].linlin(0, 255, 0.01, 0.5)
};
//:
m[0]
