//: 22 Jun 2022 07:49
{
	var t;
	t = TempoClock.default;
	21 do: {
		t.timeToNextBeat.round(0.000000001).postln;
		0.1.wait;
	}
}.fork(TempoClock.default, 1);