// PREP!!!!
Project.gui;

Duel.initialize;
OscGroups.forward;

\albatross.stop(5);
\albatross.stop(2);

(amp: 0.001) ++> \albatross;
(amp: 0.01) ++> \albatross;
(amp: 0.05) ++> \albatross;
(amp: 0.1) ++> \albatross;
(amp: 0.15) ++> \albatross;
(amp: 0.2) ++> \albatross;
(amp: 0.25) ++> \albatross;
(amp: 0.3) ++> \albatross;
(amp: 0.4) ++> \albatross;
(amp: 0.5) ++> \albatross;
(amp: 0.6) ++> \albatross;
(amp: 0.7) ++> \albatross;
(amp: 0.8) ++> \albatross;
(amp: 0.9) ++> \albatross;
//========== SLOPE ==========//
//:
//:
({
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x5.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \albatross)
//:
(key: 68) ++> \albatross;

//: fd
({
	var frq = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2);
		// MouseY.kr(0, 1).lag(1);			// test
	).abs.max(0.01).min(1);

	a = Impulse.ar(frq * \mul.kr(10));
	a = EnvGen.ar(Env.perc(0, 0.5), a);
	a = SinOsc.ar(a**30*2000+60, 0, a/2);
	a = HPF.ar(a, 50);
	b = (\root.kr(48) + [0, 5, 10]).midicps.reciprocal;
	c = CombN.ar(a, 0.1, b, 0.7, 0.5);
	a = Splay.ar(c) + a;
	a = FreeVerb2.ar(a[0], a[1], 0.1, 0.8);

	\amp.kr(1.0).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \albatross )
//:
(amp: 0.1) ++> \albatross;
(root: 39) ++> \albatross;
//:  MELODIZE!!!!
~rootstream = {
	var root;
	root = Pbrown(20, 80, 3, inf).asStream;
	 inf do: { | i |
		(root: root.next) ++> \albatross;
		0.05.wait;
	}
}.fork;
//:
~rootstream.stop;

//: albatross STATIC =========
({
	var pch;
	pch = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 24, 60);
	// pch = MouseY.kr(24, 60);	// test

	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (pch.midicps), 2.0.rand, 0.1) });
	a = LPF.ar(a, \bass.kr(150), 2, a);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.9).lag(1) * a *
	(\z3.bin > 0.5).lag(1);
} +> \albatross )
//:
(bass: 1000) ++> \albatross;
//:
~bassstream = {
	var bass;
	bass = Pbrown(150, 8000, 3, inf).asStream;
	 inf do: { | i |
		(bass: bass.next) ++> \albatross;
		0.1.wait;
	}
}.fork;
//:
~bassstream.stop
//:========== PULSE ==========//
//:albatross
({
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 50);
	// rte = MouseY.kr(0.2, 10);	// test

	a = Impulse.ar(rte);
	a = EnvGen.ar(Env.perc(0.001, 0.2), a);
	a = PMOsc.ar(\freq.kr(4000.rand), 4000.rand, a, 0, a/1.5);
	a = Pan2.ar(a, -0.7);

	\amp.kr(0.7).lag(1) * a *
	(\z3.bin > 0.5).lag(0.1);
} +> \albatross );
//:
~freqstream = {
	var freq;
	freq = Pbrown(150, 8000, 300, inf).asStream;
	 inf do: { | i |
		(freq: freq.next) ++> \albatross;
		0.05.wait;
	}
}.fork;
//:
~freqstream.stop
//:
(freq: 1800) ++> \albatross;
(freq: 258) ++> \albatross;
//:
(amp: 0.001) ++> \albatross;
(amp: 0.51) ++> \albatross;
//========== NOISE ==========//
//:albatross
({
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10);
	// frq = MouseY.kr(1, 10);		// test

	a = PinkNoise.ar(0.7);
	a = SinOsc.ar(frq) * a;
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(1.0).lag(1) * a *
	(\z3.bin > 0.5).lag(1);
} +> \albatross )
//:
(amp: 0.91) ++> \albatross;
(amp: 0.00091) ++> \albatross;
//========== SAMPLE & HOLD ==========//
//:albatross
({
	var frq;
	frq = \x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseY.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	c = c * 1000 + 100;
	c = Lag.ar(c, 0.05);
	a = PMOsc.ar(c, c, 4);
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -6.dbamp);
	a = Pan2.ar(a, -0.7);

	\amp.kr(0.5).lag(1) * a *
	(\z4.bin > 0.5).lag(1);
} +> \albatross3 )
//:
\albatross.stop(2);
\albatross2.stop(5);
// \phoenix.stop;
// \phoenix.stop;