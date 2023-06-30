Selecting project: CFU_TYO_220506
loading setup folder
Stopped sharing code with OSCGroups
Looking for files in /Users/iani/sc-projects/CFU_TYO_220506/setup ...
... found: [ 00_SetupOscAndSensors.scd, OscGroupClientCommand.org ]
Loading : /Users/iani/sc-projects/CFU_TYO_220506/setup/00_SetupOscAndSensors.scd
OscGroups set OSC send port to: 22244
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
OscGroups enabled
enabled osc groups
Enabled forwarding sense data to osc groups
Sensors 1-8 write to buses 0-23
server 'localhost' unresponsive, rebooting ...
'/quit' message sent to server 'localhost'.
Skipping non-matching file type: OscGroupClientCommand.org
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
OscGroups set OSC send port to: 22244
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
OscGroups enabled

**** Broadcasting selected project CFU_TYO_220506 ****

osc groups enabled? true
osc groups enabled? true
osc groups enabled? true
osc groups enabled? true
osc groups enabled? true
osc groups enabled? true
osc groups enabled? true
osc groups enabled? true
Booting server 'localhost' on address 127.0.0.1:57110.
Found 0 LADSPA plugins
Number of Devices: 5
   0 : "MAYA22 USB"
   1 : "BlackHole 2ch"
   2 : "MacBook Air Microphone"
   3 : "MacBook Air Speakers"
   4 : "ZoomAudioD"

"MacBook Air Microphone" Input Device
   Streams: 1
      0  channels 1

"MAYA22 USB" Output Device
   Streams: 1
      0  channels 2

SC_AudioDriver: sample rate = 48000.000000, driver's block size = 512
SuperCollider 3 server ready.
Requested notification messages from server 'localhost'
localhost: server process's maxLogins (1) matches with my options.
localhost: keeping clientID (0) as confirmed by server process.
Shared memory server interface initialized
Preparing recording on 'localhost'
Recording channels [ 0, 1 ] ... 
path: '/Users/iani/Music/SuperCollider Recordings/SC_220506_134340.aiff'
loading global buffers
Looking for files in /Users/iani/sc-projects/global/audiofiles ...
... found: [ 01kiiroi.wav, 14pilgrims.wav, README-AUDIOFILES.org, bird_crickets.wav, birdcarman.wav, birdcarmanshort.wav, cricket_ff.wav, cricket_taps.wav, crickets.wav, crossing.wav, echo_crickets.wav, fones.wav, hanbaiki.wav, lake_plane.wav, loud_crickets.wav, melodic_road.wav, noisebirdsclick.wav, rough_steps.wav, sweet_crickets.wav, takunia.wav ]
Loaded buffer 01kiiroi, 1 channels, 9.871"
Loaded buffer 14pilgrims, 1 channels, 58.514"
Skipping non-matching file type: README-AUDIOFILES.org
Loaded buffer bird_crickets, 1 channels, 55.587"
Loaded buffer birdcarman, 1 channels, 2'33.076"
Loaded buffer birdcarmanshort, 1 channels, 1'10.413"
Loaded buffer cricket_ff, 1 channels, 22.206"
Loaded buffer cricket_taps, 1 channels, 12.348"
Loaded buffer crickets, 1 channels, 42.23"
Loaded buffer crossing, 1 channels, 31.888"
Loaded buffer echo_crickets, 1 channels, 1'2.277"
Loaded buffer fones, 1 channels, 3.067"
Loaded buffer hanbaiki, 1 channels, 9.039"
Loaded buffer lake_plane, 1 channels, 24.199"
Loaded buffer loud_crickets, 1 channels, 48.112"
Loaded buffer melodic_road, 1 channels, 26.477"
Loaded buffer noisebirdsclick, 1 channels, 40.773"
Loaded buffer rough_steps, 1 channels, 17.509"
Loaded buffer sweet_crickets, 1 channels, 1'2.277"
Loaded buffer takunia, 1 channels, 4.244"
loading local buffers from: PathName(/Users/iani/sc-projects/CFU_TYO_220506/audiofiles)
Looking for files in /Users/iani/sc-projects/CFU_TYO_220506/audiofiles ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
Stopped sharing code with OSCGroups
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [  ]
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
osc groups enabled? true
loading local synthdefs
Stopped sharing code with OSCGroups
osc groups enabled? true
Stopped sharing code with OSCGroups
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/CFU_TYO_220506/synthdefs ...
... found: [  ]
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
osc groups enabled? true
localhost finished loading synthdefs
loading setup folder
Stopped sharing code with OSCGroups
osc groups enabled? true
Stopped sharing code with OSCGroups
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/CFU_TYO_220506/setup ...
... found: [ 00_SetupOscAndSensors.scd, OscGroupClientCommand.org ]
Loading : /Users/iani/sc-projects/CFU_TYO_220506/setup/00_SetupOscAndSensors.scd
OscGroups set OSC send port to: 22244
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
osc groups enabled? true
osc groups enabled? true
OscGroups enabled
osc groups enabled? true
enabled osc groups
Enabled forwarding sense data to osc groups
Sensors 1-8 write to buses 0-23
Skipping non-matching file type: OscGroupClientCommand.org
Start sending, addr: a NetAddr(127.0.0.1, 22244), message 'code', user 'localuser'
osc groups enabled? true
WARNING: Recording already (0.0 seconds)
Remote evaluation: /* (
\tiA.stop;
\tiB.stop;
\tiC.stop; 
\tiD.stop;
\tiX.stop;
)
 */
