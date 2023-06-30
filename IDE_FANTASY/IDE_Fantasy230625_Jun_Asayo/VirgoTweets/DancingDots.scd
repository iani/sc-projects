//ORIGINAL:
//
/* by  nathaniel virgo "DANCING DOTS" */
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a}.play//#supercollider

//: playing into player
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2
		**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));
	a * \amp.br(0.1)
} +> \dancing_dots;
//: playing into player
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2
		**LFNoise0.kr(\beats.br(4/3),4)*300,0.1).distort,2,2,40));
	a * \amp.br(0.1)
} +> \dancing_dots;
//: playing into player
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2
		**LFNoise0.kr(\beats.br(4/3),4)*\mul.br(300),0.1).distort,2,\dt.br(2),40));
	a * \amp.br(0.1)
} +> \dancing_dots;
//:
0.015 @>.dancing_dots \amp;
//:
28/3 @>.dancing_dots \beats;
//:
1/30 @>.dancing_dots \beats;
//:
500 @>.dancing_dots \mul;
//:
1 @>.dancing_dots \dt;
//:
1.5 @>.dancing_dots \dt;
//: playing into player - new tempo
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(8/3,4)*300,0.1).distort,2,2,40));a
} +> \dancing_dots;
//: playing into player - new tempo + freq
{
	LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(8/3,4)*600,0.1).distort,2,2,40));a
} +> \dancing_dots;
//:
