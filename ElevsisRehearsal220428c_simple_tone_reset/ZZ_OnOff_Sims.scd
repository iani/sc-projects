/* 30 Apr 2022 06:24

*/
//:!
{ WhiteNoise.ar(
	Demand.kr(Impulse.kr(10), 0, Dseq([Dwhite(0.001, 0.3, 1), 0], inf))
).dup } +> \test;
//:!
{ WhiteNoise.ar(
	Demand.kr(Dust.kr(10), 0, Dseq([Dwhite(0.001, 0.3, 1), 0], inf))
).dup } +> \test;
