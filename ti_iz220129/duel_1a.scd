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
X's win rate is 1.0.
After 10000 trials, the following cells are never used.
X first
[ [ 0, 1 ], [ 1, 0 ], [ 2, 1 ], [ 4, 0 ], [ 4, 2 ], [ 4, 3 ], [ 5, 0 ], [ 5, 1 ], [ 5, 3 ], [ 5, 4 ] ]
Y first
[ [ 0, 1 ], [ 1, 0 ], [ 2, 1 ], [ 4, 0 ], [ 4, 1 ], [ 4, 2 ], [ 4, 3 ], [ 4, 4 ], [ 4, 5 ], [ 5, 0 ], [ 5, 1 ], [ 5, 3 ], [ 5, 4 ] ]
*/

player = 0;
repeat = 1e4;
~setup.();

repeat.do{
	~new_game.();

	50.do{|i|
		opponent = 1 - player;
		if(i == 0, {
			tactic = (0..5).choose;	// random
		}, {
			t = ~mat[opponent].at(~sel[opponent]);
			t = t.collect{|e| (e == t.minItem).binaryValue}.normalizeSum;
			tactic = (0..5).wchoose(t);
		});

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



