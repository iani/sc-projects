/*  7 Jul 2023 11:51
Filtering input from other ugens.
*/
//:whitenoise @> ringz_
{ WhiteNoise.ar(0.1) +> Ringz_ } +> \test;
//:set ring freq
800 @>.test \ringfreq;
//:set ring time
1.0 @>.test \ringtime;
//:set ring time 0.001
0.001 @>.test \ringtime;
//:set ring time 0.002
0.002 @>.test \ringtime;
//:set ring freq lfnoise0
{ LFNoise0.kr(10).range(100, 2000) } @>.test \ringfreq;
//:whitenoise @> resonz_
{ WhiteNoise.ar(0.1) +> Resonz_ } +> \test2;
//:set rq 0.2
0.2 @>.test2 \rq;
//:line set rq 0.2
{ Line.kr(0.01, 0.9, 60) } @>.test2 \rq;
//:lfnoise0 -> ringfreq
{ LFNoise0.kr(10).range(100, 2000) } @>.test2 \ringfreq;
//:lfnoise0 -> ringfreq
{ LFNoise1.kr(10).range(100, 2000) } @>.test2 \ringfreq;
//:set rq 2
2 @>.test2 \rq;
//:set rq 10
10 @>.test2 \rq;
//:set rq lfnoise0
{ LFNoise0.kr(20).range(0.01, 20) } @>.test2 \rq;
//:set rq lfnoise1
{ LFNoise1.kr(20).range(0.01, 20) } @>.test2 \rq;
//:set rq lfnoise1 1
{ LFNoise1.kr(1).range(0.01, 20) } @>.test2 \rq;
//:set ringfreq to 1000
5000 @>.test2 \ringfreq;
//:line 0.01, 20, 60
{ Line.kr(0.01, 20, 60) } @>.test2 \rq;
//:line 0.01, 1, 60
{ Line.kr(0.01, 1, 60) } @>.test2 \rq;
//:
1 @>.test2 \rq;
{ LFNoise0.kr(10).range(100, 5000) } @>.test2 \ringfreq;
//:
1 @>.test2 \rq;
{ LFNoise1.kr(10).range(100, 5000) } @>.test2 \ringfreq;
