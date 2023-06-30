{
	a = GrayNoise.ar(0.1);
	a = SinOsc.ar(\x7.bamp(0.1, 0.5).linexp(-1200.0, 1200.0, 0.2, 27.5)) * a;
	a * (\z7.bin > 0.0).lag(1);
} +> \d7;
