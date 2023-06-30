/*  1 Mar 2022 19:01
Draft for calculating automata according to Stephen Wolfram's rules from
A New Kind of Science

*/
~r = [
	[1] dup: 3,
	[0, 1] dup: 3,
	[0] dup: 3,
	[1, 0, 1] dup: 3,
	[0] dup: 3
].flat;
//:
~r;
//:
~p = ~r[~r.size-1..] ++ ~r ++ ~r[..1];
~q = ~r.size collect: { | i | ~p[i..i+2] };
~q.last;
//:
~p;
~r;
//: https://en.wikipedia.org/wiki/Rule_30
~r30 = Dictionary();
[
	[[1, 1, 1], 0],
	[[1, 1, 0], 0],
	[[1, 0, 1], 0],
	[[1, 0, 0], 1],
	[[0, 1, 1], 1],
	[[0, 1, 0], 1],
	[[0, 0, 1], 1],
	[[0, 0, 0], 0]
] do: { | kv | ~r30[kv[0]] = kv[1] }
//:
~r30;
//:
~q do: { | t | ~r30[t].postln };
~q.size;
~r.size;
~q[0];
~r30[~q[0]];
~r30;


//:================================================================
//: reformulate the above with bitwise operations?
// exploring binary operators:
(1..32) do: {  | i | (1 << i).postln.asBinaryDigits(32).postln };
~p = (6000.nthPrime * 2500.nthPrime)
~p.asBinaryDigits(32);
7.asBinaryDigits(32);
~p & 7;
(~p & 7).asBinaryDigits(32);
//:rule 30 in binary:
// 7, 6, 5, 4, 3, 2, 1, 0
~r30b = [0, 0, 0, 1, 1, 1, 1, 0];

~p = (6000.nthPrime * 2500.nthPrime);
~p.asBinaryDigits(32);
32 do: { | i |	var shifted;
	~p.postln;
	shifted = (~p >> i);
	shifted.asBinaryDigits(32).postln;
	(shifted & 7).postln.asBinaryDigits(32).postln;
};
//:converting rule to binary number compact notation:
// (the result should be 30?)
~r30b;
30.asBinaryDigits;
30.asBinaryDigits == ~r30b;
//:calculate value of 8 element binary array as 8-bit word:
~digits = { | i | 1 << (7 - i) } ! 8;
(~r30b * ~digits).sum;
//:
(7..0).collect({ | i | ~r30b[7-i] });
//: reversed order is needed for direct indexing from numbers:
~r30br = ~r30b.reverse;
//:Post in the same order as listed at:
//https://www.wikiwand.com/en/Rule_30#:~:text=Rule%2030%20is%20an%20elementary,simple%2C%20well%2Ddefined%20rules.
/*
current pattern	111	110	101	100	011	010	001	000
new state for center cell	0	0	0	1	1	1	1	0
*/

(7..0) do: { | i |
	postln("i:" + i + "binary:" + i.asBinaryDigits(3) + "next cell state:" + ~r30br[i]);
};
// { | i | ~r30br[i] } ! 8;


// ================================================================
//: creating a circular array of bits encoded as integers.
// preliminaries: rotating
~p = (6000.nthPrime * 2500.nthPrime);
~p.asBinString;
// bitwisse shiift entire integer
32 do: { | i | (~p << i).asBinString.postln  };
//: bitwise scan integer
32 do: { | i | ~p.rightShift(i).bitAnd(1).asBinString.postln  };
32 do: { | i | (~p << i).asBinString.postln  };
~p.asBinString;
//:blind guess again
7777777777.asBinString;
7777777777.leftShift(1).asBinString;
// Calculating the cell states for the next 32-word in a Rule 30 state automaton.
// The fist bit in an integer:
~firstbit = (8.squared.squared.squared * 128);
~firstbit;
~firstbit.asBinString;
~firstbit.rightShift(2).asBinString;
~firstbit.leftShift(1).asBinString
(8.squared.squared.squared * 128).postln.asBinString;
//:
~firstbit.bitAnd(~p).asBinString;
//:looking for a simpler solution - is there a circular array like structure?
Collection.dumpClassSubtree;
RingBuffer;
//: or just use wrapat?
~a = [0, 0, 0, 1, 1, 1];
~check = { | i | [~a.wrapAt(i-1), ~a.wrapAt(i), ~a.wrapAt(i+1)] } ! 12;
~check do: _.postln;
//:
~table = 30.asBinaryDigits(8).reverse collect: { | i, j | [j, j.asBinaryDigits(3), i];  };
~table.reverse do: _.postln;