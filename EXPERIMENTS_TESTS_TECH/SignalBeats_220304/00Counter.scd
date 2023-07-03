/*  4 Mar 2022 08:49
Play beats coordinating a piece on signal basis.
Trigger samples and other sources from those beats.

Signal-based timing is mudch more accurate and has toticeably
less latency than playing of Patterns, (see esamples in
gd_lhc_220228 folder)
*/
//:
(
{ Out.kr(\beat1.bus, Stepper.kr(Impulse.kr(1 / 0.2).kdsr)) } +> \beat1;
)
//:
(
{ Out.kr(\beat1.bus, Stepper.kr(Impulse.kr(1 / 100000000).kdsr)) } +> \beat1;
)
//:
(
{ WhiteNoise.ar(
	0.05 * Decay.kr(
		Changed.kr(
			\beat1.busIn
		))) } +> \test1;
)
//:
(
{ SinOsc.ar(
	(In.kr(\beat1.index) + 60).midicps,
	0,
	0.05 * Decay.kr(
		Changed.kr(
			\beat1.busIn
		))) } +> \test1;
)
//:
(
{ SinOsc.ar(
	(\beat1.busIn.lag(0.5) + 60).midicps,
	0,
	0.2 * Decay.kr(
		Changed.kr(
			In.kr(\beat1.index)
		))) } +> \test1;
)
//:
(
{ WhiteNoise.ar(Decay.kr(Impulse.kr(1))) } +> \test1;
)
//:
(
{ WhiteNoise.ar(
	0.02 * Decay.kr(Changed.kr(Impulse.kr(1)))) } +> \test1;
)
//:
(
{ WhiteNoise.ar(
	0.02 * Decay.kr(
		Changed.kr(
			Stepper.kr(
				Impulse.kr(2)
			)
		))) } +> \test1;
)
//:
(

)
//:
(
Server.default.scope;