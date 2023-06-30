//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	sig = Mix.fill(4, {|n|
		var ch, fb, rt, saw, env, ofq, oev, mod, osc, pan;
		ch = bus + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.5), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 0.5, 0.999 / 2);// / 2; //2;		// 0.999 <- trick for Latch
		// saw = LFSaw.ar(rt, 1, 1, 0.999) / 2; //2;		// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		// saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;
		ofq = WhiteNoise.ar(\noise.kr(0.5) + 1 ** 15 + 10) // !
		+ (\noisep.kr(0.6) + 1 ** 15 + 10); // !
		ofq = Latch.ar(ofq, saw);
		oev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10); // !
		mod = ofq * (\fqmul.kr(0.5) * 10 + 5/3); // !
		mod = SinOsc.ar(mod, 0, oev, ofq);
		env = LPF.ar(env, 100); // !
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		Pan2.ar(osc, pan, 1/4); // ! mix down 4 channels at 1/4 amp
	}).adsr;
	\amp.kr(0.05).lag(1) * sig;
} +> \pebl;
)
//:



//:
\rtmin <+.pebl -5;
\rtmin <+.pebl -5;
\rtmin <+.pebl -5;
\rtmin <+.pebl -5;
\rtmax <+.pebl 10;
\rtmax <+.pebl 10;
\rtmax <+.pebl 10;
\rtmax <+.pebl 10;
\noise <+.pebl 0.2;
\noisep <+.pebl 0.5;
// noise p ranges tried out: 0.1 - 0.8

\oscamp <+.pebl 0.5;
\oscamp <+.pebl 0.5;
\oscamp <+.pebl 0.5;
\fqmul <+.pebl 0.1;
\amp <+.pebl 0.5;
\amp <+.pebl 0.05;
\pebl.stop(2);
//:

\noisep <+.pebl 0.5;
\noisep <+.pebl 0.6;
\noisep <+.pebl 0.7;
\noisep <+.pebl 0.8;
\noisep <+.pebl 0.9;
\noisep <+.pebl 0.99;

\noisep <+.pebl 0.4;
\noisep <+.pebl 0.3; // lower values have not so clear difference ?
\noisep <+.pebl 0.2;
\noisep <+.pebl 0.1;
\noisep <+.pebl 0.05;
\noisep <+.pebl 0.005;
\noisep <+.pebl 0.0005;
\noisep <+.pebl 0.0000;
\noisep <+.pebl -3.0005; // yes
\noisep <+.pebl -2.0005;
\noisep <+.pebl -5.0005; // no sound
\noisep <+.pebl -5.0005; // no sound


ynth('temp__4' : 1004)
Remote evaluation: /* \rtmax <+.pebl 10;
 */
rtmax
Remote evaluation: /* \rtmin <+.pebl 5;
 */
rtmin
Remote evaluation: /* \rtmax <+.pebl 50;
 */
rtmax
Remote evaluation: /* \rtmax <+.pebl 20;
 */
rtmax
Remote evaluation: /* \rtmin <+.pebl -2;
 */
rtmin
Remote evaluation: /* \rtmax <+.pebl -1;
 */
rtmax
Remote evaluation: /* \rtmax <+.pebl -2;
 */
rtmax
Remote evaluation: /* \rtmin <+.pebl -10;
 */
rtmin
Remote evaluation: /* \rtmin <+.pebl -20;
 */
rtmin
Remote evaluation: /* \rtmax <+.pebl -10;
 */
rtmax
/// noise p values for very
Remote evaluation: /* \noise <+.pebl 0.01;
 */
noise
Remote evaluation: /* \noisep <+.pebl 0.01;
 */
noisep
Remote evaluation: /* \amp <+.pebl 0.5;
 */
amp
Remote evaluation: /* \noisep <+.pebl 0.05;
 */
noisep
// oscamp and fqmul is important to produce low sounds
\oscamp <+.pebl 0.01;

Remote evaluation: /* \fqmul <+.pebl 1;

 */

