{
	a = LFPulse.ar(\x7.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps)/20;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a = CombN.ar(a, 0.1, 1/250, 0.5);
	a * (\z7.bin > 0.5).lag(1);
} +> \ota7;
