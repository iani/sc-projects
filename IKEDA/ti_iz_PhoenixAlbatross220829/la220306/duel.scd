(
// init
~game = 1;
~total = 0;
)

(
// next game
~game = 1 - ~game;
~total = ~total + 1;
~length = 20;
~path = thisProcess.nowExecutingPath.dirname;
(~path +/+ "setup.scd").load;
)

// Eastern Instrument
~play.(0);	// Repeat
~play.(1);	// Random
~play.(2);	// Freeze

// Western Instrument
~play.(3);	// Repeat
~play.(4);	// Random
~play.(5);	// Freeze

// Pause
~play.(6);



// Live Coding (?)
~play.(2, {{SinOsc.ar(LFNoise0.ar(5, 1000), 0, 0.2)} +> \east });
~play.(5, {(freq: Prand([1100, 1000], inf), dur: 0.2) +> \west });

~play.(7.rand);