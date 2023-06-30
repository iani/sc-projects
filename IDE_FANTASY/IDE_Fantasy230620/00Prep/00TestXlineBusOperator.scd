/* 20 Jun 2023 09:13

*/

//:========= PART 1 : BASIC TEST
//:
0.04 @>.jun \amp;
//:
{
	SinOsc.ar(\freq.br(200)).dup.fader;
} +> \jun;
//:
{ XLine.kr(200, 200 * 8, 80) } @>.jun \freq;

//:========= PART 2 : ENRICHING VARIATIONS
//:
{
	SinOsc.ar(\freq.br(200) * [1, 1.001]).fader;
} +> \jun;
//:
{
	SinOsc.ar(\freq.br(200) * [1, LFNoise1.kr(0.5).range(1.2, 1.21)],
		mul: 0.04
	);
} +> \jun;
//: