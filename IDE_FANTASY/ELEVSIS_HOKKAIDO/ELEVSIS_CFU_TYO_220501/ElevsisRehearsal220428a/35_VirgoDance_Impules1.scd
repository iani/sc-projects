/* by  nathaniel virgo this one has beat !!! */
//:
n={|r,f,d=1|2**LFNoise0.kr(1!d,r)*f};
{p=n.(4,1e3); 0.5 * CombN.ar(Ringz.ar(LFPulse.ar(1,0,0.01),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2} +> \phoenix1;
//:
