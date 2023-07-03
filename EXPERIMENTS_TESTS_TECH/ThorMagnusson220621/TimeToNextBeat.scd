//: 22 Jun 2022 07:49
{
	var t;
	t = TempoClock.default;
	21 do: {
		//  t.timeToNextBeat.round(0.000000001).postln;
		  t.timeToNextBeat.postln;
		0.1.wait;
	}
}.fork(TempoClock.default, 1);
//:
SynthDef(\click, {arg freq=50; Out.ar(0, Ringz.ar(Impulse.ar(0.1), [freq, freq+1], 0.1) * Line.ar(1,0,0.1,1,0,2))}).add;

//:

// get elapsed time, round up to next second
v = Main.elapsedTime.ceil;

// create two clocks in a 5:2 relation, starting at time v.
t = TempoClock(1, 0, v);
u = TempoClock(0.4, 0, v);

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