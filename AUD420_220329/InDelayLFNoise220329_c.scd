// { DelayC.ar(In.ar(2), 10, \dt.kr(0.1), 0.1) } +> \test;
// { DelayC.ar(In.ar(2), 10, LFDNoise1.kr(2).range(0.01, 9.00), 0.5) } +> \test;
{ DelayC.ar(In.ar(2), 10, LFDNoise1.kr(0.5).range(0.01, 9.00), 0.5) } +> \test;
// { DelayC.ar(In.ar(2), 10, LFDNoise0.kr(5).range(0.01, 0.5), 0.5) } +> \test;
