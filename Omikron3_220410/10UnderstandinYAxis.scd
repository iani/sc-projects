{
	SinOsc.ar(\z1.bin.linlin(0.485, 0.51, 400, 2000), 0, 0.1).dup
	// * (\z1.bin < 0.5)
} +> \test