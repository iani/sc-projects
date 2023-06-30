{
	a = SinOsc.ar(\x5.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * \amp.kr(5) * (\z5.bin > 0.5).lag(1);
} +> \d5;
