odd numbers : timbre
even numbers : on-off
\x1 is not work

~sieve +> \tiCfNiki;
~sieve +> \tiCfXenia;

\pan <+.tiCfNiki -0.5;
\pan <+.tiCfXenia 0.5;

\amp <+.tiCfNiki 0;
\amp <+.tiCfXenia 0;

\amp <+.tiCfNiki 1;
\amp <+.tiCfXenia 1;

\range <+.tiCfNiki 20;
\range <+.tiCfXenia 20;

\range <+.tiCfNiki 12;
\range <+.tiCfXenia 12;

\itvA <+.tiCfNiki (3**(1/5));
\itvB <+.tiCfNiki (3**(1/7));
\itvC <+.tiCfNiki (3**(1/11));
\itvA <+.tiCfXenia (3**(1/5));
\itvB <+.tiCfXenia (3**(1/7));
\itvC <+.tiCfXenia (3**(1/11));

\itvA <+.tiCfNiki (2**(7/19));
\itvB <+.tiCfNiki (2**(3/19));
\itvC <+.tiCfNiki (2**(1/19));
\itvA <+.tiCfXenia (2**(7/19));
\itvB <+.tiCfXenia (2**(3/19));
\itvC <+.tiCfXenia (2**(1/19));

\mod <+.tiCfNiki 0.02;
\depth <+.tiCfNiki 50;

\mod <+.tiCfXenia 0.02;
\depth <+.tiCfXenia 50;

\mod <+.tiCfNiki (2**0.5);
\depth <+.tiCfNiki 2;

\mod <+.tiCfXenia (2**0.5);
\depth <+.tiCfXenia 2;

\tiCfNiki.stop(5);
\tiCfXenia.stop(5);

(
~sieve = {
	var amp = Slope.kr(
		// \z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// MouseY.kr(0, 1).lag(2)
	).abs.max(0.01).min(0.5);

	var range = \range.kr(12);

	var pch =
	// \z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, range).lag(2);
	// \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, range).lag(2);
	// MouseX.kr(0, range).lag(1);
	// MouseY.kr(0, range).lag(1);

	a = (pch/1.5 + 0.00).round;
	a = \itvA.kr(2**(7/19))**a;
	b = (pch + 0.33).round;
	b = \itvB.kr(2**(3/19))**b;
	c = (pch + 0.66).round;
	c = \itvC.kr(2**(1/19))**c;

	y = \root.kr(24).midicps*a*b*c;
	y.cpsmidi.poll(Changed.kr(y));
	y = y.lag(0.05);
	z = PMOsc.ar(y, y*\mod.kr(3), \depth.kr(0.2), 0, amp);
	z = CombN.ar(z, 0.2, 0.2, 0.5, 0.3, z);
	z = Pan2.ar(z, \pan.kr(0.0));

	\amp.kr(1.0).lag(5) * z;
	// z!2 * (\z2.bamp(0.1, 0.5) < 0.51) * \amp.kr(0.5); // ON-OFF
};
)