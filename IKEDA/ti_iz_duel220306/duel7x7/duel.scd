
(
~path = thisProcess.nowExecutingPath.dirname;
(~path +/+ "duel_setup.scd").load;

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
)

// Eastern Instrument
~play.(0);	// Repeat
~play.(1);	// Random
~play.(2);	// Freeze

// Western Instrument
~play.(3);	// Repeat
~play.(4);	// Random
~play.(5);	// Freeze

// Pause
~play.(6);