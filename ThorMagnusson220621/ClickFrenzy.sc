/* 21 Jun 2022 09:51

*/


s.boot
// Event
a = EventStream.new(())

SynthDef(\click, {arg freq=50; Out.ar(0, Ringz.ar(Impulse.ar(0.1), [freq, freq+1], 0.1) * Line.ar(1,0,0.1,1,0,2))}).add


a = ().asEventStream
a.start

a.addEvent(().put(\dur, 0.2))

a.addEvent(().put(\instrument,\click))
a.addEvent(().put(\note, Pseq([1,2,3],inf)))

a.addEvent(().put(\note, Pseq([11,22,33],inf)))


b = ().asEventStream
b.start
b.stop
b.addEvent(().put(\dur, 0.2))

b.addEvent(().put(\instrument,\click))
b.addEvent(().put(\note, Pseq([1,2,3]*8,inf)))

a.addEvent(().put(\note, Pseq([11,22,33],inf)))


{100.do({100.rand.postln; 0.1.wait})}.


{
	100.do({
	Synth(\click, [\freq, 2199]);
	0.4.wait;
	});
}.fork(TempoClock.default, 2)
