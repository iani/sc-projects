// using pinetime data range -1200 - 1200
{
	a = SinOsc.ar(\x8.bamp(0.1, 0.5).linlin(-1200.0, 1200.0, 36, 48).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * \amp.kr(5) * (\z8.bin > 0.0).lag(1);
} +> \d8;
