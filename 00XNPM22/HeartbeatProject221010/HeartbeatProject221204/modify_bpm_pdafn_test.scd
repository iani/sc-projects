/*  6 Dec 2022 23:10
Using Pdefn to modify bpm in the running pattern from osc;
*/
//:corrected click synthdef - to prevent node not found
SynthDef(\click, { | freq=50, amp = 1 |
	Fader();
	(
		Ringz.ar(Impulse.ar(0.1), [freq, freq+1], 0.1)
		* Line.ar(amp,0,0.1,1,0,0)
	).out;
}).load;
//:
\click +> \test;
\click2 +> \test;
//:
(instrument: \click,
dur: (60 / Pdefn(\bpm, 60)) *
[1, [0.5, 0.5].pseq(1), [0.25, 0.25, 0.25, 0.25].pseq(1)
].prand,
degree: (-10..10).prand)
+> \heartland;
//:
Pdefn(\bpm, 160);
//:
'/bpm_test' >>>.heartland { | n, msg, t, a |
		// postln("the address is???" + a);
	postln("BPM received from ECG: " + msg[1] + "! Setting Beat duration to: " + (60 / msg[1]));
	Pdefn(\bpm, msg[1]);
	if (a.port == 57120) { OscGroups.send(msg); };
};
//:
['/bpm_test', 71].sim;
//:
["/HR_BPM", 200].sim;
//:
//:
Pdefn(\bpm, 160);
//:
