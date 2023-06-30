loading local buffers from: PathName(/Users/iani/sc-projects/nil/audiofiles)
Looking for files in /Users/iani/sc-projects/nil/audiofiles ...
... found: [  ]
loading local buffers from: PathName(/Users/iani/sc-audiofiles/nil)
Looking for files in /Users/iani/sc-audiofiles/nil ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [ synth_test.scd ]
Loading : /Users/iani/sc-projects/global/synthdefs/synth_test.scd
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Synthdef loading for project nil is disabled.
To enable autoload synthdefs, add a file named autoload_synhdefs.scd in the project's folder
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
localhost finished loading synthdefs
loading setup folder
OscGroups testing enabled status
Looking for files in /Users/iani/sc-projects/nil/setup ...
... found: [  ]
OscGroups testing enabled status
OscGroups testing enabled status
OscGroups disabled
OscGroups testing enabled status
-> localhost
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Loading synthdef library
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-> a Function
-> an EventStreamPlayer
-> a Function
-> OSCdef(orchestra, /data/x, nil, nil, nil)
Enabling OscGroups. Send Port: 22244 Receive Port: 22245
OscGroups set OSC send port to: 22244
OscGroups testing enabled status
activating code message: /code
OscGroups testing enabled status
OscGroups enabled
OscGroups testing enabled status
removing old code message: /code
activating code message: code_x
-> OscGroups
-------------------
Duel Revisited: on
-------------------
**********************************
Node: sequential | Duration: 96
Event x: 1
-> Pdefn('ampPx')
-> Pdefn('relGx')
-> Pdefn('durPx')
-> Pdefn('durPx')
-> Pdefn('freqPx')
-> Pdefn('durGx')
-> Pdefn('durGx')
-> Pdefn('durGx')
-> Pdefn('durPx')
-> Pdefn('relGx')
**********************************
Node: sequential | Duration: 106
Event x: 5
-> Pdefn('sposGx')
-> Pdefn('trnspGx')
-> Pdefn('durGx')
ERROR: syntax error, unexpected $end, expecting ')'
  in interpreted text
  line 1 char 51:

  Pdefn(\durGx, Prand([0.25, 0.75, 0.15, 0.1], inf); 
                                                     
-----------------------------------
ERROR: Command line parse failed
-> nil
ERROR: syntax error, unexpected $end, expecting ')'
  in interpreted text
  line 1 char 55:

  Pdefn(\durGx, Pseq([0.25, 0.75, 0.15, 0.1, 0.5], inf); 
                                                         
-----------------------------------
ERROR: Command line parse failed
-> nil
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('durGx')
**********************************
Node: simultaneous | Duration: 105
Event x: 6
-> Pdefn('ampKx')
-> Pdefn('ampKx')
**********************************
Node: sequential | Duration: 80
Event x: 3
-> Pdefn('susGx')
-> Pdefn('durGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
**********************************
Node: sequential | Duration: 106
-> Pdefn('trnspGx')
-> Pdefn('sposGx')
-> Pdefn('sposGx')
Event x: 4
-> Pdefn('susGx')
-> Pdefn('durGx')
-> Pdefn('durGx')
-> Pdefn('durGx')
-> Pdefn('freqCx')
-> Pdefn('freqCx')
-> Pdefn('atkCx')
-> Pdefn('relCx')
**********************************
Node: sequential | Duration: 73
-> Pdefn('durCx')
Event x: 4
-> Pdefn('durGx')
-> Pdefn('durGx')
-> Pdefn('durCx')
**********************************
Node: simultaneous | Duration: 84
Event x: 5
-> Pdefn('sposGx')
-> Pdefn('atkGx')
-> Pdefn('susGx')
-> Pdefn('ampGx')
-> Pdefn('durGx')
-> Pdefn('durGx')
**********************************
Node: simultaneous | Duration: 116
Event x: 2
-> Pdefn('durGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-> Pdefn('trnspGx')
-------------------
Duel Revisited: off
-------------------
Server 'localhost' is currently unresponsive. Forcing process to stop via system command.
====== The default server quit ======
Removing buffer entries from lib
server 'localhost' disconnected shared memory interface
'/quit' message sent to server 'localhost'.
compiling class library...
	Found 855 primitives.
	Compiling directory '/Applications/SuperCollider/SuperCollider.app/Contents/Resources/SCClassLibrary'
	Compiling directory '/Users/iani/Library/Application Support/SuperCollider/Extensions'
	numentries = 1566532 / 24076598 = 0.065
	6539 method selectors, 3682 classes
	method table size 25668776 bytes, big table size 192612784
	Number of Symbols 16587
	Byte Code Size 484884
	compiled 753 files in 0.39 seconds

Info: 11 methods are currently overwritten by extensions. To see which, execute:
MethodOverride.printAll

compile done
localhost : setting clientID to 0.
internal : setting clientID to 0.
Emacs: Initializing lisp interface.
Class tree inited in 0.02 seconds
activating code message: /code


*** Welcome to SuperCollider 3.12.2. *** For help type C-c C-y.
Emacs: Index help topics in 0.766 seconds
Booting server 'localhost' on address 127.0.0.1:57110.
Emacs: Built symbol table in 0.0157 seconds
Found 0 LADSPA plugins
Number of Devices: 6
   0 : "27N4Q"
   1 : "Iannis Zannos’s iPhone Micropho"
   2 : "BlackHole 2ch"
   3 : "MacBook Air Microphone"
   4 : "MacBook Air Speakers"
   5 : "ZoomAudioD"

"MacBook Air Microphone" Input Device
   Streams: 1
      0  channels 1

"MacBook Air Speakers" Output Device
   Streams: 1
      0  channels 2

SC_AudioDriver: sample rate = 48000.000000, driver's block size = 512
SuperCollider 3 server ready.
Requested notification messages from server 'localhost'
localhost: server process's maxLogins (1) matches with my options.
localhost: keeping clientID (0) as confirmed by server process.
Shared memory server interface initialized
loading global buffers
Looking for files in /Users/iani/sc-projects/global/audiofiles ...
... found: [ 01kiiroi.wav, 14pilgrims.wav, Garcia_drone1.wav, Garcia_drone10.wav, Garcia_drone11.wav, Garcia_drone12.wav, Garcia_drone13.wav, Garcia_drone14.wav, Garcia_drone15.wav, Garcia_drone16.wav, Garcia_drone17.wav, Garcia_drone18.wav, Garcia_drone19.wav, Garcia_drone2.wav, Garcia_drone20.wav, Garcia_drone21.wav, Garcia_drone22.wav, Garcia_drone23.wav, Garcia_drone24.wav, Garcia_drone25.wav, Garcia_drone26.wav, Garcia_drone27.wav, Garcia_drone28.wav, Garcia_drone29.wav, Garcia_drone3.wav, Garcia_drone30.wav, Gar...etc...
Loaded buffer 01kiiroi, 1 channels, 9.871"
Loaded buffer 14pilgrims, 1 channels, 58.514"
Loaded buffer Garcia_drone1, 1 channels, 6'55.941"
Loaded buffer Garcia_drone10, 1 channels, 3'17.0"
Loaded buffer Garcia_drone11, 1 channels, 3'33.717"
Loaded buffer Garcia_drone12, 1 channels, 3'33.717"
Loaded buffer Garcia_drone13, 1 channels, 3'32.235"
Loaded buffer Garcia_drone14, 1 channels, 3'39.888"
Loaded buffer Garcia_drone15, 1 channels, 3'33.299"
Loaded buffer Garcia_drone16, 1 channels, 3'33.965"
Loaded buffer Garcia_drone17, 1 channels, 2'37.723"
Loaded buffer Garcia_drone18, 1 channels, 2'7.683"
Loaded buffer Garcia_drone19, 1 channels, 2'19.4"
Loaded buffer Garcia_drone2, 1 channels, 6'32.131"
Loaded buffer Garcia_drone20, 1 channels, 2'14.587"
Loaded buffer Garcia_drone21, 1 channels, 1'59.517"
Loaded buffer Garcia_drone22, 1 channels, 1'59.517"
Loaded buffer Garcia_drone23, 1 channels, 3'58.36"
Loaded buffer Garcia_drone24, 1 channels, 2'43.405"
Loaded buffer Garcia_drone25, 1 channels, 2'44.648"
Loaded buffer Garcia_drone26, 1 channels, 1'56.997"
Loaded buffer Garcia_drone27, 1 channels, 2'25.781"
Loaded buffer Garcia_drone28, 1 channels, 2'29.349"
Loaded buffer Garcia_drone29, 1 channels, 2'29.349"
Loaded buffer Garcia_drone3, 1 channels, 11'27.789"
Loaded buffer Garcia_drone30, 1 channels, 2'40.109"
Loaded buffer Garcia_drone31, 1 channels, 2'30.72"
Loaded buffer Garcia_drone4, 1 channels, 7'19.309"
Loaded buffer Garcia_drone5, 1 channels, 5'59.691"
Loaded buffer Garcia_drone6, 1 channels, 5'44.947"
Loaded buffer Garcia_drone7, 1 channels, 5'42.08"
Loaded buffer Garcia_drone8, 1 channels, 4'6.573"
Loaded buffer Garcia_drone9, 1 channels, 3'42.749"
Skipping non-matching file type: README-AUDIOFILES.org
Loaded buffer a1, 1 channels, 0.27"
Loaded buffer a10, 1 channels, 0.29"
Loaded buffer a11, 1 channels, 0.269"
Loaded buffer a12, 1 channels, 0.281"
Loaded buffer a13, 1 channels, 0.269"
Loaded buffer a14, 1 channels, 0.28"
Loaded buffer a15, 1 channels, 0.137"
Loaded buffer a16, 1 channels, 0.128"
Loaded buffer a17, 1 channels, 0.13"
Loaded buffer a18, 1 channels, 0.117"
Loaded buffer a19, 1 channels, 0.29"
Loaded buffer a2, 1 channels, 0.282"
Loaded buffer a20, 1 channels, 0.259"
Loaded buffer a21, 1 channels, 0.288"
Loaded buffer a22, 1 channels, 0.144"
Loaded buffer a23, 1 channels, 0.113"
Loaded buffer a24, 1 channels, 0.143"
Loaded buffer a25, 1 channels, 0.115"
Loaded buffer a26, 1 channels, 0.285"
Loaded buffer a27, 1 channels, 0.139"
Loaded buffer a28, 1 channels, 0.144"
Loaded buffer a29, 1 channels, 0.11"
Loaded buffer a3, 1 channels, 0.293"
Loaded buffer a30, 1 channels, 0.119"
Loaded buffer a31, 1 channels, 0.552"
Loaded buffer a32, 1 channels, 0.216"
Loaded buffer a4, 1 channels, 0.141"
Loaded buffer a5, 1 channels, 0.128"
Loaded buffer a6, 1 channels, 0.115"
Loaded buffer a7, 1 channels, 0.137"
Loaded buffer a8, 1 channels, 0.157"
Loaded buffer a9, 1 channels, 0.101"
Loaded buffer arp, 1 channels, 5.406"
Loaded buffer bird_crickets, 1 channels, 55.587"
Loaded buffer birdcarman, 1 channels, 2'33.076"
Loaded buffer birdcarmanshort, 1 channels, 1'10.413"
Loaded buffer clap, 1 channels, 2.0"
Loaded buffer cricket_ff, 1 channels, 22.206"
Loaded buffer cricket_taps, 1 channels, 12.348"
Loaded buffer crickets, 1 channels, 42.23"
Loaded buffer crossing, 1 channels, 31.888"
Loaded buffer cymbal, 1 channels, 2.5"
Loaded buffer ding, 1 channels, 1.5"
Loaded buffer echo_crickets, 1 channels, 1'2.277"
Loaded buffer fones, 1 channels, 3.067"
Loaded buffer g, 2 channels, 0.479"
Loaded buffer hanbaiki, 1 channels, 9.039"
Loaded buffer hoge, 1 channels, 45.891"
Loaded buffer jeep, 1 channels, 1.145"
Loaded buffer lake_plane, 1 channels, 24.199"
Loaded buffer loud_crickets, 1 channels, 48.112"
Loaded buffer melodia1, 1 channels, 16.0"
Loaded buffer melodia2, 1 channels, 16.0"
Loaded buffer melodic_road, 1 channels, 26.477"
Loaded buffer noisebirdsclick, 1 channels, 40.773"
Skipping non-matching file type: rola.scd
Loaded buffer rough_steps, 1 channels, 17.509"
Loaded buffer sheep, 1 channels, 1.721"
Loaded buffer soto_benjas_rave, 2 channels, 4'33.162"
Loaded buffer soto_hat, 1 channels, 0.598"
Loaded buffer soto_hat1, 2 channels, 0.217"
Loaded buffer soto_hat2, 2 channels, 0.598"
Loaded buffer soto_hat3, 2 channels, 0.541"
Loaded buffer soto_hat4, 2 channels, 0.408"
Loaded buffer soto_hat5, 2 channels, 0.608"
Loaded buffer soto_hat6, 2 channels, 0.559"
Loaded buffer soto_kick, 1 channels, 0.332"
Loaded buffer soto_pluck, 2 channels, 2.955"
Loaded buffer soto_snare, 1 channels, 0.385"
Loaded buffer sweet_crickets, 1 channels, 1'2.277"
Loaded buffer takunia, 1 channels, 4.244"
Loaded buffer tank, 1 channels, 2.974"
loading local buffers from: PathName(/Users/iani/sc-projects/nil/audiofiles)
Looking for files in /Users/iani/sc-projects/nil/audiofiles ...
... found: [  ]
loading local buffers from: PathName(/Users/iani/sc-audiofiles/nil)
Looking for files in /Users/iani/sc-audiofiles/nil ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [ synth_test.scd ]
Loading : /Users/iani/sc-projects/global/synthdefs/synth_test.scd
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Synthdef loading for project nil is disabled.
To enable autoload synthdefs, add a file named autoload_synhdefs.scd in the project's folder
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
localhost finished loading synthdefs
loading setup folder
OscGroups testing enabled status
Looking for files in /Users/iani/sc-projects/nil/setup ...
... found: [  ]
-> Project
osc groups enabled? false
Going down to folder: 00XNPM22
The new projectfolder will become: PathName(sc-projects/00XNPM22)
The full path is  PathName(/Users/iani/sc-projects/00XNPM22)
There are  10 subfolders to work with.
The new project folder is: PathName(sc-projects/00XNPM22)
*saving path* : folder: sc-projects/00XNPM22 project: PingPong
Loading setup.scd file for project: PingPong
Enabling OscGroups. Send Port: 22244 Receive Port: 22245
OscGroups set OSC send port to: 22244
OscGroups testing enabled status
osc groups enabled? true
activating code message: /code
OscGroups testing enabled status
osc groups enabled? true
OscGroups enabled
OscGroups testing enabled status
osc groups enabled? true
Loading: /Users/iani/sc-projects/00XNPM22/PingPong/setupRecording.scd
Loading: /Users/iani/sc-projects/00XNPM22/PingPong/setupActions.scd
Setting up actions from this script
Loading: /Users/iani/sc-projects/00XNPM22/PingPong/setupOsc.scd
Connecting OSC from this script
Loading: /Users/iani/sc-projects/00XNPM22/PingPong/customizeSound.scd
Loading: /Users/iani/sc-projects/00XNPM22/PingPong/gui.scd
starting sounds
ping play ball
ball from ping received
pong play ball
ball from pong received
9.7378225326538
ball from ping received
10.263092041016
ball from pong received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [0.7, 1.2] * Line.kr(3, 0.5, 4.2)
		* SinOsc.ar(7).range(0.9, 1.1)
	).dup * 0.1 * Env.perc(0.3, 5.0).kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
16.5846118927
ball from ping received
ball from pong received
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(1, 1, 0.7)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
}
)
Pings
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [0.3, 1.2] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
};
)
Pings
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [0.7, 1.2] * Line.kr(3, 0.5, 4.2)
		* SinOsc.ar(7).range(0.9, 1.1)
	).dup * 0.1 * Env.perc(0.3, 5.0).kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
