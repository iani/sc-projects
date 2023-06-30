
(
// Data
var numRepeats, numMoves, tactic, winRateX;

// Fuctions
var getTactic;

~path = thisProcess.nowExecutingPath.dirname;
(~path +/+ "duel_2_setup.scd").load;

~setup.();
~player = 0;
~opponent = 1 - ~player;

numRepeats = 1000;
numMoves = 50;

// Strategy selection
// getTactic = ~weightedRandom; ~advantageY = 1;
// getTactic = ~getMaxval; ~advantageY = [1.46, 1.56][~player];
getTactic = ~miniMax; ~advantageY = [1.66, 1.78][~player];

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
		// ~prevTactics.post; ~scores.postln;
	};

	// ~applyGamevalue.(0.05, numMoves);	// getTactic = ~weightedRandom
	~countXwin.();
};

// Display the frequency of occurrence of cells
// ~countCells.();

// Is it fair game?
winRateX = ~xWon/numRepeats;
winRateX.postln;
(winRateX - 0.5).abs < 0.05;	// 45-55 %
)