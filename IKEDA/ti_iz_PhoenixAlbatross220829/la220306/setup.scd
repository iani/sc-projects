~path = thisProcess.nowExecutingPath.dirname;
(~path +/+ "func.scd").load;

~setup.();

~player = 1;
~opponent = 1 - ~player;
~turn = -1;

~prevTactics = [nil, nil];
~scores = [0, 0];

~play = {|tactic, func|
	~turn = ~turn + 1;
	~calcProfit.(tactic);
	~ptSound.(~scores[~player], ~player);
	~prevTactics[~player] = tactic;
	~switchPlayers.();
	// ~prevTactics.post;
	// ~scores.rotate(~game).postln;
	["0 反復", "1 乱調", "2 持続", "3 Repeat", "4 Random", "5 Freeze", "6 ポーズ"][tactic].post;
	"　".post;
	o = ~scores.rotate(~game);
	(o[0] + ":" + o[1]).postln;
	func.value;
};

t = "ROUND " ++ ~total;
t.postln;

t = ["RIGHT", "LEFT"][~game];
t = "FIRST ATTACK : " ++ t ++ " SIDE";
t.postln;

// ===== SCORE TO SOUND =====

f = ["ikea_11", "ikea_0", "ikea_1", "ikea_7", "14-tabla_te_ne", "12-tabla_te2", "09-tabla_tas2", "15-tabla_tun1", "z_airhorn"];
f.do{|e,i|
	s.sendMsg(\b_allocRead, 100+i, ~path +/+ e ++ ".wav")
};

SynthDef(\wav, {|buf, rate, pan|
	a = PlayBuf.ar(1, buf, rate, doneAction:2);
	a = Pan2.ar(a, pan);
	Out.ar(0, a);
}).store;

~ptSound = {|num, player|
	var base, pow, cond, weight, digit, ary, sco, sec, idx, dur, sl;
	base = 5;
	pow = 0;
	cond = true;
	ary = [];

	while({ cond },
		{
			weight = base ** pow;
			digit = (num / weight).asInteger % base;
			if( num >= weight, { ary = ary.insert(0, digit) }, { cond = false });
			pow = pow + 1;
		}
	);
	// ary.postln;

	sco = [];
	sec = 0;
	idx = 4 - ary.size;
	dur = [0.5, 0.1, 0.15, 0.25, 0.2, 0.1, 0.3, 0.4];
	sl = [96, 96, 96, 96, 44.1, 44.1, 44.1, 44.1];

	ary.do{|e,i|
		j = ~game + player % 2 * 4 + idx + i;
		k = ~game + player % 2 * 2 - 1;
		e.do{
			a = [[sec, [\s_new, \wav, -1, 0, 0, \buf, 100+j, \rate, sl[j]/44.1, \pan, k]]];
			sco = sco.addAll(a);
			sec = sec + dur[j];
		};
	};

	if(~turn == ~length, {
		a = [[sec+0.5, [\s_new, \wav, -1, 0, 0, \buf, 108, \rate, 1, \pan, 0]]];
		sco = sco.addAll(a);
	});

	Score.play(sco);
};