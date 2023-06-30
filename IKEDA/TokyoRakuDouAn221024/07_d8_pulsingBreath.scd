{
	a = GrayNoise.ar(0.1);
	a = SinOsc.ar(\x8.bamp(0.1, 0.5).linexp(0.46, 0.56, 0.2, 27.5)) * a;
	a * (\z8.bin > 0.5).lag(1);
} +> \d8;
