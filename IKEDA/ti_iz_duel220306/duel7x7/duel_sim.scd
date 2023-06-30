
(
// Data
var numRepeats, numMoves, tactic, winRateX;

// Fuctions
var getTactic;

~path = thisProcess.nowExecutingPath.dirname;
(~path +/+ "duel_setup.scd").load;

~setup.();

// 2.do{|n|

numRepeats = 100;
numMoves = 40;
~xWon = 0;

numRepeats.do{
	~player = 1;
	~opponent = 1 - ~player;

	~prevTactics = [nil, nil];
	~scores = [0, 0];

	numMoves.do{|move|
		getTactic = ~getMaxval;
		// getTactic = ~miniMax;

		tactic = getTactic.(move);
		~calcProfit.(tactic);
		~prevTactics[~player] = tactic;
		~switchPlayers.();
		~addCell.(move);

		// Display the move and the score
		// ~prevTactics.post; ~scores.postln;
	};

	~countXwin.();
};

// Display the frequency of occurrence of cells
~countCells.();

// Is it fair game?
winRateX = ~xWon/numRepeats;
winRateX.postln;
(winRateX - 0.5).abs < 0.05;	// 45-55 %
// };
)