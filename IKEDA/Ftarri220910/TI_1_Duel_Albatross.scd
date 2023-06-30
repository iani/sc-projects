Project.gui;

Duel.initialize;

Duel.controlBusMonitor;

OSC.trace;

// NOTE: It is not needed to disable OscGroups any more.
// Any player can initiate Duel.newgame.
// This is broadcast to all other players.
// So to start a new game ONLY ONE USER NEEDS TO RUN Duel.newgame.
Duel.newgame;

\phoenix.stop(2); \albatross.stop(2);

Server.killAll;

//========== ALBATROSS ==========//
//:
(~tactic.(0, {
	a = Dust.ar(10);
	b = EnvGen.ar(Env.perc(0, 0.01), a);
	c = 2000.rand + 50;
	c = LFNoise0.ar(100, c, c+50);
	c = Latch.ar(c, a);
	d = RLPF.ar(a, c, 0.05, 10);
	a = SinOsc.ar(10000.rand, 0, d);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, -0.7);
} +> \albatross ))
//:
(~tactic.(1, {
	a = PinkNoise.ar;
	a = Mix.fill(6, {
		BPF.ar(a, 2000.rand + 50, 1/500, SinOsc.ar(1.0.rand, 0, 15, 16));
	});
	a = Pan2.ar(a, -0.7);
} +> \albatross ))
//:
(~tactic.(2, {
	x = (60.rand + 36).midicps;
	a = Impulse.ar(LFNoise0.ar(1.2, 7, 8));
	b = LFNoise0.ar(LFNoise0.ar(1, 7, 8), x/5, x);
	a = CombN.ar(a*1.5, 0.1, 1/b, 0.7);
	a = LPF.ar(HPF.ar(a, 50), 15000);
	a = Pan2.ar(a, -0.7);
	a = FreeVerb2.ar(a[0], a[1], 0.3, 0.2);
} +> \albatross ))
//:
(~tactic.(3, {
	a = Impulse.ar(20.0.rand + 1);
	b = LFSaw.ar(1000)+1/2;
	b = Latch.ar(b, a);
	c = EnvGen.ar(Env.perc(0.005, 0.1), a);
	a = SinOsc.ar(1000*b, 0, c/2);
	a = SinOsc.ar(8000.rand, 0, a);
	a = Pan2.ar(a, -0.7);
} +> \albatross ))
//:
(~tactic.(4, {
	a = Mix.fill(4, { LFPulse.kr(Rand(0.3, 0.7), Rand(0, 1))/4 });
	b = Rand(50, 500);
	b = b/3 * a + b;
	c = Rand(0, 5);
	d = Latch.kr(LFNoise0.kr, Changed.kr(a)).lag(0.05);
	a = PMOsc.ar(b, b*c, Rand(0, 20)*d)/4*d;
	a = Pan2.ar(a, -0.7);
} +> \albatross ))
//:
~tactic.(5, {{ } +> \albatross });
//: