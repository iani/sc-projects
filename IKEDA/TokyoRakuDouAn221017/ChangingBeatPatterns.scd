/* 20 Oct 2022 00:17

*/
//:
~seq = [1, 1, 0, 1, 1, 1, 0];
c = Buffer.alloc(Server.default, ~seq.size, 1);
c.setn(0, ~seq);
//:
{ WhiteNoise.ar(Decay.kr(\tduty.bin)).dup * 0.1 } +> \test;
//:
{ 
	var trig, size;
	size = ~seq.size;
	trig = Impulse.kr(10);
	trig * Demand.kr(trig, 1,
		Dbufrd(c, Dseries(0, 1, inf))
		// 1
	)
} @> \tduty;
//: changing the rhythm pattern by writing into the buffer
c.set(5, 0);
//:
c.setn(0, [0, 0, 0, 0, 0, 0, 0])
//:
c.setn(0, [0, 0, 0, 1, 0, 0, 0])
//:
c.setn(0, [1, 0, 1, 1, 0, 1, 0])
//:
c.setn(0, [1, 0, 1, 1, 1, 1, 0])
//:
c.setn(0, [1, 1, 1, 1, 1, 1, 0])
//:*
c.set(~seq.size.rand, [0, 1].choose);
0.1.wait;
//:
{
	loop {
		c.setn(0, [1, 1, 1, 0, 0, 0, 1].scramble);
		5.wait;
	}
}.fork;
//:=========== Prototypes for sending buffer + for updating contents =======
//: 1. Create and send the buffer and create a new playing synth after it has loaded.
~bufname = \testbuf;
{
	var beats, buf, bufname = ~bufname; // localize bufname for synth
	// beats = [1, 1, 0, 1, 1, 1, 0];
	beats = [1, 0, 0, 1, 0, 1];
	buf = Buffer.alloc(Server.default, beats.size, 1);
	// bufname >>> { | n, mess | [mess[3], beats[mess[3].asInteger]].postln; };
	Server.default.sync;
	buf.setn(0, beats);
	Server.default.sync;
	bufname storebuf: buf;
	{ // bufname must be local variable in here because of @> 
		var trig, size, counter;
		size = beats.size;
		trig = Impulse.kr(\rate.kr(2.5));
		counter = Stepper.kr(trig, 0, 0, size - 1, 1);
		SendReply.kr(trig, bufname.asOscMessage, counter);
		trig * Demand.kr(trig, 1,
			Dbufrd(buf, Dseries(0, 1, inf))
		)
	} @> bufname;
	{ WhiteNoise.ar(Decay.kr(bufname.bin)).dup * 0.1 } +> \test;
}.fork;
//:

//: 2. Modify the buffer in sync with a synth playing it.
// Send full new beat array just after the last beat has been played.
//: Here confirming that at the last beat the count is == 0.0
~bufname >>>.indextest { | n, m |
	var i;
	i = m[3];
	post("INDEX RECEIVED IS:" + i + "Value of beat is: ");
	~bufname.buf.get((i - 1).asInteger % ~bufname.buf.numFrames, { | x | x.postln });
};

//:Writing a prototype that will send the new array after the last beat:
~f = { | beats, bufname |
	bufname >>>.updatebeats { | n, m |
		if (m[3] == 0.0) {
			beats !? {
				postln("sending to buffer" + bufname + "these beats:" + beats);
				bufname.buf.setn(0, beats);
				beats = nil;
			};
		}
	}
};
//:
/*
API:
[beats] +@>.message bufname;
message defaults to bufname;


*/
//:
~f.([1, 0, 0, 1, 1, 1], ~bufname);
~f.([1, 0, 1, 0, 1, 1], ~bufname);
~f.([1, 0, 0, 1, 0, 1].scramble, ~bufname);
~f.([1, 1, 1, 1, 1, 1], ~bufname);
~f.([0, 0, 0, 1, 1, 1], ~bufname);
~f.([0, 1, 0, 1, 1, 1], ~bufname);
~f.({ 2.rand } ! 6, ~bufname);
//:
(rate: 15) +@> ~bufname;
//:
currentEnvironment;
//:
\busses.push;
//:
[] respondsTo: '++>';