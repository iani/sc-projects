/*
TODO:
OSC communication for remote competition
Playing the player's own Synth
Creating an original matrix
Game screen
*/


// Choose a tactic (2nd argument)

~move.(0, 0);	// player X

~move.(1, 0);	// player Y


// Display final score

~final_score.();


// Setup

(
// Matrix M7 (p. 121)
~xmat = [
	[-1, 1, 3, -1, 1, -1],
	[1, -1, -1, -1, 1, -1],
	[3, -1, -3, 5, 1, -3],
	[-1, 3, 3, -1, -1, -1],
	[1, -1, 1, 1, -1, -1],
	[-1, -1, -3, -1, -1, 3],
];
~ymat = ~xmat.flop.neg;
~mat = [~xmat, ~ymat];

~sel = [nil, nil];
~sco = [0, 0];
~total_move = 0;

~move = {|player, tactic|
	var point, opponent, profit, synth;

	opponent = 1 - player; // toggles between 1 and 0

	// Add profit
	~sel[opponent] !? {
		point = ~mat[player][tactic].at(~sel[opponent]);
		~sco[player] = ~sco[player] + point;
	};

	~sel[player] = tactic;
	~total_move = ~total_move + 1;

	// Display the profits as hint in reciprocal
	profit = ~mat[player][tactic].neg;

	(["X", "Y"][player] + "chose" + tactic).postln;
	("score" + ~sco[0] + ":" + ~sco[1]).postln;
	("next player is" + ["X", "Y"][opponent]).postln;
	(["X", "Y"][opponent] ++ "'s profit" + profit).postln;

	synth = [\ev1, \ev2, \ev3, \ev4, \ev5, \ev6][tactic];
	s.sendMsg(\n_free, 100 + player);
	s.sendMsg(\s_new, synth, 100 + player, 0, 0, \bus, player);
};

~final_score = {
	var game_value = ~total_move * 0.07;
	[~sco[0] + game_value, ~sco[1] - game_value].postln;
};

SynthDef(\ev1, {|bus|
	a = Dust.ar(50);
	b = WhiteNoise.ar(1000);
	c = GrainSin.ar(1, a, 0.1, b)/10;
	Out.ar(bus, c);
}).store;

SynthDef(\ev2, {|bus|
	a = Mix.fill(10, {
		LFSaw.ar(1000.rand, 0, 0.1)
	});
	b = LFNoise2.ar(2, 0.1, 0.1);
	c = DelayL.ar(a, 0.2, b);
	Out.ar(bus, c);
}).store;

SynthDef(\ev3, {|bus|
	a = LFNoise0.ar(LFNoise0.ar(1), 20, 30);
	b = LFNoise1.ar(a, 48, 64).midicps;
	c = SinOsc.ar(b)/4;
	Out.ar(bus, c);
}).store;

SynthDef(\ev4, {|bus|
	a = Dust.ar(10);
	b = LFNoise0.ar(700, 800);
	c = Mix.fill(8, {|i|
		d = PulseDivider.ar(a, 8, i);
		e = EnvGen.ar(Env.perc(0, 0.1), d);
		f = Latch.ar(b, d);
		PMOsc.ar(f, f*2.5, e**2, 0, e/4);
	});
	Out.ar(bus, c);
}).store;

SynthDef(\ev5, {|bus|
	a = LFNoise1.ar(1, 3, 4);
	b = SinOsc.ar(a);
	c = BrownNoise.ar(b)/3;
	Out.ar(bus, c);
}).store;

SynthDef(\ev6, {|bus|
	a = SinOsc.ar(55)/4;
	Out.ar(bus, a);
}).store;
)