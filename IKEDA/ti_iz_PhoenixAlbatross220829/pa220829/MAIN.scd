(
// Initialize
~game = 1;
~total = 0;
{ Server.default.boot; }.defer(1.0);
~pahome = thisProcess.nowExecutingPath.dirname;
)
//:
//:
(
// New game
if (~wd.notNil) { ~wd.close };
~length = 16;			// Length of game (must be an even number for fairness)
~game = 1 - ~game;		// Change the first attacker every time
~total = ~total + 1;
// ~path = thisProcess.nowExecutingPath.dirname;
~path = ~pahome;
(~path +/+ "setup.scd").load;
)
//:
\phoenix.stop(5);
\albatross.stop(5);
//:
// Executing tactics
~tactic.(0, {{ Pan2.ar(Dust.ar(20), -0.7) } +> \phoenix });
~tactic.(1, {{ Pan2.ar(SinOsc.ar(LFNoise0.ar(50, 100)), -0.7) } +> \phoenix });
~tactic.(2, {{ Pan2.ar(PinkNoise.ar(0.1), -0.7) } +> \phoenix });
~tactic.(3, {{ Pan2.ar(SinOsc.ar(10000, 0, LFPulse.ar(1, 0, 0.01)), -0.7) } +> \phoenix });
~tactic.(4, {{ Pan2.ar(SinOsc.ar(LFPulse.ar(20, 0, 0.5, 100, 50), 0, 0.2), -0.7) } +> \phoenix });
~tactic.(5, {{ Pan2.ar(PinkNoise.ar(SinOsc.ar(LFNoise1.ar(1,3,5), 0, 0.5)), -0.7) } +> \phoenix });
~tactic.(6, {{ } +> \phoenix });

~tactic.(0, {{ Pan2.ar(Dust.ar(20), 0.7) } +> \albatross });
~tactic.(1, {{ Pan2.ar(SinOsc.ar(LFNoise0.ar(50, 100)), 0.7) } +> \albatross });
~tactic.(2, {{ Pan2.ar(PinkNoise.ar(0.1), 0.7) } +> \albatross });
~tactic.(3, {{ Pan2.ar(SinOsc.ar(10000, 0, LFPulse.ar(1, 0, 0.01)), 0.7) } +> \albatross });
~tactic.(4, {{ Pan2.ar(SinOsc.ar(LFPulse.ar(20, 0, 0.5, 100, 50), 0, 0.2), 0.7) } +> \albatross });
~tactic.(5, {{ Pan2.ar(PinkNoise.ar(SinOsc.ar(LFNoise1.ar(1,3,5), 0, 0.5)), 0.7) } +> \albatross });
~tactic.(6, {{ } +> \albatross });