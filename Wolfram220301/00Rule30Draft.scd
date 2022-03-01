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
//:
