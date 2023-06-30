{
	a = SinOsc.ar(
	\freq.br(400), 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * \amp.br(0.1);
} +> \d1;
