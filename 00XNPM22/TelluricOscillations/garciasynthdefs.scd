"Hello. This is GarciaSynthDefs loading now".postln;
(
//:
SynthDef(\drone1,{
	//arg;
	var sig, env, env1;
	Fader();
	env1=EnvGen.kr(Env.linen(1,300,1),doneAction:2);
	env=EnvGen.kr(Env.new(~voz,(5*60)/(~voz.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone1.bufnum,env);
	sig=sig*env1;
	sig=Pan2.ar(sig,0);
	Out.ar(0,sig);
}).add;

//:

SynthDef(\drone2,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(15,260,15,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz2,(5*60)/(~voz2.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone2.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.8);
	Out.ar(0,sig);
}).add;

SynthDef(\drone3,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(30,296.65,60,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz3,(5*60)/(~voz3.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone3.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.8);
	Out.ar(0,sig);
}).add;

SynthDef(\drone4,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(30,261,60,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz4,(5*60)/(~voz4.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone4.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.75);
	Out.ar(0,sig);
}).add;

SynthDef(\drone5,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(15,153,60,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz5,(5*60)/(~voz5.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone5.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.75);
	Out.ar(0,sig);
}).add;

SynthDef(\drone6,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(30,153,60,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz6,(5*60)/(~voz6.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone6.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0);
	Out.ar(0,sig);
}).add;

SynthDef(\drone7,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,107,60,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz7,(5*60)/(~voz7.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone7.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.5);
	Out.ar(0,sig);
}).add;

SynthDef(\drone8,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(15,175,30,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz8,(5*60)/(~voz8.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone8.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.3);
	Out.ar(0,sig);
}).add;

SynthDef(\drone9,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(5,153,15,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz9,(5*60)/(~voz9.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone9.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.3);
	Out.ar(0,sig);
}).add;

SynthDef(\drone10,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(5,152,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz10,(5*60)/(~voz10.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone10.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.2);
	Out.ar(0,sig);
}).add;

SynthDef(\drone11,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,142,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz11,(5*60)/(~voz11.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone11.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.1);
	Out.ar(0,sig);
}).add;

SynthDef(\drone12,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(5,80,5,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz12,(5*60)/(~voz12.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone12.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.2);
	Out.ar(0,sig);
}).add;

SynthDef(\drone13,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(2,50,2,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz13,(5*60)/(~voz13.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone13.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-1);
	Out.ar(0,sig);
}).add;

SynthDef(\drone14,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(2,200,2,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz14,(5*60)/(~voz14.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone14.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,1);
	Out.ar(0,sig);
}).add;

SynthDef(\drone15,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(1,150,1,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz15,(5*60)/(~voz15.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone15.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0);
	Out.ar(0,sig);
}).add;

SynthDef(\drone16,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(1,135,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz16,(5*60)/(~voz16.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone16.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.9);
	Out.ar(0,sig);
}).add;

SynthDef(\drone17,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,120,20,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz17,(5*60)/(~voz17.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone17.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.9);
	Out.ar(0,sig);
}).add;

SynthDef(\drone18,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(5,130,5,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz18,(5*60)/(~voz18.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone18.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.8);
	Out.ar(0,sig);
}).add;

SynthDef(\drone19,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(2,160,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz19,(5*60)/(~voz19.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone19.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.8);
	Out.ar(0,sig);
}).add;

SynthDef(\drone20,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(3,130,6,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz20,(5*60)/(~voz20.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone20.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.75);
	Out.ar(0,sig);
}).add;

SynthDef(\drone21,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,100,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz21,(5*60)/(~voz21.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone21.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.75);
	Out.ar(0,sig);
}).add;

SynthDef(\drone22,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,105,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz22,(5*60)/(~voz22.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone22.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.5);
	Out.ar(0,sig);
}).add;

SynthDef(\drone23,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,100,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz23,(5*60)/(~voz23.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone23.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.5);
	Out.ar(0,sig);
}).add;

SynthDef(\drone24,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(10,100,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz24,(5*60)/(~voz24.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone24.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0);
	Out.ar(0,sig);
}).add;

SynthDef(\drone25,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(3,78,10,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz25,(5*60)/(~voz25.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone25.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0);
	Out.ar(0,sig);
}).add;

SynthDef(\drone26,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(3,70,3,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz26,(5*60)/(~voz26.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone26.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0);
	Out.ar(0,sig);
}).add;

SynthDef(\drone27,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(3,90,15,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz27,(5*60)/(~voz27.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone27.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-0.5);
	Out.ar(0,sig);
}).add;

SynthDef(\drone28,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(5,90,15,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz28,(5*60)/(~voz28.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone28.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,0.5);
	Out.ar(0,sig);
}).add;

SynthDef(\drone29,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(15,80,30,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz29,(5*60)/(~voz29.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone29.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,-1);
	Out.ar(0,sig);
}).add;

SynthDef(\drone30,{
	arg amp=1;
	var sig, env, env1;
	env1=EnvGen.kr(Env.linen(5,90,20,1,\sine),doneAction:2);
	env=EnvGen.kr(Env.new(~voz30,(5*60)/(~voz30.size-1))).poll;
	sig=PlayBuf.ar(1,\Garcia_drone30.bufnum,env);
	sig=sig*env1;
	sig=sig*amp;
	sig=Pan2.ar(sig,1);
	Out.ar(0,sig);
}).add;);

"Hello.  GarciaSynthDefs HAS FINISHED LOADING".postln;