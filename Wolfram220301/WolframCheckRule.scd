/*  2 Mar 2022 15:15
Check implementation in Wolfram class.
*/

w = Wolfram();
w.makeStates(5);
w.listStates;
w.states do: _.postln;
a = w.run1Step;
//:
w = Wolfram(30, "0000000000000000000000000000000000000100000000000000000000000000000000");
w.makeStates(50);
w.listStates;
//:
w = Wolfram(30, "00000000000000000001000000000000000000100000000000000000000000000000000");
w.makeStates(50);
w.listStates;
//:

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
(1..5)@@(-1);

//: create states array from string
~x = nil;
"0101" do: { |c| ~x = ~x add: c.asString.interpret }
~x