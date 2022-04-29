/* 28 Apr 2022 23:01

=========== 1 ===========
100 * 3, 2, 4, 5

=========== 2 ===========
50 * 6, 15, 16, 10

=========== 3 ===========
10 * 23, 22, 24, 25

*/

Server.default.waitForBoot({
	var fbus, chord1, chord2, chord3;
	fbus = [\tR, \tL, \nR, \nL] collect: _.bus;
	chord1 = 100 * [3, 2, 4, 5];
	[fbus, chord1].flop do: { | bf |
		bf[0] set: bf[1]
	};
	{ SinOsc.ar(\tR.bin, 0, 0.1).dup } +> \tasosR;
	{ SinOsc.ar(\tL.bin, 0, 0.1).dup } +> \tasosR;
	{ SinOsc.ar(\nR.bin, 0, 0.1).dup } +> \tasosR;
	{ SinOsc.ar(\nL.bin, 0, 0.1).dup } +> \tasosR;


});