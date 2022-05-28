odd numbers : timbre
even numbers : on-off
\x1 is not work

// Scene 3 : Xenia #1, #2 / Niki #3, #4

\amp <+.tiSieve 0.3;
\amp <+.tiSieveB 0.3;

\amp <+.tiSieve 1;
\amp <+.tiSieveB 1;

\root <+.tiSieve 24;
\root <+.tiSieve 24;

\range <+.tiSieve 20;
\range <+.tiSieveB 20;

\itvA <+.tiSieve (3**(1/5));
\itvB <+.tiSieve (3**(1/7));
\itvC <+.tiSieve (3**(1/11));

\itvA <+.tiSieve (2**(7/19));
\itvB <+.tiSieve (2**(3/19));
\itvC <+.tiSieve (2**(1/19));

\mod <+.tiSieveB 0.02;
\depth <+.tiSieveB 50;

\mod <+.tiSieve (2**0.5);
\depth <+.tiSieve 2;

\mod <+.tiSieve 3;
\depth <+.tiSieve 0.2;


\tiSieve.stop(10);
\tiSieveB.stop(10);

(
/*{
	a = EnvGen.ar(Env.sine(5), doneAction:2);
	a = LFNoise0.ar(1000, a/10);
	\amp.kr(1) * a!2;
} +> \tiSig;*/

{
	// var lh = \z1; var rh = \x2;
	var lh = \x3; var rh = \x4;

	var range = \range.kr(4);

	var pch =
	lh.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, range).lag(2);
	// MouseX.kr(0, range).lag(1);

	var amp = Slope.kr(
		rh.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseY.kr(0, 1).lag(2)
	).abs.max(0.05).min(0.5);

	a = (pch + 0.00).round; a = \itvA.kr(2**(7/19))**a;
	b = (pch + 0.33).round; b = \itvB.kr(2**(3/19))**b;
	c = (pch + 0.66).round; c = \itvC.kr(2**(1/19))**c;

	y = \root.kr(48).midicps*a*b*c;
	// y.cpsmidi.poll(Changed.kr(y));
	y = y.lag(0.05);
	z = PMOsc.ar(y, y*\mod.kr(3), \depth.kr(0.7), 0, amp);
	z = CombN.ar(z, 0.2, [0.23, 0.27], 0.5, 0.3, z);

	\amp.kr(0.2).lag(2) * z;
	// z!2 * (\z2.bamp(0.1, 0.5) < 0.51) * \amp.kr(0.5); // ON-OFF
// } +> \tiSieve;
	} +> \tiSieveB;
)
