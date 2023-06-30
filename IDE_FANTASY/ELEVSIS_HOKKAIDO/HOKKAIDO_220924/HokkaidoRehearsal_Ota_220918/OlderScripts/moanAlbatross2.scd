{
	a = SinOsc.ar(\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 68, 88).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z4.bin > 0.5).lag(1);
} +> \albatross
