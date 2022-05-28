OscGroups.enable;
"enabled osc groups".postln;
OscGroups.forward; // default: forward /sense/data
"Enabled forwarding sense data to osc groups".postln;
SenseData().setxyz(1, 2, 3, 4, 5, 6, 7, 8); // write sensor input values to buses
"Sensors 1-8 write to buses 0-23".postln;
Server.default.options.memSize = 2**19; // necessary for Takumi Ikeda's live coding.
//: Record sound to disc
Server.default waitForBoot: {
	Server.default.record;
}
