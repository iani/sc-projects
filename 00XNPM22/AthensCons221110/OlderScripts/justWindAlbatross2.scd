{
	a = PinkNoise.ar;
	a = BPF.ar(a, \x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 56, 76).midicps, 0.1);
	a = Pan2.ar(a, SinOsc.ar(4.5));
	a * (\z4.bin > 0.5).lag(1);
} +> \albatross
