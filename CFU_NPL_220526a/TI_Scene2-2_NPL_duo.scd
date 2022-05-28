// Scene 2-2 : Elli #7, Stefania #8

Project.gui;

(
{
	var sensor = \x7;
	// var sensor = \x8;

	var range = \range.kr(24);

	var frq = Slope.kr(
		sensor.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(1)
	).abs.max(0.01).min(1);

	var pch =
	sensor.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, range).lag(2);
	// MouseX.kr(0, range).lag(1);

	a = (pch + 0.00).round; a = \itvA.kr(2**(4/18))**a;
	b = (pch + 0.50).round; b = \itvB.kr(2**(1/18))**b;
	x = \root.kr(24).midicps*a*b;

	c = Impulse.kr(frq * \mul.kr(15));
	d = Array.fill(7, {|n|
		e = PulseDivider.kr(c, 7, n*3%7);
		f = EnvGen.ar(Env.perc(0.01, 0.7), e);
		g = Latch.kr(x, e);
		PMOsc.ar(g, 3.5*g, f*3, 0, f);
	});
	z = Splay.ar(d);
	z = CombN.ar(z, 0.1, 0.1, 1);

	\amp.kr(0.6).lag(1) * z;
} +> \tiBell;
)

(
{
	var sensor = \x8;
	// var sensor = \x7;

	var frq = Slope.kr(
		sensor.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseY.kr(0, 1).lag(1)
	).abs.max(0.01).min(1);

	a = Impulse.ar(frq * \mul.kr(10));
	a = EnvGen.ar(Env.perc(0, 0.5), a);
	a = SinOsc.ar(a**30*3000+60, 0, a/2);
	a = HPF.ar(a, 50);
	b = (\root.kr(46) + [0, 5, 10]).midicps.reciprocal;
	c = CombN.ar(a, 0.1, b, 0.7, 0.5);
	a = Splay.ar(c) + a;

	\amp.kr(0.8).lag(1) * a;
} +> \tiKick;
)

\mul <+. tiKick 8;

(
\tiBell.stop(5);
\tiKick.stop(5);
)