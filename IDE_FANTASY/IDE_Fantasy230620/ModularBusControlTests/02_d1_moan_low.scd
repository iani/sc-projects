/* 22 Dec 2022 18:21
freq and amp are controls reading from busses local to the players envir.
One can write to these busses from another source, including a sensor
input source.  For example:

read from x2 sensor bus, write to freq bus of player d1:
{ \x2.sr.lin(36, 48).midicps } @>.d1 \freq;

read from z2 sensor bus, write to amp bus of player d1:
{ (\z2.sr > 0.5).lag(1) * 0.1 } @>.d1 \amp;
*/
{
	a = SinOsc.ar(
	\freq.br(400), 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * \amp.br(0.1);
} +> \d1;
