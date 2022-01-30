/*
TODO:
OSC communication for remote competition
Playing the player's own Synth
Creating an original matrix
Game screen
*/
//: ====== SETUP ======

// Initialize

(
//: Matrix M7 (p. 121)
~xmat = [
	[-1,	1,	3,	-1,	1,	-1],
	[1,	-1,	-1,	-1,	1,	-1],
	[3,	-1,	-3,	5,	1,	-3],
	[-1,	3,	3,	-1,	-1,	-1],
	[1,	-1,	1,	1,	-1,	-1],
	[-1,	-1,	-3,	-1,	-1,	3],
];

~ymat = ~xmat.flop.neg;
//:
~xmat do: _.postln;
~ymat do: _.postln;

~mat = [~xmat, ~ymat];

~sel = [nil, nil];
~sco = [0, 0];
~total_move = 0;

~move = {|player, tactic|
	var point, opponent, profit, synth;

	opponent = 1 - player; // toggles between 1 and 0

	// Add profit
	~sel[opponent] !? {
		point = ~mat[player][opponent][tactic];
		~sco[player] = ~sco[player] + point;
	};

	~sel[player] = tactic;
	~total_move = ~total_move + 1;

	// Display the profits as hint, Player Y's in reciprocal
	if (player == 0) {
		profit = ~mat[player][tactic] rowAt(tactic).neg;
	} {
		profit = ~mat.colAt(tactic);
	};

	(["X", "Y"][player] + "chose" + tactic).postln;
	("score" + ~sco[0] + ":" + ~sco[1]).postln;
	("next player is" + ["X", "Y"][opponent]).postln;
	("profit" + profit).postln;

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
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev2, {|bus|
	a = Mix.fill(10, {
		LFSaw.ar(1000.rand, 0, 0.1)
	});
	b = LFNoise2.ar(2, 0.1, 0.1);
	c = DelayL.ar(a, 0.2, b);
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev3, {|bus|
	a = LFNoise0.ar(LFNoise0.ar(1), 20, 30);
	b = LFNoise1.ar(a, 48, 64).midicps;
	c = SinOsc.ar(b)/4;
	Out.ar(bus, c.adsr);
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
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev5, {|bus|
	a = LFNoise1.ar(1, 3, 4);
	b = SinOsc.ar(a);
	c = BrownNoise.ar(b)/3;
	Out.ar(bus, c.adsr);
}).store;

SynthDef(\ev6, {|bus|
	a = SinOsc.ar(55)/4;
	Out.ar(bus, a.adsr);
}).store;
)
// ================================================================
// ================ TESTS ================
//: ================ Test synthdefs ================
// one by one
~synth = Synth(\ev1);
~synth.free;
//:
{
	((1..6) collect: format("ev%", _)) do: { | ev |
		var synth;
		postf("Starting synthdef: % ...\n", ev);
		synth = Synth(ev);
		5.wait;
		postf("Freeing synthdef: % \n", ev);
		synth.free;
		0.5.wait;
	};
	"\n\n===== DONE. Tested ev1-6. ======\n\n".postln;
}.fork;
//: Redoing the above with +> (sc-hacks-redux)
{
	((1..6) collect: { | i | format("ev%", i).asSymbol }) do: { | ev |
		postf("Starting synthdef: % ...\n", ev);
		ev +> \test;
		5.wait;
		postf("Freeing synthdef: % \n", ev);
		\test.stop;
		0.9.wait;
	};
	"\n\n===== DONE. Tested ev1-6. ======\n\n".postln;
}.fork;

//:all synthdefs in a loop
{
	[\ev1, \ev2, \ev3, \ev4, \ev5, \ev6] do: { | ev |
		var synth;
		postf("testing synthdef: % for 10 seconds...\n", ev);
		synth = Synth(ev);
		10.wait;
		synth.free;
		0.5.wait;
	};
	"Synthdef tests completed".postln;
}.fork;

a = Synth(\ev1);
//:
a.free;
//:

//
//: ======== TEST ========
// Choose a tactic (2nd argument)

~move.(0, 0);	// player X

~move.(1, 0);	// player Y


// Display final score

~final_score.();
