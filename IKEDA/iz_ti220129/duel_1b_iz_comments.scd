// COMMENT IZ:
// Here player 0 (X), always chooses at random,
// and player 2 (Y), alwyays chooses the optimal tactic
// according to the matrix.
// Thus Y always wins.
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
};

~new_game = {
	~sel = [nil, nil];
	~sco = [0, 0];
	~total_move = 0;

};
)

// SIMULATION
(
var repeat, player, opponent, tactic, point, game_value;

/*
Random choice vs Gets maximum values
Regardless of whether the first move is X or Y,
A player who makes random choices has a win rate almost of 0.0.

// COMMENT IZ:
The above is a consequence of the fact that the
player that always chooses the optimal strategy always has
an advantage over the player that chooses at random.
*/

//

player = 0;
repeat = 1e4;
~setup.();

repeat.do{
	~new_game.();

	50.do{|i|
		opponent = 1 - player;
		if(i == 0, {
			tactic = (0..5).choose;
		}, {
			if(player == 0, {
				tactic = (0..5).choose;		// random choice
			}, {
				t = ~mat[opponent].at(~sel[opponent]);
				t = t.collect{|e| (e == t.minItem).binaryValue}.normalizeSum;
				tactic = (0..5).wchoose(t);
			});
		});

		// Add profit
		~sel[opponent] !? {
			point = ~mat[player][tactic].at(~sel[opponent]);
			~sco[player] = ~sco[player] + point;
		};

		~sel[player] = tactic;
		~total_move = ~total_move + 1;
		player = 1 - player;
		// ~sel.post; ~sco.postln;
	};

	game_value = ~total_move * 0.07;
	~sco = [~sco[0] + game_value, ~sco[1] - game_value];
	// ~sco.postln;
	if (~sco[0] > ~sco[1], { ~xwon = ~xwon + 1 });
};

(~xwon/repeat);
)



