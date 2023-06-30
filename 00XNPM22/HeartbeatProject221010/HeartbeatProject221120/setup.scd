/* 20 Nov 2022 10:45

- Load the synthdef for the sound to the server.
- Start a pattern playing clicks at 60 bpm
- Listen to incoming OSC messages of form: ['/HR_BPM', bpm]
- At each message, set the duration of the pattern to 60/bpm.

*/

Server.default.options.outDevice_("MME : Speakers (Generic USB Audio Dev");

Server.default.waitForBoot({
	"Loading click synthdef".postln;
	SynthDef(\click, { | freq=50, amp = 1.0 |
		Out.ar(0, Ringz.ar(Impulse.ar(0.1), [freq, freq+1], 0.1) * Line.ar(amp,0,0.1,1,0,2))}
	).load;
	Server.default.sync;
	(instrument: \click, dur: (60/60)) +> \heartland;
	// ("/HR_BPM", BPM)
	'/HR_BPM' >>>.heartland { | n, msg |
		post("BPM received from ECG: " + msg[1] + "! Setting Beat duration to: ");
		(60 / msg[1]).postln;
		(dur: (60 / msg[1]).postln)
		(instrument: \click,
			dur: (60 / msg[1]) *
			[1, [0.5, 0.5].pseq(1), [0.25, 0.25, 0.25, 0.25].pseq(1),
				[1/8].pseq(8)
			].prand,
			degree: (-10..10).prand) ++> \heartland
	}
});