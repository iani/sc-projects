//:
SynthDef(\click, { | freq=50, amp = 1.0 | Out.ar(0, Ringz.ar(Impulse.ar(0.1), [freq, freq+1], 0.1) * Line.ar(amp,0,0.1,1,0,2))}).add;

//:
'/HR_AmpR' >>>.test { | a, b | "receiving hr amp ".postln;
	if (b[1] > 0) {  (instrument: \click, freq: 1000, dur: 0.1).play; }
};
//:

//:
(\instrument: \click, freq: Pwhite(500, 3000, inf)) +> \test;
//:
//:
'/Hr_AmpR' >>>.test { | a, b | b.postln; };
'/HR_AmpR' >>>.test { | a, b |  };
'/HR_AmpR' >>>.test { | a, b | b[..3].postln; };
'/HR_AmpR' >>>.test { | a, b | (freq: b[1] + 100 * 4, dur: 0.1).play; };
'/HR_AmpR' >>>.test { | a, b | (freq: b[4] + 200 * 4, dur: 0.1).play; };
'/HR_AmpR' >>>.test { | a, b | (freq: b[1] + 200 * 4, dur: 0.1).play; };

OSC


OSC.trace;
OSC.untrace;

{ SinOsc.ar(400) }.play;


().play;

NetAddr("127.0.0.1", 22244).sendMsg('test', 1, 2, 3);
NetAddr.localAddr.sendMsg('test', 1, 2, 3);

Project.gui;

"asdf";

'/HR_AmpR'



OscGroups forward: '/HR_AmpR'

OSC.untrace;
OSC.trace;

10000.rand;

OscGroups forward: '/HR_AmpR';

Server.default.quit;

Server.default.boot;

(freq: 1000).play;

{ SinOsc.ar(400, 0, 0.1).dup } +> \test;


10000.rand;
