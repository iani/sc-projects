/*  2 Jul 2023 16:15

*/
//:

{
	SinOsc.ar(\freq.br(200)).dup.fader(amp:0.05) * (\z1.sr > 0.5).lag(1);
} +> \jun;

{
	SinOsc.ar(\freq.br(200 * 8)).dup.fader(amp:0.05) * (\z3.sr > 0.5).lag(1);
} +> \asayo;


//:
{ XLine.kr(200, 200 * 8, 180) } @>.jun \freq;
{ XLine.kr(200 * 8, 200, 180) } @>.asayo \freq;

//: ???

{
	SinOsc.ar(\freq.br(600)).dup.fader(amp: 0.05) * (\z2.sr > 0.5).lag(1);
} +> \jun2;24{
	SinOsc.ar(\freq.br(650)).dup.fader(amp: 0.05) * (\z3.sr > 0.5).lag(1);
} +> \asayo2;
32/:Manual control of sensor busses
\z1.sensorbus.set(1);
\z2.sensorbus.set(1);
//:
\34.sensorbus.set(0);
\z2.sensorbus.set(0);