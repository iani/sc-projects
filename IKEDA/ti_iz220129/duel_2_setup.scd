// ===== STRATEGIES =====

~weightedRandom = {
	(0..5).wchoose(~prob[~player]);
};

~miniMax = {|move|
	var xpl, xProfit, xLoss, oddment;

	xpl = ~mat[~player].collect{|e|				// Expected profit and loss
		if(move > 0, {
			xProfit = e.at(~prevTactics[~opponent]);	// Player's own gain for this move
		}, {
			xProfit = 0;						// Because ~prevTactics[~opponent] == nil
		});
		xLoss = e.minItem;						// Opponent's gain for the next move
		xProfit + xLoss;
	};
	oddment = xpl.collect{|e| (e == xpl.maxItem).binaryValue};
	if((move > 1) && (oddment.sum > 1), {
		oddment[~prevTactics[~player]] = 0;		// Avoid repetition of the same tactic
	});
	oddment = oddment.normalizeSum;
	(0..5).wchoose(oddment);
};

~getMaxval = {|move|
	var xpl, xProfit, oddment;

	xpl = ~mat[~player].collect{|e|				// Expected profit and loss
		if(move > 0, {
			xProfit = e.at(~prevTactics[~opponent]);	// Player's own gain for this move
		}, {
			xProfit = 0;						// Because ~prevTactics[~opponent] == nil
		});
		xProfit;
	};
	oddment = xpl.collect{|e| (e == xpl.maxItem).binaryValue};
	if((move > 1) && (oddment.sum > 1), {
		oddment[~prevTactics[~player]] = 0;		// Avoid repetition of the same tactic
	});
	oddment = oddment.normalizeSum;
	(0..5).wchoose(oddment);
};


// ===== FUNCTIONS =====

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
	~cells = [];
	~xWon = 0;
};

~calcProfit = {|tactic|
	~prevTactics[~opponent] !? {
		var profit = ~mat[~player][tactic].at(~prevTactics[~opponent]);
		if(~player == 1, { profit = profit * ~advantageY });
		~scores[~player] = ~scores[~player] + profit;
	};
};

~switchPlayers = {
	~player = 1 - ~player;
	~opponent = 1 - ~player;
};

~addCell = {|move|
	if(move > 0, {
		var cellIndex = ~prevTactics[0]*6 + ~prevTactics[1];
		~cells = ~cells.add(cellIndex);
	});
};

~countXwin = {
	if(~scores[0] > ~scores[1], { ~xWon = ~xWon + 1 });
};

~countCells = {
	var freq = Array.fill2D(6, 6, {|row, col| row*6+col});
	freq = freq.collect{|f| f.collect{|e| ~cells.count{|c| c == e }}};
	freq.do{|f| f.do{|e| (e+"\t").post}; "".postln };
};

~applyGamevalue = {|gameValue, numMoves|
	var gv = gameValue * numMoves;
	~scores = [~scores[0] + gv, ~scores[1] - gv];
};