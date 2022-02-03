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
)

// SIMULATION
(
// Data
var numRepeats, numMoves, prevTactics, scores, player, opponent, tactic, profit, cells;
// Fuctions
var newGame, getTactic, calcProfit, switchPlayers, addCell, removeCell;

player = 0;
opponent = 1 - player;
numRepeats = 1;
numMoves = 500;
~setup.();

getTactic = {|move|
	var xPL, xProfit, xLoss, oddment;

	// Minimax strategy
	xPL = ~mat[player].collect{|e|			// Expected profit and loss
		if(move > 0, {
			xProfit = e.at(prevTactics[opponent]);	// Player's own gain for this move
		}, {
			xProfit = 0;					// Because prevTactics[opponent] == nil
		});
		xLoss = e.minItem;					// Opponent's gain for the next move
		xProfit + xLoss;
	};
	oddment = xPL.collect{|e| (e == xPL.maxItem).binaryValue};
	if((move > 1) && (oddment.sum > 1), {
		oddment[prevTactics[player]] = 0;
	});
	oddment = oddment.normalizeSum;
	tactic = (0..5).wchoose(oddment);
};

calcProfit = {
	prevTactics[opponent] !? {
		profit = ~mat[player][tactic].at(prevTactics[opponent]);
		if(player == 1, { profit = profit * 2.055 });
		scores[player] = scores[player] + profit;
	};
};

switchPlayers = {
	player = 1 - player;
	opponent = 1 - player;
};

addCell = {|move|
	if(move > 0, {
		var cellIndex = prevTactics[0]*6 + prevTactics[1];
		cells = cells.add(cellIndex);
	});
};

removeCell = {|move|
	if(move > 0, {
		var cellIndex = prevTactics[0]*6 + prevTactics[1];
		~unused_cells.remove(cellIndex);
	});
};

numRepeats.do{
	prevTactics = [nil, nil];
	scores = [0, 0];
	cells = [];

	numMoves.do{|m|
		getTactic.(m);
		calcProfit.();
		prevTactics[player] = tactic;
		switchPlayers.();
		addCell.(m);
		removeCell.(m);
		// prevTactics.post; scores.postln;
	};

	// Counting wins of X
	if(scores[0] > scores[1], { ~xwon = ~xwon + 1 });
};

// Show unused cells
~unused_cells.collect{|e| [(e/6).asInteger, e%6]}.postln;

// Show cell indexes of last game
cells.do{|e| e.postln};

// Return win rate of X
(~xwon/numRepeats);
)