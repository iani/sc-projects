/* 27 Apr 2022 14:41
Test for camera control

Testing sensor 5

z 5 < 0.5 : send 0
z 5 >= 0.5 : send 1
*/
//:
OSC.trace;
//:
OSC.untrace;
//:
// Data from sensor 5 (Isobe)
// Format:
// []
// Data from sensor 6 (Isobe)
// Format:
// [brigtness 0.00008 - 0.95, empty, empty, empty, x, y, z]
// ranges of x y z are same as on iani mac sensestage setup
SenseData().put(6, { | ... args |
	// postln("received: again" + args);
	// args[4].postln;
	var x, y;
	x = args[4];
	y = args[6];
	case
	{ x < 0.51} {
		"x down".postln;
		(degree: 2).play;
	}
	{ x > 0.52 } {
		"x up".postln;
		(degree: -3).play;
	}
	{ "x center".postln;
		().play;
-3};

	// if (args[4] < 0.51) { "x up".postln; } { "x down".postln };
	// if (args[4] < 0.51) { "x up".postln; } { "x down".postln };
	// if (args[6] < 0.5) { "z right".postln; } { "z left".postln };
	// if (args[6] < 0.5) { "z right".postln; } { "z left".postln };
	// if (args[6] < 0.5) { "z right".postln; } { "z left".postln };
})
//: