{
	a = LFPulse.ar(\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps)/20;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a = CombN.ar(a, 0.1, 1/250, 0.5);
	a * (\z4.bin > 0.5).lag(1);
} +> \mandila4;
