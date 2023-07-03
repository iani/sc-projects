/* 27 Oct 2022 16:48
*/
//:[0.1]
{ WhiteNoise.ar(0.1).dup } +> \test;
//:[x]
\test stop: 0.05;
//:[0.10]
{ PinkNoise.ar(0.1).dup } +> \test;
//:No time at all!!!
\test stop: 0.05;
//0.10:
{ GrayNoise.ar(0.1).dup } +> \test;
//:[3]
(degree: (0..10).prand, dur: 0.1) +> \test2;
//:[5.106445] // fixed
\test stop: 5;
(degree: (20..40).prand) ++> \test2;
//:
\test2.stop;