/* 12 Nov 2022 16:35

*/
//:
a = \x.scope;
b = \y.scope;
{ SinOsc.kr(2) } @> \x;
{ LFSaw.kr(1/15) } @> \y;
