SynthDef('soto_test',{
	var car, onda, mod,mod1,env;
	env=EnvGen.kr(Env.linen(3,1,2));
	mod1=SinOsc.kr(6,0,1000);
	mod=SinOsc.kr(450+mod1,0,100)*SinOsc.kr(0.1,0,1);
	car=SinOsc.ar(80+mod,0,0.2);
	onda=Saw.ar(120,0.2);
	Out.ar(0,(car+onda)*env!2);
}).add