tiX
Remote evaluation: /* (
{
	a = EnvGen.ar(Env.sine(8), doneAction:2);
	SinOsc.ar(440, 0, a)!2/4;
} +> \tiCue;


// wind chord duo
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(0.5);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
		// sens[3].linlin(0.45, 0.55, key, 132).midicps
	, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	Pan2.ar(osc, -0.5) * \amp.kr(0.5);
} +> \tiC;

{
	var key = \key.kr(32);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(0.5);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\z4.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps
		// MouseY.kr(key, 132).midicps
		// sens[3].linlin(0.45, 0.55, key, 132).midicps
	, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);
	Pan2.ar(osc, 0.5) * \amp.kr(0.5);
} +> \tiD;
)
 */
Synth('temp__3' : 1003)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\x2.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(1);
	var osc = PMOsc.ar(50, 50*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.7);
} +> \tiB;
)
 */
Synth('temp__4' : 1004)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.05).min(1);
	var osc = PMOsc.ar(5000, 5000*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.4);
} +> \tiA;
)
 */
Synth('temp__5' : 1005)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.01).min(1);
	var osc = PMOsc.ar(5000, 5000*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.4);
} +> \tiA;
)
 */
Synth('temp__6' : 1006)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0.01).min(0.5);
	var osc = PMOsc.ar(5000, 5000*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.4);
} +> \tiA;
)
 */
Synth('temp__7' : 1007)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0).min(0.5);
	var osc = PMOsc.ar(5000, 5000*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.4);
} +> \tiA;
)
 */
Synth('temp__8' : 1008)
Remote evaluation: /* (
// synth bass
{
	var sens = In.kr(0, 24);
	var trg = Changed.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 4).round(1)
		// MouseX.kr(0, 4).round(1)
		// sens[12].linlin(0.45, 0.55, 0, 4).round(1)
	);
	var pch = Latch.ar(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 24, 60).round(1)
		// MouseX.kr(24, 60).midicps
		// sens[12].linlin(0.45, 0.55, 24, 80).round(1)
		, trg);
	var env = EnvGen.ar(Env.perc(0.001, 0.5), trg);
	var osc = PMOsc.ar(pch, env**50*pch*10+pch*5.5, env*4, 0, env/5);
	osc = SinOsc.ar(pch, 0, env, osc);
	osc = FreeVerb2.ar(osc, osc, 0.2, 0.7);
	osc * \amp.kr(0.7);
} +> \tiC;
)
 */
Synth('temp__9' : 1009)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0).min(0.5);
	var osc = PMOsc.ar(5000, 5000*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.1);
} +> \tiA;
)
 */
Synth('temp__10' : 1010)
Remote evaluation: /* (
// stacc chord
{
	var key = \key.kr(36);
	// var sens = In.kr(1, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 10).lag(2)
		// MouseX.kr(0, 10).lag(2)
		// sens[6].linlin(0.45, 0.55, 0, 4).lag(2)
	).abs;

	var osc = Mix.fill(10, {|n|
		var pch = midicps(n*5+key);
		t = Dust.ar(amp);
		e = EnvGen.ar(Env.perc(0.01, 0.1), t);
		o = PMOsc.ar(pch, pch/2, 1, 0, e/10);
		x = Lag.ar(Latch.ar(LFNoise0.ar(100), t), 0.01);
		Pan2.ar(o, x);
	});
	osc * \amp.kr(1);
} +> \tiD;
)
 */
