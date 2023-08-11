/* 12 Aug 2023 01:20

*/
//:
5 +>.test \fadeTime;
{ SinOsc.ar((50..90).midicps.choose, 0, 0.1 ).dup } +> \test;
