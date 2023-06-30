// using pinetime data range -1200 - 1200
{
	a = SinOsc.ar(\x7.bamp(0.1, 0.5).linlin(-1200, 1200, 68, 88).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z7.bin > 0.0).lag(1);
} +> \d7;