10.828995704651
ball from ping received
11.211273193359
ball from pong received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [4, 1.2] * Line.kr(3, 2, 0.6)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
10.689754486084
ball from ping received
15.680288314819
ball from pong received
10.200717926025
ball from ping received
9.0964221954346
10.617300033569
ball from pong received
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [0.5, 1.2] * Line.kr(1, 1, 0.7)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
}
)
Pings
13.041902542114
ball from ping received
ball from pong received
12.573774337769
ball from ping received
10.899622917175
ball from pong received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFSaw.ar(
		800 rrand: 200 * [1, 1.2] * Line.kr(1, 1, 0.7)
	).dup * 0.2 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
12.409405708313
10.310473442078
ball from ping received
ball from pong received
9.3549098968506
ball from ping received
14.743240356445
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ LFSaw.ar(
		200 rrand: 300 * [1, 1.5] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
};
)
Pings
ball from pong received
16.679841995239
ball from ping received
10.753788948059
ball from pong received
10.041994094849
ball from ping received
14.588366508484
ball from pong received
9.4791774749756
ball from ping received
ball from pong received
14.197002410889
ball from ping received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFSaw.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc(1, 0.01, 1, 2).kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
ball from pong received
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [0.5, 1.2] * Line.kr(1, 1, 0.7)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
}
)
Pings
9.6373462677002
ball from ping received
ball from pong received
11.996636390686
ball from ping received
12.035075187683
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFSaw.ar(
		800 rrand: 200 * [1, 1.2] * Line.kr(1, 1, 0.7)
	).dup * 0.2 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
