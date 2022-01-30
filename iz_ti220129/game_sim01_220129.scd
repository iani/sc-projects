// based on data from:
// I. Xenakis, Formalized Music, Chapter 4 P. 117 Figure M4

{
	var sections, weights_x, weights_y;
	var x_play_func, y_play_func, score;

	sections = ['I', 'II', 'III', 'IV', 'V', 'VI'];
	weights_x = [18, 4, 5, 5, 11, 15].normalizeSum;
	weights_y = [6, 9, 8, 12, 9, 14].normalizeSum;

	score = [[], []];

	x_play_func = {
		score[0] = score[0] add: sections.wchoose(weights_x);
		postf("x plays: %\n", score[0].last);
	};
	y_play_func = {
		score[1] = score[1] add: sections.wchoose(weights_y);
		postf("y plays: %\n", score[1].last);
	};

	x_play_func.value;
	y_play_func.value;

	10 do: { | i |
		x_play_func.value;
		1.wait;
		y_play_func.value;
		1.wait;
	};
	"Done".postln;
	postf("The score is:\nX: %\nY: %\n",
		score[0], score[1]
	);
}.fork;