
Server.default.waitForBoot({
	{
		loop {
			\default +> \test;
			3.wait;
			{ WhiteNoise.ar(0.1).dup } +> \test;
			3.wait;
			(degree: [0, 2, 4].prand, dur: 0.15) +> \test;
			3.wait;
		}
	}.fork;
});