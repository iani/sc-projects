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

;
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
