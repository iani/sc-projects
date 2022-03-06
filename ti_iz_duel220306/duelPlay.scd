// Eastern Instrument
~play.(0);	// Repeat
~play.(1);	// Random
~play.(2);	// Freeze

// Western Instrument
~play.(3);	// Repeat
~play.(4);	// Random
~play.(5);	// Freeze

// Pause
~play.(6, { { SinOsc.ar(500 rrand: 5000) / 20 } +> \west2 } );
~play.(6, { () +> \west2 } );
~play.(6, { (degree: [0, 10, 20].pwhite) +> \west2 } );
~play.(6, { (dur: [0.05, 0.1].prand) ++> \west2 } );
//:
