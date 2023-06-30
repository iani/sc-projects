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

//: Compare matrices used by x and y
~xmat;
~xmat.flop.neg;
//: Select the minimum item from each row. ("Min part")
~rowMins = ~xmat collect: _.minItem;
//: Now select the largest value amongst the minimums ("Max part")
~max = ~rowMins.maxItem;
//: Now select those rows which have the max item:
~rowMins.collect({ | val, index |
	if(val == ~max) { index } { nil }
}).select({ | item | item.notNil });

//: If Y chooses column 0
/* Starting from scratch, simulation step by step.
	X chooses tactic 0 // no points yet.
next
	Y chooses/ tactic 0 // [0,0]  x - 1 --- y + 1 // score: -1 / + 1
next
	X chooses tactic 2 // [2,0] x + 3 --- y - 3 // score +2 / -2
next
Y chooses t/actic 5 // [2,5] x - 3 --- y + 3 // score -1 / +1


*/
//:

/*
X:
 [
		[-1, 1, 3, -1, 1, -1],
		[1, -1, -1, -1, 1, -1],
		[3, -1, -3, 5, 1, -3],
		[-1, 3, 3, -1, -1, -1],
		[1, -1, 1, 1, -1, -1],
		[-1, -1, -3, -1, -1, 3],
	]

Y:
[
	[ 1, -1, -3, 1, -1, 1 ],
	[ -1, 1, 1, -3, 1, 1 ],
	[ -3, 1, 3, -3, -1, 3 ],
	[ 1, 1, -5, 1, -1, 1 ],
	[ -1, -1, -1, 1, 1, 1 ],
	[ 1, 1, 3, 1, 1, -3 ] ]
*/

//:
~xmat;
//: THIS getMinTactics_IZ IS PROBABLY WRONG!!!!!!
~getMinTactics_IZ = { | mat |
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
~getMinTactics_IZ.(~xmat);
//:
~getMinTactics_IZ.(~xmat.flop.neg);
//:
~xmat.flop.neg;
