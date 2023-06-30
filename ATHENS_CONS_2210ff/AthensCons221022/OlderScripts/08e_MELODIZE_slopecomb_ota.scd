/* 18 Sep 2022 13:21
Too many variations. Need to run this manually
*/
//:
~rootstream = {
	var root;
	root = Pbrown(20, 80, 3, inf).asStream;
	inf do: { | i |
		(root: root.next) ++> \ota5;  // \ota6; \ota7; \ota8;
		0.1.wait;
	}
}.fork;
//:
~rootstream.stop;
