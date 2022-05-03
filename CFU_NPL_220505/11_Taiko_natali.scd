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
		\z3.bin.linlin(0.46, 0.54, 0.5, 2).round(1),
		0,0.01
	),n.(2,p,80),0.6).sum,8/5,8/5,60)*4e-4!2;
	sig = sig * \z4.bin.linexp(0.46, 0.54, 0.001, 0.9);
	sig = sig * \amp.kr(1);
	Limiter.ar(sig, 0.5);
} +> \natali;
//:
// \z <+.natali 0.15;

//:
// \z <+.natali 2;
