/*  2 Apr 2022 16:12

*/
//:On when palm figers are pointing upwards
{
	SinOsc.ar(\x1.bin.linlin(0.47, 0.56, 400, 2000), 0, 0.1).dup
	* (\x1.bin < 0.5)
} +> \test;
//:On when palm figers are pointing downwards
{
	SinOsc.ar(\x1.bin.linlin(0.47, 0.56, 400, 2000), 0, 0.1).dup
	* (\x1.bin > 0.5)
} +> \test;
//:On when palm surface is turned upwards
// (figers are pointing forwards...)
{
	SinOsc.ar(\x1.bin.linlin(0.47, 0.56, 400, 2000), 0, 0.1).dup
	* (\z1.bin > 0.5)
} +> \test;
//:On when palm surface is turned downwards
// (figers are pointing forwards...)
{
	SinOsc.ar(\x1.bin.linlin(0.47, 0.56, 400, 2000), 0, 0.1).dup
	* (\z1.bin < 0.5)
} +> \test;
//: