/* 13 Nov 2022 21:55

*/
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(400), 0, 0.1).dup } +> \test;
//:
{ SinOsc.ar(\freq.br(400).lag(0.1), 0, 0.1).dup } +> \test;
//:
{ LFSaw.ar(\freq.br(400).lag(0.1) / 4, 0, 0.01).dup } +> \test;
//:
{ LFPulse.ar(\freq.br(400).lag(0.1) / 5, 0.0, 0.5, 0.01).dup } +> \test;
//:
{ LFPulse.ar(\freq.br(400).lag(0.01) / 5, 0.0, 0.5, 0.01).dup } +> \test;
//:
{ LFPulse.ar(\freq.br(400).lag(0.01) / 8, 0.0, 0.5, 0.01).dup } +> \test;
//:
{ LFPulse.ar(\freq.br(400).lag(0.01) / 18, 0.0, 0.5, 0.01).dup } +> \test;
//:
{ LFPulse.ar(\freq.br(400).lag(0.01) / 48, 0.0, 0.5, 0.01).dup } +> \test;
//:prepare amplitude filtering with slope
{ LFPulse.ar(\freq.br(400).lag(0.01) / 48, 0.0, 0.5, \amp.br(0.1) * 0.1).dup } +> \test;
//:prepare amplitude filtering with slope
{ SinOsc.ar(\freq.br(400).lag(0.01) / 18, 0.0, \amp.br(0.1) * 0.1).dup } +> \test;
//:
'/HR_datum_filt'>>> { | n, msg |
	msg.postln;
}
//:
'/HR_datum_filt'>>> { | n, msg |
	// msg.postln;
}
//:
'/HR_datum_filt'>>> { | n, msg |
	msg[1].linlin(-5, 5, 400, 2000) @>.test \freq;
}
//:
'/HR_datum_filt'>>> { | n, msg |
	msg[1].linlin(-5, 5, 400, 2000) @>.test \freq;
}
//:
'/HR_datum_filt'>>> { | n, msg |
	msg[1].linlin(-50, 50, 100, 2000) @>.test \freq;
}
//:
'/HR_datum_filt'>>> { | n, msg |
	msg[1].linlin(-20, 20, 50, 1000) @>.test \freq;
}
//:
'/HR_datum_filt' >>> { | n, msg |
	msg[1].linlin(-50, 50, 150, 10000) @>.test \freq;
}
//:
'/HR_datum_filt' >>>.amp { | n, msg |
	msg[1] @>.sensors \rawheart;
};
{ \rawheart.sr > 0 } @>.test \amp;
//:
{ (\rawheart.sr > 0.5) + (\rawheart.sr < -0.5) } @>.test \amp;
//:
{ (\rawheart.sr > 1500.9) + (\rawheart.sr < -1500.9) } @>.test \amp;
//:
'/HR_datum_filt' >>>.amp { | n, msg |
	msg[1] > 0 @>.test \amp;
}
//:
//:
(dur: 0.1) +> \test;

//:
OSC.trace;
//:
OSC.untrace;
//:
\test.stop;