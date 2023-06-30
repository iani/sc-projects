/* 13 Nov 2022 15:50
Using samples currently available locally at
sc-projects/global/audiofiles:

01kiiroi.wav
14pilgrims.wav
README-AUDIOFILES.org
birdcarman.wav
birdcarmanshort.wav
bird_crickets.wav
crickets.wav
cricket_ff.wav
cricket_taps.wav
crossing.wav
echo_crickets.wav
fones.wav
hanbaiki.wav
hoge.wav
lake_plane.wav
loud_crickets.wav
melodic_road.wav
noisebirdsclick.wav
rough_steps.wav
sweet_crickets.wav
takunia.wav

To use these here, please obtain them from Iannis Zannos
And put them in sc-projects/global/audiofiles/

*/

//:test if a buffer is loaded and can be played:
\crossing.buf.play;
//:Play the buffer with Plaubuf
{
	PlayBuf.ar(1, \crossing.buf.bufnum)
} +> \test;
//:use playbuf shortcu to play the buffer
{ \crossing.playbuf } +> \test;
//: restart and set looping to true
{ \fones.playbuf } +> \test;
1 @>.test \loop;

//:set rate
{ \fones.playbuf } +> \test;
1.5 @>.test \rate;
//:modulate rate and set loop to 1 (true)
{ \crossing.playbuf } +> \test;
{ LFNoise1.ar(0.5).range(0.1, 10) } @>.test \rate;
1 @>.test \loop;
//:play part of a sample at each trigger
{ \crossing.playbuf } +> \test;
{ Impulse.kr(1) } @>.test \trig;
1 @>.test \loop;
//:start at a different part of the sample at each trigger
{ \crickets.playbuf } +> \test;
{ LFNoise0.kr(1).range(0, \crickets.numFrames) } @>.test \startPos;
{ Impulse.kr(1) } @>.test \trig;
1 @>.test \loop;
//:start at a different part of the sample at each trigger
{ \fones.playbuf } +> \test;
{ LFNoise0.kr(10).range(0, \fones.numFrames) } @>.test \startPos;
{ Impulse.kr(10) } @>.test \trig;
1 @>.test \loop;
//:start at a different part of the sample at each trigger
{ \fones.playbuf } +> \test;
{ LFNoise0.kr(20).range(0, \fones.numFrames) } @>.test \startPos;
{ Impulse.kr(20) } @>.test \trig;
1 @>.test \loop;
//:start at a different part of the sample at each trigger
{ \crickets.playbuf } +> \test;
{ LFNoise0.kr(20).range(0, \crickets.numFrames) } @>.test \startPos;
{ Impulse.kr(20) } @>.test \trig;
1 @>.test \loop;
//:Change rate and segment 5 times per second
{ \crickets.playbuf } +> \test;
{ LFNoise0.kr(5).range(0, \crickets.numFrames) } @>.test \startPos;
{ LFNoise0.kr(5).range(0.1, 10) } @>.test \rate;
{ Impulse.kr(5) } @>.test \trig;
1 @>.test \loop;
//: Start each new segment with a new envelopea - preparatory take
{ var src, r;
	src = \crickets.playbuf;
	r = \rate.kr(1);
	[src, WhiteNoise.ar() * Decay.kr(Impulse.kr(r) * 0.1)];
} +> \test;
{ LFNoise0.kr(5).range(0, \crickets.numFrames) } @>.test \startPos;
{ LFNoise0.kr(5).range(0.1, 10) } @>.test \rate;
{ Impulse.kr(5) } @>.test \trig;
1 @>.test \loop;
//: Start each new segment with a new envelopea - add the envelope
{ var src, r;
	src = \crickets.playbuf;
	r = \rate.kr(1);
	[src, WhiteNoise.ar() * Env.perc(level: 0.1).kr(doneAction: 0, gate: Impulse.kr(r))];
} +> \test;
{ LFNoise0.kr(5).range(0, \crickets.numFrames) } @>.test \startPos;
{ LFNoise0.kr(5).range(0.1, 10) } @>.test \rate;
{ Impulse.kr(5) } @>.test \trig;
1 @>.test \loop;
//: Start each new segment with a new envelopea - envelope on sound
{ var src, r;
	src = \crickets.playbuf;
	r = \rate.kr(1);
	src * Env([0, 0.1, 0], [0.5, 0.5])
	.kr(doneAction: 0, gate: Impulse.kr(r), timeScale: r.reciprocal);
} +> \test;
{ LFNoise0.kr(5).range(0, \crickets.numFrames) } @>.test \startPos;
{ LFNoise0.kr(5).range(0.1, 10) } @>.test \rate;
{ Impulse.kr(5) } @>.test \trig;
1 @>.test \loop;
//: envelope on sound - share rate controller
{
	var src, rate;
	rate = \rate.br(1);
	src = \crickets.playbuf(rate: rate);
	src *
	Env([0, 0.1, 0], [0.5, 0.5])
	.kr(doneAction: 0, gate: Impulse.kr(rate), timeScale: rate.reciprocal);
} +> \test;
//:
{ LFNoise0.kr(5).range(0, \crickets.numFrames) } @>.test \startPos;
{ LFNoise0.kr(5).range(0.1, 10) } @>.test \rate;
{ Impulse.kr(5) } @>.test \trig;
1 @>.test \loop;
//:
(rate: 5) ++> \test;
//:
Mediator.at(\test).busses;
//:
"HELLO"