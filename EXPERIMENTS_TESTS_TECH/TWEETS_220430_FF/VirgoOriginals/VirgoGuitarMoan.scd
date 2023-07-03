/* by  nathaniel virgo */
Ndef(\,{LPF.ar(x=DelayN.ar(LeakDC.ar(Ndef(\).ar,1-2e-6)*0.99,1,0.01)+Dust.ar(0.5!2);x+(Trig1.ar(x<(x.mean.lag(30)),4e-3)*0.05),800)}).play
