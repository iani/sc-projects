/* by  nathaniel virgo dingy lamarina dance */o
// !!!!!!!! Did not figure out this one yet.
/* // original
n={|r,f,d=1|2**LFNoise0.kr(1!d,r)*f};{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2}.play
*/
//:analysis iteration 1
n={|r,f,d=1|2**LFNoise0.kr(1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;
//:double tempo
n={|r,f,d=1|4**LFNoise0.kr(1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;
//:double double tempo
n={|r,f,d=1|8**LFNoise0.kr(1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;
//:double double tempo
n={|r,f,d=1|8**LFNoise0.kr(1!d,r)*f};
{p=n.(2,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;
//:double double tempo
n={|r,f,d=1|8**LFNoise0.kr(1!d,r)*f};
{p=n.(2,1e3);CombN.ar(Ringz.ar(LFPulse.ar(4,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;
//:another take
n={|r,f,d=1|2**LFNoise0.kr(0.1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;

//:another take
n={|r,f,d=1|2**LFNoise1.kr(0.1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \lamarinadance;
//:a third take
n={|r,f,d=1|2**LFNoise0.kr(1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,4/5,16/5,60)*4e-4!2} +> \lamarinadance;
//:a third take
n={|r,f,d=1|2**LFNoise0.kr(1!d,r)*f};
{p=n.(4,1e3);CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,4/5,16/5,60)*4e-4!3} +> \lamarinadance;