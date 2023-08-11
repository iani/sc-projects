/* 11 Aug 2023 13:50

*/
//:source jun 1
{
	SinOsc.ar(\freq.br(200)).dup.fader(amp: 0.05) * (\z1.sr > 0.5).lag(1);
} +> \jun;
//:source jun 1 - debug
{
	SinOsc.ar(\freq.br(600), 0, 0.1).dup * 1 // (\z1.sr > 0.5).lag(1);
} +> \jun;
//:source asayo 1
{
	SinOsc.ar(\freq.br(200 * 8)).dup.fader(amp:0.05) * (\z3.sr > 0.5).lag(1);
} +> \asayo;
//:source asayo 1 - debug;
{
	SinOsc.ar(\freq.br(200 * 8)).dup * 1 // * (\z3.sr > 0.5).lag(1);
} +> \asayo;
//:glissando jun
{ XLine.kr(200, 200 * 8, 180) } @>.jun \freq;
//:glissando asayo
{ XLine.kr(200 * 8, 200, 180) } @>.asayo \freq;
//:
//:source jun 1 - variation
{
	Mix(SinOsc.ar(\freq.br(200) *
		([5, 6, 7, 8] / 5 * { LFDNoise0.kr(0.5 rrand: 3.0).range(0.99, 1.1) } ! 4)
	)).dup.fader(amp: 0.05) * 0.1 * (\z1.sr > 0.5).lag(1);
} +> \jun;
//:source jun 1 - debug
{
	SinOsc.ar(\freq.br(600), 0, 0.1).dup * 1 // (\z1.sr > 0.5).lag(1);
} +> \jun;
//:source asayo 1
{
	SinOsc.ar(\freq.br(200 * 8)).dup.fader(amp:0.05) * (\z3.sr > 0.5).lag(1);
} +> \asayo;
//:source asayo 1 - debug;
{
	SinOsc.ar(\freq.br(200 * 8)).dup * 1 // * (\z3.sr > 0.5).lag(1);
} +> \asayo;
//:glissando jun
{ XLine.kr(200, 200 * 8, 180) } @>.jun \freq;
//:glissando asayo
{ XLine.kr(200 * 8, 200, 180) } @>.asayo \freq;
