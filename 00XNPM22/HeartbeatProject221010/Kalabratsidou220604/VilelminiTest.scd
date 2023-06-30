'/HR_AmpR' >>> { | a, b | "receiving hr amp ".post; if (b[1] > 0) {  (dur: 0.1).play; } };
'/HR_AmpR' >>> { | a, b | if (b[1] > 0) {  /* "bea".postln */ } };
'/HR_AmpR' >>> { | a, b | b[..3].postln; };
'/HR_AmpR' >>> { | a, b | (freq: b[1] + 100 * 4, dur: 0.1).play; };
'/HR_AmpR' >>> { | a, b | (freq: b[4] + 200 * 4, dur: 0.1).play; };
'/HR_AmpR' >>> { | a, b | (freq: b[1] + 200 * 4, dur: 0.1).play; };

//:

OSC.trace;
OSC.untrace;

a = "alpha";
a.hash;
b = a.copy;

a == b;
a === b;

b.hash;

a.hash == b.hash;
a.hash === b.hash;