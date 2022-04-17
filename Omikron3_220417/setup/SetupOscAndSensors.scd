OscGroups.enable;
"enabled osc groups".postln;
OscGroups.forward; // default: forward /sense/data
"Enabled forwarding sense data to osc groups".postln;
SenseData().setxyz(1, 2, 3, 4, 5, 6, 7);
"Sensors 1-8 write to buses 0-23".postln;