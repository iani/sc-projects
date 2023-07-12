/*  7 Jul 2023 19:24
From help
*/
//:
{
    var input, kernel;

    input = SoundIn.ar(0);
    kernel = Mix.ar(LFSaw.ar([300,500,800,1000] * MouseX.kr(1.0, 2.0), 0, 1.0));

    // must have power of two framesize
    Convolution.ar(input,kernel, 1024, 0.5)
} +> \test;
//:
{
    var input, kernel;

    input = SoundIn.ar(0);
    kernel = Mix.ar(SinOsc.ar([300,500,800,1000] * MouseX.kr(1.0, 2.0), 0, 1.0));

    // must have power of two framesize
    Convolution.ar(input,kernel, 1024, 0.5)
} +> \test;