{
	a = SinOsc.ar(\x5.sr.lin(68, 88).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z5.sr > 0.5).lag(1);
} +> \d5;