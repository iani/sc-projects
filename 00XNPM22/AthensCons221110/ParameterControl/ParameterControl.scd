/* 19 Sep 2022 16:33

*/
// For 06d_slope_ota8.scd  !!!!!
(key: 40) ++> \ota8;
//:
(key: 80) ++> \ota8;
//:
~test = {
	loop {
		(key: (80.rand + 40).postln) ++> \ota8;
		1.wait;
	}
}.fork;
//:
(amp: 0.05) ++> \ota8;
//:
~test.stop;
// For 08d_slope_ota8.scd  !!!!!
(root: 40) ++> \ota8;
//:
(root: 80) ++> \ota8;
//:
~test = {
	loop {
		(root: (80.rand + 40).postln) ++> \ota8;
		1.wait;
	}
}.fork;
//:
~test.stop;
// For 06d_slope_ota8.scd  !!!!!
(key: 40) ++> \mandila4;
(root: 40) ++> \mandila4;
(itv: 120) ++> \mandila4;
//:
(key: 180) ++> \mandila4;
//:
~test = {
	loop {
		(root: (80.rand + 40).postln) ++> \mandila4;
		0.1.wait;
	}
}.fork;
//:
~test = {
	var stream = Pbrown(20, 100, 1).asStream;
	loop {
		(key: stream.next) ++> \mandila3_4;
		0.01.wait;
	}
}.fork;
//:
~test.stop;

//:
(amp: .15) ++> \mandila3_4;
(mul: 25) ++> \mandila4;
(amp: 5.15) ++> \mandila4;

(key: 100) ++> \mandila3_4;

(div: 50) ++> \mandila3_4;
