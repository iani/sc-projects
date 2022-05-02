/* by  nathaniel virgo dingy lamarina dance */
//:
var n;
n = { | r, f, d = 1 |
	2**LFNoise0.kr(1!d,r)*f
};
{
	var sig;
	p=n.(4,1e3);
	sig = CombN.ar(Ringz.ar(LFPulse.ar(
		\z.kr(1),
		0,0.01
	),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2;


	sig;
} +> \natali;
//:
\pulse <+. 1.5;
