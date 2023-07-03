/* 21 Feb 2022 14:29

*/
{ WhiteNoise.ar(0.1) } +> \test;
//:
(degree: 1) +> \test;
(degree: 10) ++> \test;
(degree: (-5..5).pseq) ++> \test;
//:
(dur: 0.15) ++> \test;
//:
(dur: 0.1) ++> \test;
(dur: 1) ++> \test;
//:
\test.start;
//:
e respondsTo: \addEvent;
~test.start;