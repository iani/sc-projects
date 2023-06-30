/* 20 Nov 2022 00:01
Can Slope distinguish the direction of movement?
increasing values > 0;
decreasing values < 0;
	???
*/
//:
{
	var src, slope;
	src = Line.kr(0, 10000 / 2, 10000);
	slope = Slope.kr(src);
	slope.poll;
	SinOsc.ar(400, 0, 0.1).dup } +> \slope;
//:
{
	var src, slope;
	src = Line.kr(10000 / 2, 0, 10000);
	slope = Slope.kr(src);
	slope.poll;
	SinOsc.ar(400, 0, 0.1).dup } +> \slope;
//: