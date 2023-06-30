\default +> \test;
//:
{ | out = 0 |
	Out.ar(out, WhiteNoise.ar(0.1).adsr);
} +> \test;
//:
\out <+.test 1;
//:
\out <+.test 23;
//:
{
	10 do: { | count |
		postln("count: " + count + "count % 2 " + (count % 2));
		1.wait;
		\out <+.test (count % 2).postln;
		1.wait;
	}

}.fork;
//:
Server.default.scope;
//:
Server.default.options.numAudioBusChannels;
Server.default.options.numOutputBusChannels;
Server.default.options.numControlBusChannels;
