{
	a = GrayNoise.ar(0.01 * \amp.kr(1));
	a = SinOsc.ar(\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.25, 25)) * a;
	a * (\z4.bin > 0.5).lag(1);
} +> \mandila4;
