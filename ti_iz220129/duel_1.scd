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
Regardless of whether the first move is X or Y,
random choise:		X's win rate is about 0.69
weighted random:	X's win rate is about 0.61
*/

player = 0;
repeat = 1e4;
~setup.();

repeat.do{
	~new_game.();

	50.do{
		opponent = 1 - player;
		tactic = (0..5).choose;	// random
		// tactic = (0..5).wchoose(~prob[player]);	// weighted random

		// Add profit
		~sel[opponent] !? {
			point = ~mat[player][tactic].at(~sel[opponent]);
			~sco[player] = ~sco[player] + point;
		};

		~sel[player] = tactic;
		// ~sel.post; ~sco.postln;
		~total_move = ~total_move + 1;
		player = 1 - player;
	};

	game_value = ~total_move * 0.07;
	~sco = [~sco[0] + game_value, ~sco[1] - game_value];
	// ~sco.postln;
	if (~sco[0] > ~sco[1], { ~xwon = ~xwon + 1 });
};

(~xwon/repeat);
)
