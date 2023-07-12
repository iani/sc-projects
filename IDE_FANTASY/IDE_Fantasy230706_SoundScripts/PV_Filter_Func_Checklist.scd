/*  7 Jul 2023 19:06
Checklist of PV_ filter functions coded for EditSoundPlayer
*/
//:MagAbove_ Fri  7 Jul 2023 19:07
//
//:MagBelow_ Fri  7 Jul 2023 19:07
//:---- TODO ----
// //[
//:   PV_MagShift
//   PV_Freeze
//   PV_MagDiv
//   PV_PlayBuf
//   PV_BinDelay
//   PV_JensenAndersen
//   PV_MagFreeze
//   PV_PitchShift
//   PV_DiffMags
//   PV_RecordBuf
//   PV_RandWipe
//   PV_MagSubtract
//   FFT
//   PV_BinFilter
//   PV_MagAbove
//     [ PV_MagClip PV_LocalMax PV_MagBelow ]
//   PV_Diffuser
//   PV_BinBufRd
//   PV_ExtractRepeat
//   PV_HainsworthFoote
//   PV_MagLog
//   PV_RectComb
//   PV_BinShift
//   PV_Whiten
//   PV_BufRd
//   PV_BinScramble
//   PV_NoiseSynthP
//     [ PV_PartialSynthF PV_NoiseSynthF PV_PartialSynthP ]
//   PV_OddBin
//     [ PV_EvenBin ]
//   PV_MagExp
//   Cepstrum
//     [ ICepstrum ]
//   PV_Invert
//   PV_MagSmooth
//   PV_MagMap
//   PV_BrickWall
//   FFTTrigger
//   PV_BinWipe
//   PV_SpectralMap
//   PV_MaxMagN
//     [ PV_MinMagN ]
//   PV_RandComb
//   PV_MagSquared
//     [ PV_PhaseShift270 PV_MagNoise PV_Conj PV_PhaseShift90 ]
//   PV_MagSmear
//   PackFFT
//   PV_MagBuffer
//     [ PV_FreqBuffer ]
//   PV_RectComb2
//   PV_PhaseShift
//   PV_MagMulAdd
//   PV_MagMul
//   [
//     PV_Max
//     PV_Mul
//     PV_Min
//     PV_CopyPhase
//     PV_Div
//     PV_Copy
//     PV_Add
//   ]
//   PV_BinPlayBuf
//   PV_SpectralEnhance
//   PV_ConformalMap
// ]
// ConvolutionL
// Convolution2L
//:==== END OF TODO
//:==== prototypes
//:   PV_MagShift
EditSoundPlayer().play((buf: \crickets, playfunc: \magshift, dur: 10000));
//:
-100 @>.s \shift;
//:
{ LFNoise1.kr(1).range(-500, 500) } @>.s \shift;
//:
{ LFNoise1.kr(7).range(-500, 500) } @>.s \shift;
//:
{ LFNoise1.kr(0.1).range(-500, 500) } @>.s \shift;
//:
1 @>.s \shift;
//:
0 @>.x \stretch;
//:Tests:
{
	PV_Plug.ar(
		\crickets.pbar,
		{ | chain | PV_MagAbove(chain, \thresh.br(1)) }
	)
} +> \test;
//: set threshold
10 @>.test \thresh;
//:test PV_MagShift
{
	PV_Plug.ar(
		\crickets.pbar,
		{ | chain | PV_MagShift(chain, \stretch.br(1), \shift.br(0)) }
	)
} +> \test;
//:change shift
0.1 @>.test \shift;
//:test PV_MagShift
2.0 @>.test \stretch;
//:test PV_MagShift
0.2 @>.test \stretch;
//:test PV_MagShift
{ LFNoise1.kr(0.2).range(0.2, 2) } @>.test \stretch;
//:test PV_MagShift
{ XLine.kr(1, 5, 20) } @>.test \stretch;
//:test PV_MagShift
{ XLine.kr(1, 0.1, 20) } @>.test \stretch;
//:test PV_MagShift
{ LFNoise1.kr(0.2).range(-100, 100) } @>.test \shift;
//:change shift
0.0 @>.test \shift;
//:test PV_MagShift
1.0 @>.test \stretch;
//:change shift
-100 @>.test \shift;
//:change shift
-400 @>.test \shift;
//:MagShift+EventSoundPlayer:
EditSoundPlayer().play((buf: \crickets, playfunc: \magshift, dur: 10000));
//:
{ XLine.kr(1, 0.1, 20) } @>.s \stretch;
//:
{ LFNoise1.kr(0.2).range(-500, 400) } @>.s \shift;
//:
{ LFNoise1.kr(0.2).range(2, 0.1) } @>.s \stretch;
//:   PV_Freeze
{
	PV_Plug.ar(
		\crickets.pbar,
		{ | chain | PV_Freeze(chain, \freeze.br(0)) }
	)
} +> \test;
//:
1.0 @>.test \freeze;
//:
0.0 @>.test \freeze;
//:
{ LFNoise1.kr(5) } @>.test \freeze;
//:
//:Does not freeze?????
EditSoundPlayer().play((buf: \crickets, playfunc: \freeze, dur: 10000));
//: freeze 1
{ Impulse.kr(1) } @>.s \freeze
//: freeze 0
0 @>.s \freeze
//:   PV_MagDiv
SynthDef("help-magMul", { arg out=0;
    var inA, chainA, inB, chainB, chain;
    inA = \melodia.pbar; // WhiteNoise.ar(0.2);
    inB = \crickets.pbar; // LFSaw.ar(100, 0, 0.2);
    chainA = FFT(LocalBuf(2048), inA);
    chainB = FFT(LocalBuf(2048), inB);
    chain = PV_MagDiv(chainA, chainB);
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
//:   PV_MagDiv
SynthDef("help-magMul", { arg out=0;
    var inA, chainA, inB, chainB, chain;
    inA = WhiteNoise.ar(0.2);
    inB = SinOsc.ar(1, 0, 0.2);
    chainA = FFT(LocalBuf(2048), inA);
    chainB = FFT(LocalBuf(2048), inB);
    chain = PV_MagDiv(chainA, chainB);
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
//:   PV_MagDiv
SynthDef("help-magMul", { arg out=0;
    var inA, chainA, inB, chainB, chain;
    inB = WhiteNoise.ar(0.2);
    inA = LFSaw.ar(1, 0, 0.2);
    chainA = FFT(LocalBuf(2048), inA);
    chainB = FFT(LocalBuf(2048), inB);
    chain = PV_MagDiv(chainA, chainB);
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
//:   PV_MagDiv
SynthDef("help-magMul", { arg out=0;
    var inA, chainA, inB, chainB, chain;
    inA = \melodia.pbar; // WhiteNoise.ar(0.2);
    inB = \pilgrims.pbar; // LFSaw.ar(100, 0, 0.2);
    chainA = FFT(LocalBuf(2048), inA);
    chainB = FFT(LocalBuf(2048), inB);
    chain = PV_MagDiv(chainA, chainB);
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
//:   PV_MagDiv
SynthDef("help-magMul", { arg out=0;
    var inA, chainA, inB, chainB, chain;
    inA = \melodia.pbar; // WhiteNoise.ar(0.2);
    inB = \bird_crickets.pbar; // LFSaw.ar(100, 0, 0.2);
    chainA = FFT(LocalBuf(2048), inA);
    chainB = FFT(LocalBuf(2048), inB);
    chain = PV_MagDiv(chainA, chainB);
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
//:   PV_MagDiv
SynthDef("help-magMul", { arg out=0;
    var inA, chainA, inB, chainB, chain;
    inA = \melodia.pbar; // WhiteNoise.ar(0.2);
    inB = \birdcarman.pbar; // LFSaw.ar(100, 0, 0.2);
    chainA = FFT(LocalBuf(2048), inA);
    chainB = FFT(LocalBuf(2048), inB);
    chain = PV_MagDiv(chainA, chainB);
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
//:

//:   PV_PlayBuf
//:   PV_BinDelay
//:   PV_JensenAndersen
//:   PV_MagFreeze
//:   PV_PitchShift
//:   PV_DiffMags
//:   PV_RecordBuf
//:   PV_RandWipe
//:   PV_MagSubtract
//:   FFT
//:   PV_BinFilter
//: DONE!  PV_MagAbove
//: PV_MagClip
//: PV_LocalMax
//: DONE: PV_MagBelow
//:   PV_Diffuser
//:   PV_BinBufRd
//:  PV_ExtractRepeat
//:   PV_HainsworthFoote
//:   PV_MagLog
//:   PV_RectComb
//:   PV_BinShift
//:   PV_Whiten
//:   PV_BufRd
//:   PV_BinScramble
//:   PV_NoiseSynthP
//: PV_PartialSynthF
//: PV_NoiseSynthF
//: PV_PartialSynthP
//:   PV_OddBin
//: PV_EvenBin
//: PV_MagExp
//: Cepstrum
//: ICepstrum
//: PV_Invert
//: PV_MagSmooth
//: PV_MagMap
//: PV_BrickWall
//: FFTTrigger
//: PV_BinWipe
//: PV_SpectralMap
//: PV_MaxMagN
//: PV_MinMagN
//:  PV_RandComb
//: PV_MagSquared
//: PV_PhaseShift270
//: PV_MagNoise
//: PV_Conj
//: PV_PhaseShift90
//: PV_MagSmear
//: PackFFT
//: PV_MagBuffer
//: PV_FreqBuffer
//:   PV_RectComb2
//:   PV_PhaseShift
//:   PV_MagMulAdd
//:   PV_MagMul
//   [
//:     PV_Max
//:     PV_Mul
//:     PV_Min
//:     PV_CopyPhase
//:     PV_Div
//:     PV_Copy
//:     PV_Add
//   ]
//:   PV_BinPlayBuf
//:   PV_SpectralEnhance
//:   PV_ConformalMap
