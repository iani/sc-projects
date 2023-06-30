// COMMENTS IZ:
// In this simulation, successive moves are chosen by accessing the
// matrix at the position of maximum gain for each player.
// This corresponds to possibility 3 listed in Sluchin&Malt 2011, p. 8:
// "Choices of each agent with strategy of maximum gain."
//
// When there are more than 1 maximum gain choices for a tactic,
// then the player chooses at random amongst these gain choices.
// Therefore the sequence of moves in not entirely deterministic.
// When a player chooses at random, the sequence diverges to
// a new variant.

// SETUP
(
~setup = {
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
	~xwon = 0;
	~unused_cells = (0..35);
};

~new_game = {
	~sel = [nil, nil];
	~sco = [0, 0];
	~total_move = 0;

};
)

// SIMULATION
(
var repeat, player, opponent, tactic, point, game_value, cell;

/*
Get maximum values, without lookahead.
==== ***** IZ question: what does lookahead mean? ***** ====
X's win rate is 1.0.
After 10000 trials, the following combinations of tactics are never used.
X first:
[ [ 0, 1 ], [ 1, 0 ], [ 2, 1 ], [ 4, 0 ], [ 4, 2 ], [ 4, 3 ], [ 5, 0 ], [ 5, 1 ], [ 5, 3 ], [ 5, 4 ] ]
Y first:
[ [ 0, 1 ], [ 1, 0 ], [ 2, 1 ], [ 4, 0 ], [ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 4, 4 ], [ 4, 5 ], [ 5, 0 ], [ 5, 1 ], [ 5, 3 ], [ 5, 4 ] ]
*/

// IZ: Initialize playeer, first tactic and oppoinent together
// at the beginning
player = 0;
tactic = (0..5).choose;	// first move is by random choice
opponent = 1 - player;
repeat = 1e4;
~setup.();

repeat do: {
	~new_game.();

	50 do: { | i |
		var tacticw; // IZ: avoid undeclared interpreter varialbes ("t")
		// get row of opponent's matrix at opponent's selection
		tacticw = ~mat[opponent].at(~sel[opponent]);
		// give all mionimum values an equal chance,
		// and all other values 0 chance
		tacticw = tacticw.collect({ | e |
			(e == tacticw.minItem).binaryValue
		}).normalizeSum;
		// choose with equal probability amongst minimum values
		// in opponts row.
		tactic = (0..5).wchoose(tacticw);

		// Add profit
		~sel[opponent] !? {
			point = ~mat[player][tactic].at(~sel[opponent]);
			~sco[player] = ~sco[player] + point;
		};

		~sel[player] = tactic;
		~total_move = ~total_move + 1;
		player = 1 - player;

		if(i > 0, {
			cell = ~sel[0]*6 + ~sel[1];
			~unused_cells.remove(cell);
			// ~sel.post; cell.post; ~sco.postln;
		});
	};

	game_value = ~total_move * 0.07;
	~sco = [~sco[0] + game_value, ~sco[1] - game_value];
	// ~sco.postln;
	if (~sco[0] > ~sco[1], { ~xwon = ~xwon + 1 });
};

~unused_cells.collect{|e| [(e/6).asInteger, e%6]}.postln;
(~xwon/repeat);
)



