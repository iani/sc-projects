/* 10 Apr 2022 11:00
Prototype for moving insidee a parameter range.

Dancers control dhe direction of the movement through x or z sensor values.
small sensor value: move from high parameter value to low parameter value
high sensor value: mover from low parameter value to high parameter value.

Must
*/
//: From: https://doc.sccode.org/Classes/Phasor.html

{ var trig, rate, x, sr;
    // rate = MouseX.kr(0.2, 2, 1);
	rate = \rate.kr(1);
    // trig = Impulse.ar(rate);
    trig = \trig.tr(0);
    sr = SampleRate.ir;
    x = Phasor.ar(trig, rate / sr);
    SinOsc.ar(
        [
            LinLin.kr(x, 0, 1, 600, 1000), // convert range from 0..1 to 600..1000
            1000 // constant second frequency
        ], 0, 0.02)

} +> \phasor;
//:
\rate <+.phasor 0.25; //
\rate <+.phasor 0.0; //
\rate <+.phasor -0.25; // change directino
\rate <+.phasor 5; // restart phasor from beginning
//:
{ WhiteNoise.ar(0.1).dup }.play;

//: adapting to range of sensestage

{ var trig, rate, x, sr;
    // rate = MouseX.kr(0.2, 2, 1);
	// rate = \rate.kr(1);
	rate = \z1.bin.linlin(0.46, 0.53, -1, 1);
    trig = \trig.tr(0); // set this to resta rt the phasor
    sr = SampleRate.ir;
    x = Phasor.ar(trig, rate / sr);
    SinOsc.ar(
        [
            LinLin.kr(x, 0, 1, 600, 1000), // convert range from 0..1 to 600..1000
            1000 // constant second frequency
        ], 0, 0.02)

} +> \phasor;
