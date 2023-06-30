{
	a = GrayNoise.ar(0.01);
	a = SinOsc.ar(\x1.bamp(0.1, 0.5).linexp(0.46, 0.56, 0.2, 27.5)) * a;
	a * (\z1.bin > 0.5).lag(1);
} +> \d1;
