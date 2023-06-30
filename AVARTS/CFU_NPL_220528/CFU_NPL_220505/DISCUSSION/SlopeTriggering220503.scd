/*  3 May 2022 16:51

*/
//:
{

	WhiteNoise.ar(0.1) *
	Decay.kr(
		Changed.kr(
			// \z1.bamp.linlin(0.46, 0.56, 0, 10).round(1)
			MouseX.kr(0, 10).round(1);
		)
	)

} +> \slopeTrigger;
//:
{
	// ??????? need to test....
	WhiteNoise.ar(0.1) *
	Slope.kr(
		// \z1.bamp
		Lag.kr(MouseX.kr(0, 1), 0.5)
	).max(0.1).min(0.4)
} +> \slopeTESTING;
//:
{ Out.kr(0,
	Slope.kr(
		// \z1.bamp
		MouseX.kr(0, 100);
	))
} +> \test;