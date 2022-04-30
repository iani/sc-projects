/* 30 Apr 2022 07:36
Dancing Dots`
*/
/* by  nathaniel virgo */
//:
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a} +> \dancing_dots;
//:
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([
	\sawl.kr(2), \sawr.kr(3)
],0.2),2**LFNoise0.kr(
	\noisea.kr(4/3), \noiseb.kr(4))*300,0.1).distort,2,2,40));a} +> \dancing_dots;
//:
\noisea <+.dancing_dots (4/3);
//:
\noiseb <+.dancing_dots (9);
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