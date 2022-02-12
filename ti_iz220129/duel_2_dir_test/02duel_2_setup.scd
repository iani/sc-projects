

~calcProfit = {|tactic|
	~prevTactics[~opponent] !? {
		var profit = ~mat[~player][tactic].at(~prevTactics[~opponent]);
		if(~player == 1, { profit = profit * ~advantage });
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