Synth('temp__11' : 1011)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0).min(0.5);
	var osc = PMOsc.ar(8000, 8000*2.5, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.05);
} +> \tiA;
)
 */
Synth('temp__12' : 1012)
Remote evaluation: /* (
// stacc chord
{
	var key = \key.kr(48);
	// var sens = In.kr(1, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 10).lag(2)
		// MouseX.kr(0, 10).lag(2)
		// sens[6].linlin(0.45, 0.55, 0, 4).lag(2)
	).abs;

	var osc = Mix.fill(10, {|n|
		var pch = midicps(n*5+key);
		t = Dust.ar(amp);
		e = EnvGen.ar(Env.perc(0.01, 0.1), t);
		o = PMOsc.ar(pch, pch/2, 1, 0, e/10);
		x = Lag.ar(Latch.ar(LFNoise0.ar(100), t), 0.01);
		Pan2.ar(o, x);
	});
	osc * \amp.kr(1);
} +> \tiD;
)
 */
Synth('temp__13' : 1013)
Remote evaluation: /* (
// stacc chord
{
	var key = \key.kr(47);
	// var sens = In.kr(1, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 10).lag(2)
		// MouseX.kr(0, 10).lag(2)
		// sens[6].linlin(0.45, 0.55, 0, 4).lag(2)
	).abs;

	var osc = Mix.fill(10, {|n|
		var pch = midicps(n*5+key);
		t = Dust.ar(amp);
		e = EnvGen.ar(Env.perc(0.01, 0.1), t);
		o = PMOsc.ar(pch, pch/2, 1, 0, e/10);
		x = Lag.ar(Latch.ar(LFNoise0.ar(100), t), 0.01);
		Pan2.ar(o, x);
	});
	osc * \amp.kr(1);
} +> \tiD;
)
 */
Synth('temp__14' : 1014)
Remote evaluation: /* (
// stacc chord
{
	var key = \key.kr(47);
	// var sens = In.kr(1, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 4).lag(2)
		// MouseX.kr(0, 10).lag(2)
		// sens[6].linlin(0.45, 0.55, 0, 4).lag(2)
	).abs;

	var osc = Mix.fill(10, {|n|
		var pch = midicps(n*5+key);
		t = Dust.ar(amp);
		e = EnvGen.ar(Env.perc(0.01, 0.1), t);
		o = PMOsc.ar(pch, pch/2, 1, 0, e/10);
		x = Lag.ar(Latch.ar(LFNoise0.ar(100), t), 0.01);
		Pan2.ar(o, x);
	});
	osc * \amp.kr(1);
} +> \tiD;
)
 */
Synth('temp__15' : 1015)
Remote evaluation: /* (
// bass
{
	var key = \key.kr(36);
	var sens = In.kr(0, 24);
	var amp = Slope.kr(
		\z1.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(2)
		// MouseX.kr(0, 1).lag(2)
		// sens[3].linlin(0.45, 0.55, 0, 1).lag(2)
	).abs.max(0).min(0.5);
	var osc = PMOsc.ar(8000, 5000, amp**2*2, 0, amp);
	osc!2 * \amp.kr(0.05);
} +> \tiA;
)
 */
Synth('temp__16' : 1016)
Remote evaluation: /* (
// stacc chord
{
	var key = \key.kr(47);
	// var sens = In.kr(1, 24);
	var amp = Slope.kr(
		\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 4).lag(2)
		// MouseX.kr(0, 10).lag(2)
		// sens[6].linlin(0.45, 0.55, 0, 4).lag(2)
	).abs;

	var osc = Mix.fill(10, {|n|
		var pch = midicps(n*2.5+key);
		t = Dust.ar(amp);
		e = EnvGen.ar(Env.perc(0.01, 0.1), t);
		o = PMOsc.ar(pch, pch/2, 1, 0, e/10);
		x = Lag.ar(Latch.ar(LFNoise0.ar(100), t), 0.01);
		Pan2.ar(o, x);
	});
	osc * \amp.kr(1);
} +> \tiD;
)
 */
Synth('temp__17' : 1017)
Remote evaluation: /* (
\tiA.stop(8);
\tiB.stop(8);
\tiC.stop(8);
\tiD.stop(8);
\tiX.stop(8);
)
 */
tiX
