/* 23 Oct 2022 20:52

*/


//:
SynthDef("beat", {
	var src;
	src = WhiteNoise.ar(0.1).dup;
	Out.ar(0, src * Env.perc(0.01, 0.1).kr(doneAction: 2))
}).load;
//:
Synth("beat");
//:
'/HR_AmpR' >>>.amp { | n, m |
	//	if (m[1] > 0) { Synth("beat"); }
};
//:
'/HR_AmpR' >>>.amp { | n, m |
	if (m[1] > 0) { Synth("beat"); }
};

//:

OSC
//:

OSC.trace;
OSC.untrace;

//:
OscGroups.enable;