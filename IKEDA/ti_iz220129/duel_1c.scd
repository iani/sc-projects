/*
Minimax strategy:
Choose the tactic with the least loss.

For example, after Y's tactic I, the next X's tactics could be II, III and V. (see minimax.pdf)
These tactics result in a maximum loss of zero due to the next Y tactic.
Depending on the opponent's move, X will have both a gain and a loss, but Y will have no gain or only a loss.

- Extra Proposal: Multiply each score of Y by 2.055.
This multiplier was obtained experimentally.
It should be adjusted according to the number of moves.
Instead of that, eliminate adjustments of final score based on game value.

- The unused tactical pairs generally reflect the composer's acoustic preferences (see M8 p. 121).
After 10000 trials, the following combinations of tactics are never used.
[ 2, 3 ] are not used because they are too highly rated.

X first (X's win rate is about 0.49):
[ [ 0, 1 ], [ 0, 3 ], [ 1, 3 ], [ 2, 1 ], [ 2, 3 ], [ 2, 4 ], [ 3, 0 ], [ 3, 3 ], [ 3, 5 ], [ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 4, 5 ], [ 5, 0 ], [ 5, 1 ], [ 5, 3 ] ]

Y first (X's win rate is about 0.64):
[ [ 0, 1 ], [ 0, 3 ], [ 1, 3 ], [ 2, 1 ], [ 2, 3 ], [ 2, 4 ], [ 3, 0 ], [ 3, 3 ], [ 3, 5 ], [ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 4, 5 ], [ 5, 0 ], [ 5, 1 ], [ 5, 3 ] ]
*/


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
	~prob = [[14, 6, 6, 6, 8, 16], [19, 7, 6, 1, 7, 16]]/56;
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

player = 1;
repeat = 10000;
~setup.();

repeat.do{
	~new_game.();

	40.do{|i|
		opponent = 1 - player;

		t = ~mat[player].collect{|e|
			var gain, loss;
			if(i > 0, {
				gain = e.at(~sel[opponent]);	// player's own score for this move
			}, {
				gain = 0;
			});
			loss = e.minItem;				// opponent's score for the next move
			gain + loss;
		};
		t = t.collect{|e| (e == t.maxItem).binaryValue}.normalizeSum;
		tactic = (0..5).wchoose(t);

		// Add profit
		~sel[opponent] !? {
			point = ~mat[player][tactic].at(~sel[opponent]);
			if(player == 1, { point = point * 2.055 });
			~sco[player] = ~sco[player] + point;
		};

		~sel[player] = tactic;
		~total_move = ~total_move + 1;
		player = 1 - player;

		if(i > 0, {
			cell = ~sel[0]*6 + ~sel[1];
			~unused_cells.remove(cell);
		});
		// ~sel.post; cell.post; ~sco.postln;

	};

	if (~sco[0] > ~sco[1], { ~xwon = ~xwon + 1 });
};

~unused_cells.collect{|e| [(e/6).asInteger, e%6]}.postln;
(~xwon/repeat);
)