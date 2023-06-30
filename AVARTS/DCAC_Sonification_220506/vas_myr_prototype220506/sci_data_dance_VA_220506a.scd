/*  6 May 2022 17:34

*/
//:


$A.asSymbol;

x = (A: 10);

x[$A.asSymbol]

//:
~file1data[3..4];

~files = "/Users/vasilis/Documents/Projects/Research/sonification/SonifyingCOVID2/data/*.fasta".pathMatch;
//:
~files[0];
//:
~file1data = CSVFileReader.read(~files[0])[1..];

//:
~file1data[0][0].class;
//:
BASynthSines();
BASynthGrainAn()
//:
{
	~freqs;
	~freqs = (C: 60.midicps, A: 63.midicps, G: 67.midicps, T: 69.midicps);
 	~freqs.postln;
	~file1data[1..] do: { | row |
		row.postln;
		0.1.wait;
		row[0] do: { | char |
			char.asSymbol.postln;
			//		BASynthSines();
			~oscGlove = OSCdef(\oscTest,
	{
		| ... msg |
~dur = msg[0][1].asFloat.linlin(-9.0, 9.0, 0.01, 2.0);
		~freqOsc = msg[0][1].asFloat.linlin(-9.0, 9.0, 1.0, 2.0);
		~trigOsc = msg[0][1].asFloat.linlin(-9.0, 9.0, 1.0, 100.0);
~ampOsc = msg[0][1].asFloat.linlin(-9.0, 9.0, 0.0, 0.9);
		//		(freq: ~freqOsc*~freqs[char.asSymbol].postln, mul:~ampOsc).play;
		//(freq: ~freqOsc).play;
Pbindef(\grain, \rate, 1, \carfreq, 100,  \shape,~dur, \dur, ~dur, \trig, ~trigOsc).play;
		//Pbindef(\sinepad, \freq, ~freqs*~freqOsc.postln, \amp, ~ampOsc.postln).play;

},
	'/accelX'
);

			~freqs.postln;
			~freqs[char.asSymbol].postln;
			//(freq: ~freqs[char.asSymbol].postln).play;

			~dur.wait;

		};

	};

}.fork;
//:
~oscGlove2 = OSCdef(\oscTest2,
	{
		| ... msg |
~dur = msg[0][1].asFloat.linlin(-9.0, 9.0, 0.01, 2.0);
		//~freqOsc = msg[0][1].asFloat.linlin(-9.0, 9.0, 1.0, 2.0);
		//~ampOsc = msg[0][1].asFloat.linlin(-9.0, 9.0, 0.0, 0.9);
Pbindef(\grain, \vol, ~ampOsc, \amp, ~ampOsc).play;
		//Pbindef(\sinepad, \fadeindr,~dur, \dur, ~dur, \fadeoutdr,~dur).play;
		//(dur: ~dur).play;
},
	'/accelY'
);