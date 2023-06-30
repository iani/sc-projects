{
	a = PinkNoise.ar(0.1);
	a = SinOsc.ar(\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10)) * a;
	a * (\z4.bin > 0.5).lag(1);
} +> \mandila4;
