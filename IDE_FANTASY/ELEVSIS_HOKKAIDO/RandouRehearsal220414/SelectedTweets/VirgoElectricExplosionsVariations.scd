/* by  nathaniel virgo. electric explosions */
//:
{
	x=Saw.ar([50,50.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=Saw.ar([150,150.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([150,150.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([10,10.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([100,100.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([1000,1000.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),80**TRand.ar(0,1,Impulse.ar(f/32,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([1000,1200.1]);8.do{|i|f=2**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),10**TRand.ar(0,1,Impulse.ar(f/52,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([1000,1200.1]);8.do{|i|f=3**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),10**TRand.ar(0,1,Impulse.ar(f/52,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([1000,1200.1]);8.do{|i|f=5**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),10**TRand.ar(0,1,Impulse.ar(f/52,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
{
	x=SinOsc.ar([1000,1200.1]);8.do{|i|f=\hh.kr(2)**(8-i);
		x=BRF.ar(AllpassN.ar(x,1,0.1/(12-i),2),10**TRand.ar(0,1,Impulse.ar(f/52,1/2)).lag(1/f)*80,2)};
	x
} +> \ee;
//:
\hh <+.ee 1.0;
\hh <+.ee 1.8;
\hh <+.ee 2;
\hh <+.ee 3;
\hh <+.ee 4;
\hh <+.ee 5;
\hh <+.ee 6;
\hh <+.ee 7;
\hh <+.ee 8;
\hh <+.ee 9;
\hh <+.ee 10;
\hh <+.ee 20;
//
