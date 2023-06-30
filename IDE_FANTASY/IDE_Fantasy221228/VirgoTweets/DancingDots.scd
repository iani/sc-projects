//ORIGINAL:
//
/* by  nathaniel virgo "DANCING DOTS" */
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a}.play//#supercollider

//: playing into player
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a
} +> \dancing_dots;
//: playing into player - new tempo
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(8/3,4)*300,0.1).distort,2,2,40));a
} +> \dancing_dots;
//: playing into player - new tempo + freq
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(8/3,4)*600,0.1).distort,2,2,40));a
} +> \dancing_dots;
//:
