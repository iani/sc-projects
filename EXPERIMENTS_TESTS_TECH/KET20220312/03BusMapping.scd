/* 12 Mar 2022 12:08
Familiarize with mapping busses to the control parameters of a synth.
Use kr functions to process bus input and send the result to the buses
used as control inputs of an audio synth.
*/
//:
{ SinOsc.ar(\freq.ar(440), 0, 0.1).dup } +> \test;
//:
\freq <@.test \myfreq2;
//:
\freq <@.test \myfreq2;
//:
\x1.bus.set(0.71);
//:
{
	Out.kr(\myfreq.bus.index,
		In.kr(\x1.bus.index).linlin(0, 1, 400, 1200).bout(\myfreq2)
	);
} +> \myfreq;