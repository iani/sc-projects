// Comments IZ
//
// The current player chooses one tactic at random,
// and then we choose the reaction of the other player
// by accessing the optimum strategy according to M7.
// (without weighted random).
// This could be called a variant (?) of use of the matrix
// according to Sluchin&Malt 2011 p. 8:
// "Random choices of each agent."

// SETUP
(
~setup = {
	// M7, Formalized Music p. 121:
	~xmat = [
		[-1, 1, 3, -1, 1, -1],
		[1, -1, -1, -1, 1, -1],
		[3, -1, -3, 5, 1, -3],
		[-1, 3, 3, -1, -1, -1],
		[1, -1, 1, 1, -1, -1],
		[-1, -1, -3, -1, -1, 3],
	];
	~ymat = ~xmat.flop.neg;  // why neg? It is correct, but need to explain it.
	// with reference to FM and other publications.
	~mat = [~xmat, ~ymat];
	// For safety when editing, one could use:
	// ~prob = [[14, 6, 6, 6, 8, 16].normalizeSum, [19, 7, 6, 1, 7, 16].normalizeSum];
	~prob = [[14, 6, 6, 6, 8, 16], [19, 7, 6, 1, 7, 16]]/56;
	~xwon = 0; // number of times that x has won?
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

repeat = 1e4; // repeat 10000 times
//  Each repeat is a game with 50 moves (see below)
~setup.(); // prepare matrix and probability data

player = 0;   // start with player X
// IZ mod: initialize both player and opponent here.
opponent = 1 - player; // set the opponent of the current player
repeat do: {
	~new_game.(); // start a new game

	50.do {  // calculate 50 moves in the game.
		// UZ mod: keep the code for moving to the next
		// player-opponent pair together at the end of the iteration block.
		tactic = (0..5).choose;	// random
		// tactic = (0..5).wchoose(~prob[player]);	// weighted random

		// Calculate the points for each player.
		~sel[opponent] !? {  // if the opponent has selected a tactic,
			// then the point is the value of the cell
			// at the player's row and oppoinent's column.
			point = ~mat[player][tactic].at(~sel[opponent]); //
			// add the point to the player's score.
			~sco[player] = ~sco[player] + point;

			// Since
			~sel[player] = tactic; // store the player's tactic for next time.
			// ~sel.post; ~sco.postln;
			~total_move = ~total_move + 1; // count the number of moves
			player = 1 - player; // switch to the other player for next time.
			opponent = 1 - player; // set the opponent of the current player
		};

	// adjust score value according to Formalized Music p. 121
	game_value = ~total_move * 0.07;
	//
	~sco = [~sco[0] + game_value, ~sco[1] - game_value];
	// ~sco.postln;
	if (~sco[0] > ~sco[1], { ~xwon = ~xwon + 1 });
};

(~xwon/repeat);
)
