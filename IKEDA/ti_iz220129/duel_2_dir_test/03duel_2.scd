
// (
// Data
var numRepeats, numMoves, tactic;

// Fuctions
var getTactic;

// ~path = thisProcess.nowExecutingPath.dirname;
// (~path +/+ "duel_2_setup.scd").load;

~setup.();
~player = 0;
~opponent = 1 - ~player;

numRepeats = 1;
numMoves = 50;

// Strategy selection
// getTactic = ~weightedRandom; ~advantage = 1;
getTactic = ~miniMax;
~advantage = [1.65, 1.77][~player];

numRepeats.do{
	~prevTactics = [nil, nil];
	~scores = [0, 0];

	numMoves.do{|move|
		tactic = getTactic.(move);
		~calcProfit.(tactic);
		~prevTactics[~player] = tactic;
		~switchPlayers.();
		~addCell.(move);

		// Display the move and the score
		~prevTactics.post; ~scores.postln;
	};

	// ~applyGamevalue.(0.07, numMoves);	// When getTactic = ~weightedRandom
	~countXwin.();
};

// Display the frequency of occurrence of cells
~countCells.();

// Return win rate of X
~xWon/numRepeats;
// )