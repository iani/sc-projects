//: 24 Jun 2022 11:31
//:
SynthDef(\click, { | freq |
	Out.ar(0, Ringz.ar(Impulse.ar(0.1), [freq, freq+1], 0.1)
		* Line.ar(\amp.kr(0.5),0,0.1,1,0,2)
	)}
).add;
//:
t = TempoClock(0.5);
u = TempoClock(0.4);
//:
(degree: )
// start two functions at beat zero in each clock.
t.schedAbs(0, { arg beat, sec; Synth(\click, [\freq, 1950]); 1 });
u.schedAbs(0, { arg beat, sec; Synth(\click, [\freq, 350]); 1 });
//:Suggested mode for setting tempo by J. Harkins: 24 Jun 2022 11:22
u.tempo = 5;
u.tempo = 3;
u.tempo = 1;

//:
//: earlier version by T.M. - J. Harkins says to avoid this.
//try this - not working as I expected. Does it work for you?

u.setTempoAtBeat(5, 2);
u.setTempoAtBeat(3, 2)

u.setTempoAtBeat(2, 2)
u.setTempoAtBeat(1, 2)
u.setTempoAtBeat(2, 2)
//