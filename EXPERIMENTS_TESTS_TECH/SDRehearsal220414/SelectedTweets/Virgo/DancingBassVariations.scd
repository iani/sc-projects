/* by  nathaniel virgo */ // dancing bass
play{w=LFSaw;a=w.ar(-3,1)+1/2;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2}
// Rantou: OK
{w=LFSaw;a=w.ar(-3,1)+1/2;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;


// timbre variations
{w=LFSaw;a=w.ar(-3,1)+1/2;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+1/(2.1);f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;

{w=LFSaw;a=w.ar(-3,1)+1/3;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+1/4;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
// pattern / rhythm variations
{w=LFSaw;a=w.ar(-3,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-2,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-1,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-0.5,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-0.25,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;

{w=LFSaw;a=w.ar(-5,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;

{w=LFSaw;a=w.ar(-3,1)+1/3;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*70,0.5).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+1/3;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*70,0.5).tanh,2/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+1/3;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*70,0.5).tanh,1/6,3/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+1/5;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*70,0.5).tanh,1/6,3/6,6)!2} +> \vdb;

//: basic control timbre by dancer

{
	w=LFSaw;a=w.ar(-3,1)
	+
	// \timbre.kr(1/5);
	\x1.bin.linlin(0.44, 0.54, 1/1, 1/20);
	f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2
	* 0.01;
} +> \vdb;
//: basic control timbre by dancer
\timbre <+.vdb 1/5;
//:


{
	w=LFSaw;a=w.ar(-3,1)
	+
	\z1.bin.linlin(0.44, 0.54, 1/2, 1/5);
	f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2

} +> \vdb;
//:

// dangerous
{w=LFSaw;a=w.ar(-3,1)+0.99.reciprocal;f=Sweep.ar(0,3).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;

{w=LFSaw;a=w.ar(-3,1)+3.reciprocal;f=Sweep.ar(0,4).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;
{w=LFSaw;a=w.ar(-3,1)+3.reciprocal;f=Sweep.ar(1,4).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;

{w=LFSaw;a=w.ar(-3,1)+3.reciprocal;f=Sweep.ar(0,4).floor;f=(f**3+f%8+4)*(f%3+3)%49*3;CombN.ar(RLPF.ar(w.ar(f)*a,f**a*30,0.3).tanh,5/6,5/6,6)!2} +> \vdb;