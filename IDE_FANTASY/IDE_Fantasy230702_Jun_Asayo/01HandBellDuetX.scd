/*  2 Jul 2023 16:20
Handbell duet with x control.
*/
//:Jun left hand
{
	SinOsc.ar(\freq.br(200)).dup.fader(amp:0.05) * \amp2.br(1) * (\x1.sr > 0.5).lag(1);
} +> \jun1;
//:Jun right hand
{
	SinOsc.ar(\freq.br(300)).dup.fader(amp:0.05) * (\x2.sr > 0.5).lag(1);
} +> \jun2;
//:Asayo left hand
{
	SinOsc.ar(\freq.br(400)).dup.fader(amp:0.05) * (\x3.sr > 0.5).lag(1);
} +> \asayo1;
//:Asayo right hand
{
	SinOsc.ar(\freq.br(500)).dup.fader(amp:0.05) * (\x4.sr > 0.5).lag(1);
} +> \asayo2;

//:changing the notes:
(200 * 2.rrand(8)) @>.jun1 \freq;
(200 * 2.rrand(8)) @>.jun2 \freq;
(200 * 2.rrand(8)) @>.asayo1 \freq;
(200 * 2.rrand(8)) @>.asayo2 \freq;

//:changing the notes 2:
(2000 / 2.rrand(8)) @>.jun1 \freq;
(2000 / 2.rrand(8)) @>.jun2 \freq;
(2000 / 2.rrand(8)) @>.asayo1 \freq;
(2000 / 2.rrand(8)) @>.asayo2 \freq;

//:changing the notes 3:
(200 * 2.rrand(8)) @>.jun1 \freq;
(2000 / 2.rrand(8)) @>.jun2 \freq;
(200 * 2.rrand(8)) @>.asayo1 \freq;
(2000 / 2.rrand(8)) @>.asayo2 \freq;

//:testing
\x1.sensorbus.set(1);
\x1.sensorbus.set(0);
//:all on
\x1.sensorbus.set(1);
\x2.sensorbus.set(1);
\x3.sensorbus.set(1);
\x4.sensorbus.set(1);
//
{ Decay.kr(Impulse.kr(1)) * 1 } @>.jun1 \amp2;
{ Decay.kr(Impulse.kr(1.5)) * 1 } @>.jun1 \amp2;
{ Decay.kr(Impulse.kr(2)) * 1 } @>.jun1 \amp2;
{ Decay.kr(Impulse.kr(5)) * 1 } @>.jun1 \amp2;
{ Decay.kr(Impulse.kr(Line.kr(1, 15, 20))) * 1 } @>.jun1 \amp2;
{ Decay.kr(Impulse.kr(Line.kr(15, 1, 20))) * 1 } @>.jun1 \amp2;
