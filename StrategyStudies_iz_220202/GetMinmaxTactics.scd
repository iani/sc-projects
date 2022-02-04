/*  2 Feb 2022 22:35
Use matrix M7 from FM p. 121.
Define a function that returns the optimal tactics for a player based on the
tactic currently chosen by the opponent.



*/

~xmat = [
		[-1, 1, 3, -1, 1, -1],
		[1, -1, -1, -1, 1, -1],
		[3, -1, -3, 5, 1, -3],
		[-1, 3, 3, -1, -1, -1],
		[1, -1, 1, 1, -1, -1],
		[-1, -1, -3, -1, -1, 3],
	]


//:
~xmat;
//:
~getMinTactics = { | mat |
	mat.collect({ | row |
		var minItem, minTactics;
		minItem = row.minItem;
		row do: { | item, index |
			if (item == minItem) { minTactics = minTactics add: index };
		};
		minTactics;
	})
};
//:
~getMinTactics.(~xmat);
//:
~getMinTactics.(~xmat.flop.neg);
//:
~xmat.flop.neg;