/* 31 Oct 2022 08:43
For test purposes.
*/
{
	{ WhiteNoise.ar(0.1).dup } +> \test;
	1.wait;
	\test stop: 3;
}.fork;