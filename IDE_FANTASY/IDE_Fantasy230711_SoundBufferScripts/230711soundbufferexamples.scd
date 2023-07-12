/* 11 Jul 2023 23:02

*/
//:could be used with sensors controlling the startpos.
\fones @@.loopbuf (rate: 0.4, startpos: 0.16, loopdur: 0.15);
{ LFNoise0.kr(0.3.reciprocal).range(0, 3) } @>.fones \startpos;
//: