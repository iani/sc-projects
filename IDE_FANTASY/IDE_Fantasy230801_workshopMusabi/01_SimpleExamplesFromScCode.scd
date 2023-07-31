/* 31 Jul 2023 13:42

*/
//:
(
Ndef(\simpleRunningWater).fadeTime = 4;


Ndef(\simpleRunningWater, {
	var mod, freq, ampMod, src;

	mod = {LFNoise0.ar(170)}!2;

	freq = mod.linexp(-1, 1, \lowFreq.kr(400, 8), 2400).lag(0.01); //  * Line.kr(1, 0.01, 40);
	ampMod = 0.5 + mod.linlin(-1, 1, 0.5, 0).lag(0.1);

	ampMod = ampMod * AmpComp.ar(freq);

	src = LPF.ar(SinOsc.ar(
		freq,
		0.6,
		ampMod
	), 4000);

	// src * LFPulse.ar(10);
	src

})
)
//:
Ndef(\simpleRunningWater).set(\lowFreq, 1000);
Ndef(\simpleRunningWater).xset(\lowFreq, 1000);
Ndef(\simpleRunningWater).gui

  {SinOsc.ar(LFNoiseO.kr(12).range(400, 1600), mul: 0.01)}.play;