Server.default waitForBoot: {
	var nucleotids;
	postln("Collecting nucleotids in a single array");
	~data[0] do: { | row, count |
		// postln("adding nucleotids of row" + count);
		// postln(row);
		row[0] do: { | char| nucleotids = nucleotids add: char.asSymbol };
	};
	postf("Collected % nucleoids\n", nucleotids.size);

	postln("PLAYING STARTS NOW");

	{
		var value;
		value = \z1.bamp.linlin(0.46, 0.54, 0, 5).round;
		SendTrig.kr(
			Changed.kr(value),
			1,
			value;
		);
	} +> \index

	// nucleotids do: { | n, index |
	// 	postf("nucleotid is: $, freq is: %\n",
	// 		n, ~nfreqs[n]
	// 	);
	// 	(freq: ~nfreqs[n], dur: 0.05, amp: 0.01).play;
	// 	0.05.wait;
	// }
};