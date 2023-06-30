/*  5 Mar 2022 09:25

Use Dbufrd to filter out some Impulses.
Explanation:

The impulse pattern produced by Impulse.kr(rate) is:

[1, 1, 1, 1, 1, 1, 1, 1 .... ]

Multiply the above with amplitudes produced by Pbufrd on a buffer containing:

[1, 1, 0, 1, 0, 0]

The resulting triggers will be

[1, 1, -, 1, -, -]

I. e. the 0 should cancel out the impulses, leaving only those impulses where the
Dbufrd buffer has 1 values.

*/

//:The impulse beats without filtering:
{
	var beat;
	beat = Impulse.kr(5);
	WhiteNoise.ar(0.1).dup
	* Decay.kr(beat, 0.05, 0.1);
} +> \test;
//: Store a beat pattern
[1, 1, 0, 1, 0, 1] @> \beats;
//:The impulse beats without filtering:
{
	var beat, beatfilter, filteredbeats;
	beat = Impulse.kr(5);
	beatfilter = Demand.kr(beat, 0, Dbufrd(\beats.buf, Dseq((0..5), inf)));
	filteredbeats = beat * beatfilter;
	WhiteNoise.ar(0.1).dup
	* Decay.kr(filteredbeats, 0.05, 0.1)
	//	* beatfilter;
} +> \test;
//: use the filtered beats to get values from a Demand ugen
{
	var beat, beatfilter, filteredbeats, freq;
	beat = Impulse.kr(10);
	beatfilter = Demand.kr(beat, 0, Dbufrd(\beats.buf, Dseq((0..5), inf)));
	filteredbeats = beat * beatfilter;
	// freq = 440;
	freq = Demand.kr(filteredbeats, 0, Dseq(4*[20, 22, 23, 25, 27, 31, 32].midicps, inf));
	SinOsc.ar(freq * [1, 1.5, 2, 2.5], 0, 0.1).mix.dup
	* filteredbeats.perctr(0.001, 0.08)
	// * Decay.kr(filteredbeats, 0.1, 0.9)
	//	* beatfilter;
} +> \test;
//: Use Dseries instead of Dseq
{
	var beat, beatfilter, filteredbeats, freq;
	beat = Impulse.kr(5);
	beatfilter = Demand.kr(beat, 0, Dbufrd(\beats.buf, Dseries(0, 1, inf)));
	filteredbeats = beat * beatfilter;
	// freq = 440;
	freq = Demand.kr(filteredbeats, 0, Drand(16*[15, 20, 22, 23, 25, 27, 31, 32].midicps, inf));
	SinOsc.ar(freq * [1, 1.5, 2, 2.5], 0, 0.1).mix.dup
	* filteredbeats.perctr(0.001, 0.08)
	// * Decay.kr(filteredbeats, 0.1, 0.9)
	// so
	//	* beatfilter;
} +> \test;
//: try a different beat patterns
[1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0] @> \beats;
([1, 0, 0, 0, 0, 0] ++ ({ 1 } ! 10) ++ [1, 0, 1].dup(10).flat).flat @> \beats;
([0, 0, 0, 1, 1, 0].dup(5) ++ ({ 1 } ! 20) ++ [1, 0, 1].dup(10).flat).flat @> \beats;

//: try the above with new shortcut method trigFilter
{
	var filteredbeats, freq;
	filteredbeats = \beats.trigFilter(Impulse.kr(10));
	freq = Demand.kr(filteredbeats, 0, Drand(16*[15, 20, 22, 23, 25, 27, 31, 32].midicps, inf));
	SinOsc.ar(freq * [1, 1.5, 2, 2.5], 0, 0.1).mix.dup
	* filteredbeats.perctr(0.001, 0.08)
} +> \test;