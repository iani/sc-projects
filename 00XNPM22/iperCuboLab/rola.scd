

~a = VBAPSpeakerArray.new(2, [-35,35,135,-135]);
~b = Buffer.loadCollection(s, ~a.getSetsAndMatrices);
"C:/Users/USUARIO/Desktop/UMRU_pad_loop_choppyvocoder_163_Dmin.wav"
~buf1=Buffer.read(s,"C:/Users/USUARIO/Desktop/UMRU_pad_loop_choppyvocoder_163_Dmin.wav");
~buf2=Buffer.read(s,"C:/Users/USUARIO/Desktop/UMRU_pad_loop_choppyvocoder_163_Dmin.wav");




SynthDef(\padcito1,{
	arg freq=1, amp=0.5,azi=90;
	var sig;
	sig=PlayBuf.ar(1,~buf1.bufnum,BufRateScale.kr(~buf1)*freq,doneAction:2);
	sig=VBAP.ar(4,sig,~b.bufnum,azi);
	Out.ar(2,sig*amp);
}).add;

SynthDef(\padcito2,{
	arg freq=1, amp=0.5,azi=(-90);
	var sig;
	sig=PlayBuf.ar(1,~buf2.bufnum,BufRateScale.kr(~buf2)*freq,doneAction:2);
	sig=VBAP.ar(4,sig,~b.bufnum,azi);
	Out.ar(2,sig*amp);
}).add;

SynthDef(\hat,{
	arg freq=1, amp=0.5,azi  , bufnum;
	var sig;
	sig=PlayBuf.ar(1,~hat2.bufnum,BufRateScale.kr(~hat2)*freq,doneAction:2);
	sig=VBAP.ar(4,sig,~b.bufnum,azi);
	Out.ar(2,sig*amp);
}).add;


SynthDef(\kick,{
	arg freq=1, amp=0.5,azi  , bufnum;
	var sig;
	sig=PlayBuf.ar(1,~kick.bufnum,BufRateScale.kr(~kick)*freq,doneAction:2);
	sig=VBAP.ar(4,sig,~b.bufnum,azi,1,100);
	Out.ar(2,sig*amp);
}).add;
SynthDef(\snare,{
	arg freq=1, amp=0.5,azi  , bufnum;
	var sig;
	sig=PlayBuf.ar(1,~snare.bufnum,BufRateScale.kr(~snare)*freq,doneAction:2);
	sig=VBAP.ar(4,sig,~b.bufnum,azi);
	Out.ar(2,sig*amp);
}).add;



~buf2.duration

s.makeWindow


s.meter

Pbind(
	\instrument,\hat,
	\freq,1,
	\amp,Pwhite(0.05,0.1,inf),
	\dur,1,
	\azi,Prand([30,0,-30,90,135,180,-135,-90],inf)
).play(TempoClock(163/60));


Pbind(
	\instrument,\padcito2,
	\freq,1,
	\amp,0.02,
	\dur, 23.558299319728

).play;

Pbind(
	\instrument,\padcito1,
	\freq,1,
	\amp,0.02,
	\dur, 23.558299319728

).play;
Pbind(
	\instrument,\snare,
	\dur,Pseq([
	Pseq([
		Rest(1),
		0.5,Rest(0.25),0.25,
		Rest(0.25),0.25,Rest(0.5),
		0.5,Rest(0.25),0.25
	],1),
	],inf),
	\amp,0.01,
	\freq,1,
		\azi,Prand([0,180],inf),
).play(TempoClock(163/60));
Pbind(
	\instrument,\kick,
	\dur,Pseq([
	Pseq([
		1,
		Rest(1),
		Rest(0.5),0.5,
		Rest(1)
	],1),
	],inf),
	\amp,0.025,
	\freq,1,
	\azi,0,
).play(TempoClock(163/60));
