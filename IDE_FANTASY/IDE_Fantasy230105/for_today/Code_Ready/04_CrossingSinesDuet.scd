/*  5 Jan 2023 13:23

*/
//:
0.1 @>.jun \amp;
0.1 @>.asayo \amp;

{
	SinOsc.ar(\freq.br(200)).dup.fader * (\z5.sr > 0.5).lag(1);
} +> \jun;

{
	SinOsc.ar(\freq.br(200 * 8)).dup.fader *(\z6.sr > 0.5).lag(1);
} +> \asayo;


//:
{ XLine.kr(200, 200 * 8, 180) } @>.jun \freq;
{ XLine.kr(200 * 8, 200, 180) } @>.asayo \freq;

//:

{
	SinOsc.ar(\freq.br(600)).dup.fader * (\z7.sr > 0.5).lag(1);
} +> \jun2;

{
	SinOsc.ar(\freq.br(650)).dup.fader *(\z6.sr > 0.5).lag(1);
} +> \asayo2;