ball from pong received
12.847284317017
ball from ping received
10.213233947754
ball from pong received
9.227087020874
ball from ping received
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [0.3, 1.2] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
};
)
Pings
ball from pong received
10.072724342346
ball from ping received
10.23521900177
ball from pong received
11.686307907104
ball from ping received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [11.1, 0.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
ball from pong received
10.342820167542
ball from ping received
ball from pong received
11.152028083801
ball from ping received
9.0898113250732
ball from pong received
13.019885063171
ball from ping received
ball from pong received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [0.7, 1.2] * Line.kr(3, 0.5, 4.2)
		* SinOsc.ar(7).range(0.9, 1.1)
	).dup * 0.1 * Env.perc(0.3, 5.0).kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
9.72105884552
ball from ping received
11.041994094849
ball from pong received
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(1, 1, 0.7)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
}
)
Pings
15.513849258423
ball from ping received
13.456250190735
========= Remote evaluation: ========= 
(
Pings addSound: {
	var tr;
	tr = 0.5 rrand: 3;
	{ SinOsc.ar(
		400 rrand: 500 * [0.3, 1.2] * Line.kr(1 * tr, 2 * tr, 0.3 exprand: 1.5)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pingtest;
};
)
Pings
ball from pong received
12.152461051941
ball from ping received
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [0.7, 1.2] * Line.kr(3, 0.5, 4.2)
		* SinOsc.ar(7).range(0.9, 1.1)
	).dup * 0.1 * Env.perc(0.3, 5.0).kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
ball from pong received
9.9163751602173
ball from ping received
9.6618213653564
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFSaw.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFSaw.ar(
		400 rrand: 500 * [1, 1.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
15.371141433716
12.85399055481
11.664189338684
ball from pong received
13.058606147766
ball from ping received
16.137224197388
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [11.1, 0.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
9.4111080169678
12.271105766296
========= Remote evaluation: ========= 
(
//:
Pongs addSound: {
	{ LFPulse.ar(
		400 rrand: 500 * [11.1, 0.2] * Line.kr(3, 2, 0.2)
	).dup * 0.1 * Env.perc.kr(doneAction: 2) } +> \pongtest;
}

)
Pongs
ball from pong received
qt.qpa.backingstore: Back buffer dpr of 2 doesn't match <_NSViewBackingLayer: 0x600000756100> contents scale of 1 - updating layer to match.
qt.qpa.backingstore: Back buffer dpr of 2 doesn't match <_NSViewBackingLayer: 0x600000756100> contents scale of 1 - updating layer to match.
SCLang Input: EOF. Will quit.
main: waiting for input thread to join...
main: quitting...
====== The default server quit ======
Removing buffer entries from lib
server 'localhost' disconnected shared memory interface
'/quit' message sent to server 'localhost'.
cleaning up OSC

*** SCLang finished ***

