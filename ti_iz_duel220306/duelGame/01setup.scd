~setup.();

~player = 1;
~opponent = 1 - ~player;

~prevTactics = [nil, nil];
~scores = [0, 0];

~play = {|tactic|
	~calcProfit.(tactic);
	~prevTactics[~player] = tactic;
	~switchPlayers.();
	~prevTactics.post; ~scores.postln;
};
