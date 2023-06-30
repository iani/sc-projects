// based on data from:
// I. Xenakis, Formalized Music, Chapter 4 P. 117 Figure M4
// Adding points matrix to evaluate the points for each move

{
	var sections, weights_x, weights_y;
	var play_one_func, play_both_func, point_func;
	var score, points, pointMatrix;

	sections = ['I', 'II', 'III', 'IV', 'V', 'VI'];
	weights_x = [18, 4, 5, 5, 11, 15].normalizeSum;
	weights_y = [6, 9, 8, 12, 9, 14].normalizeSum;
	pointMatrix

	score = [[], []]; // row 0: x, row 1: y
	points = [];

	pointMatrix = [
		[2, 3, 4, 2, 3, 2],
		[3, 2, 2, 3, 3, 2],
		[4, 2, 1, 4, 3, 1],
		[2, 4, 4, 2, 2, 2],
		[3, 2, 3, 3, 2, 2],
		[2, 2, 1, 2, 2, 4]
	];

	point_func = { | player = 0 |
		points = points add: [player,

		]
	};

	play_1_func = {
		score[0] = score[0] add: sections.wchoose(weights_x);
		postf("x plays: %\n", score[0].last);
	};
	y_play_func = {
		score[1] = score[1] add: sections.wchoose(weights_y);
		postf("y plays: %\n", score[1].last);
	};
	xy_play_func = { | ywaitTime |
		x_play.func.value;
		ywaitTime !? { ywaitTime.wait };
		y_play.func.value;

	}


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