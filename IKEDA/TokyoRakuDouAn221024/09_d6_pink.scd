
{
	a = PinkNoise.ar;
	a = BPF.ar(a, \x6.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps, 0.2);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z6.bin > 0.5).lag(1);
} +> \d6
