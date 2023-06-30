////////// Control Bus Monitor //////////
var wd, mtr;
//:
OscGroups.enable;
"enabled osc groups".postln;
OscGroups.forward; // default: forward /sense/data
"Enabled forwarding sense data to osc groups".postln;
SenseData().setxyz(1, 2, 3, 4, 5, 6, 7, 8);
"Sensors 1-8 write to buses 0-23".postln;

//:
w = Window.availableBounds;
wd = Window("Control Bus Meter", Rect(w.width-490, w.height-240, 490, 240));
wd.alwaysOnTop = true;
wd.onClose = defer { \cbmon.stop };
wd.front;

mtr = Array.fill(24, {|i|
	a = StaticText(wd, Rect(i*20, 0, 15, 15));
	a.font = Font("Arial", 10, true);
	a.align = \center;
	a.string = i.asString;

	m = LevelIndicator(wd, Rect(i*20+5, 15, 15, 220));
	m.drawsPeak = true;
	m.numTicks = 9;
	m.numMajorTicks = 3;
});

OSCFunc({|msg|
	msg.do{|e,i|
		if(i > 2, {
			defer { mtr[i-3].value = e };
		});
	}
}, '/cbmon');

{
	// var sig = Array.fill(24, { LFNoise1.kr(4, 0.1, 0.46)});		// test
	var sig = In.kr(0, 24);
	var src = sig * \mul.kr(5) + \add.kr(-2);
	SendReply.kr(Impulse.kr(30), '/cbmon', src);
	\amp.kr(0);
} +> \cbmon;

/*
\cbmon.stop;
*/
