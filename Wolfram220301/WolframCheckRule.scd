/*  2 Mar 2022 15:15
Check implementation in Wolfram class.
*/

w = Wolfram();
w.makeStates(5);
w.listStates;
w.states do: _.postln;
a = w.run1Step;
//:
"".catList(w.states[0] collect: _.asString);
//:
w.startingState;
//:
w.states;
//
//
a = w.test1Step;
// w.makeRule(30);
// w.postRule;
// w.triadCode([1, 1, 1]);
{ | i |
	var t;
	t = i.asBinaryDigits(3);
	[t, w.triadCode(t)].postln;
} ! 7;
//:
(1..5)@@(-1)