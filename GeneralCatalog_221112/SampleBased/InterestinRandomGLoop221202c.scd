/*  2 Dec 2022 22:46
Alternative formulationx of previous loops?

*/

{
	\g.playbuf((rate: 0.2 exprand: 12.5, loop: 1));
	0.1.exprand(1.2);
} **> \x;
//:
\x.stop;
\g.stop(10);
//:
{
	\g.playbuf((rate: 0.2 exprand: 5.5, loop: 0), \g2);
	0.05.exprand(0.1);
} **> \y
//:
\y.stop;
\g2.stop(10);
//:
\x.stop;
//:
\y.stop;
//:
(dur: 	{0.1.exprand(0.5)}.pfunc, play: {
\g.playbuf((rate: 4.2 exprand: 5.5, loop: 0), \g3);
}) +> \z
//:
(dur: {	0.3.exprand(0.7)}.pfunc, play: {
\g.playbuf((rate: 4.2 exprand: 5.5, loop: 1), \g2);
}) +> \z1
//:
(dur: 	Pfunc({ 0.1.exprand(0.2) }), play: {
\g.playbuf((rate: 1.2 exprand: 5.5, loop: 1), \g2);
}) +> \z
//:
\z2.stop;
//: testing +>
(dur: {	0.3.exprand(0.7)}.pfunc, play: { \z1a.postln; }) +> \z1
//:
(dur: {	0.3.exprand(0.7)}.pfunc, play: { \z1b.postln; }) +> \z1
//:
\g.numChannels;
Buffer.all do: _.postln;
\soto_benjas_rave.buf.numChannels;
numChannels;

numChannels