//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	var ch, fb, rt, saw, env, ofq, oev, mod, osc, pan;
	// sig = // Mix.fill(1, { | n |
		ch = bus; //  + n;
		fb = InFeedback.ar(ch);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.5), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 1, 0.999)/2;		// 0.999 <- trick for Latch
		Out.ar(ch, saw);
		saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;
		ofq = WhiteNoise.ar(\noise.kr(0.5) + 1 ** 15 + 10)
		+ (\noisep.kr(0.6) + 1 ** 15 + 10);
		ofq = Latch.ar(ofq, saw);
		oev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10);
		mod = ofq * (\fqmul.kr(0.5) * 10 + 5/3);
		mod = SinOsc.ar(mod, 0, oev, ofq);
		env = LPF.ar(env, 100);
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		sig = Pan2.ar(osc, pan, 1/4).adsr;
	//}).adsr;
	\amp.kr(0.5).lag(1) * sig;
} +> \pebl;
)
//:
(
// 1. InFeedback 'pebble' algorithm.
{|bus = 50|
	var sig;
	var ch, fb, rt, saw, env, ofq, oev, mod, osc, pan;
	// sig = // Mix.fill(1, { | n |
		ch = bus; //  + n;
		fb = LocalIn.ar(1);
		rt = WhiteNoise.ar.linlin(-1, 1, \rtmin.kr(0.5), \rtmax.kr(5));
		rt = Latch.ar(rt, fb);
		saw = LFSaw.ar(rt, 1, 1, 0.999)/2;		// 0.999 <- trick for Latch
		LocalOut.ar(saw);
		saw.scope;		// check the rhythmic polyphony
		env = 1 - saw;
		ofq = WhiteNoise.ar(\noise.kr(0.5) + 1 ** 15 + 10)
		+ (\noisep.kr(0.6) + 1 ** 15 + 10);
		ofq = Latch.ar(ofq, saw);
		oev = env ** 2 * (\oscamp.kr(0.5) * 10000 + 10);
		mod = ofq * (\fqmul.kr(0.5) * 10 + 5/3);
		mod = SinOsc.ar(mod, 0, oev, ofq);
		env = LPF.ar(env, 100);
		osc = SinOsc.ar(mod, 0, env);
		pan = Latch.ar(WhiteNoise.ar, saw);
		sig = Pan2.ar(osc, pan, 1/4).adsr;
	//}).adsr;
	\amp.kr(0.5).lag(1) * sig;
} +> \pebl;
)
//:
\amp <+.pebl 0.001;
//:
Server.default.volume = 0.01;
//:
LFDNoise0

//:


(
//: 2. StandardL algorithm.
{
	var div, sfq, std, rfq, rbw, res, mul, sig;
	div = \srdiv.kr(0.5).linlin(0, 1, 10, 100);
	sfq = SampleRate.ir / div;
	std = StandardL.ar(sfq, \stdk.kr(1));
	rfq = \resfreq.kr(0.2).linlin(0, 1, 10, 5000);
	rbw = \resbwr.kr(0.01).linlin(0, 1, 0.01, 100);
	res = Resonz.ar(std, rfq, rbw);
	mul = \resinmul.kr(0.1).linlin(0, 1, 500, 50000);
	sig = SinOsc.ar(res * mul);
	sig = \amp.kr(0.2).lag(1) * sig;
	Pan2.ar(sig, \pos.kr(0)).adsr;
} +> \stdL;
//:
)
//:
{  WhiteNoise.ar(0.1).dup } +> \test;

//:
SenseData.x(0.46, 0.53, !!!!!!! 0, 1)
SenseData.x(0.46, 0.53, !!!!!!! -10, 55)

\srdiv <+.stdL 0.2
\stdk <+.stdL 2
\resfreq <+.stdL 0.12
\resbwr <+.stdL 0.4
\resinmul <+.stdL 0.1

\pos <+.stdL 0
\amp <+.stdL 0.5
\stdL.stop(2);