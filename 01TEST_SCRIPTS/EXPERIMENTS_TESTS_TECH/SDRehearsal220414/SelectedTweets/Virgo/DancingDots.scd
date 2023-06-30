/* 30 Apr 2022 07:36
Dancing Dots`
*/
/* by  nathaniel virgo */
//:
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a} +> \dancing_dots;
//:
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([
	\sawl.kr(32), \sawr.kr(33)
],0.2),2**LFNoise0.kr(
	\noisea.kr(4/3), \noiseb.kr(4))*300,0.1).distort,2,2,40));a} +> \dancing_dots;
//:
\noisea <+.dancing_dots (5/3);
//:
\noisea <+.dancing_dots (4/3);
//:
\noiseb <+.dancing_dots (30.1);
//:
\noiseb <+.dancing_dots (4);
//:
\noiseb <+.dancing_dots (4.1);
//:
\sawr <+.dancing_dots 33;
//:
\sawl <+.dancing_dots 32;
//:
\sawr <+.dancing_dots 133;
//:
\sawl <+.dancing_dots 132;
//:
\sawr <+.dancing_dots 1;
//:
\sawl <+.dancing_dots 2;
//: