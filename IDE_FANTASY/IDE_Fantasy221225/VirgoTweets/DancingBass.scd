/*  1 Nov 2022 18:29
/* by  nathaniel virgo */ // dancing bass
// original!
{w=LFSaw;a=w.ar(-3,1)+1/2;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \dancing_bass;


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 It is worth jamming for a long while with these parameters, while recording the sound
direct to disc and the code to OSC data recording.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

*/
//:original in player - see below for a variation with different initial values!
{w=LFSaw;a=w.ar(-3,1)+1/2;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \dancing_bass;
//:adding controls
{
	w=LFSaw;
	a=w.ar(\sawfreq.br(-3),\sawphase.br(1))+1/2;
	f=Sweep.ar(0,\sweeprate.br(3)).floor;
	f=(f**3+f%8+4)*(f%3+3)%\modulo.br(49)*\fexp.br(3);
	CombN.ar(RLPF.ar(w.ar(f)*a,f**a*\rlpfexp.br(30),\rlpfq.br(0.3)).tanh,5/6,(5/6).min(\decaytime.br(5/6)),6)!2
} +> \dancing_bass;
//:
-0.5> \sawfreq;
//:
-1> \sawfreq;
//:
-2 @> \sawfreq;
//:
-3 @> \sawfreq;
//:
-10 @> \sawfreq;
//:
-5 @> \sawfreq;
//:
-0.01 @> \sawfreq;
//:
-0.1 @> \sawfreq;
//:
30 @> \sweeprate;
//:
10 @> \sweeprate;
//:
0.3 @> \sweeprate;
//:
nil @> \sawfreq;
//:
{ Line.kr(-3, -0.1, 90) } @> \sawfreq;
//:
0.01 @> \sawphase;
//:
10 @> \rlpfexp;
//:!!!!!!!!!!!!! Soft sound
1 @> \rlpfexp;
//:An interesting combination + Soft sound
1 @> \rlpfexp;
0.2/6 @> \decaytime;
10.1 @> \rlpfq;
//:modulo
49/2 @> \modulo;
//:fexp !!! the sequece 3, 4, 5, 6 has good results
3 @> \fexp;
//:fexp !!!
4 @> \fexp;
//:fexp !!!
5 @> \fexp;
//:fexp !!!
6 @> \fexp;
//:fexp !!! 12
12 @> \fexp;
//:
15 @> \fexp;
//:fexp 0.12 -> sink into silence
0.12 @> \fexp;
//:fexp line sweep
{ Line.kr(0.1, 36, 69) } @> \fexp;
//:fexp 0noise +
{ LFNoise0.kr(0.2).range(0.1, 36) } @> \fexp;
{ LFNoise2.kr(0.1).range(-0.1, -36) } @> \sawfreq;
//:
nil @> \sawfreq;
nil @> \fexp;
//:
20 @> \rlpfexp;
//:
20 @> \rlpfexp;
//:
120 @> \rlpfexp;
//:
5 @> \rlpfexp;
//:!!!!!!!!!!!!!!!!!!!!!
10.1 @> \rlpfq;
//:
5.1 @> \rlpfq;
//:combine this with 1 @> \rlpfexp!
0.2/6 @> \decaytime;
//:
5.9/6 @> \decaytime;
//:
6/6 @> \decaytime;
//:
16/6 @> \decaytime;
//:
{ Line.kr(0.2/6, 5.5/6, 90) } @> \sawfreq;
//:
nil @> \sawfreq;
//:
{ Line.kr(0.02/6, 5.5/6, 90) } @> \decaytime;
//:
//:trying values for softer sound!
// not done yet! look into rlpfexp, rlpfq and sawfreq!
{
	w=LFSaw;
	a=w.ar(\sawfreq.br(-3),\sawphase.br(1))+1/2;
	f=Sweep.ar(0,\sweeprate.br(3)).floor;
	f=(f**3+f%8+4)*(f%3+3)%49*\fexp.br(3);
	CombN.ar(RLPF.ar(w.ar(f)*a,f**a*\rlpfexp.br(30),\rlpfq.br(0.3)).tanh,5/6,(5/6).min(\decaytime.br(5/6)),6)!2
} +> \dancing_bass;
