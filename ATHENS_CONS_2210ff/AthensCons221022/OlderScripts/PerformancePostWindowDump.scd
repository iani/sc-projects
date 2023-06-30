LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/initialize.scd
OscGroups set OSC send port to: 22244
OscGroups enabled
-> Duel
server 'localhost' unresponsive, rebooting ...
'/quit' message sent to server 'localhost'.
Booting server 'localhost' on address 127.0.0.1:57110.
Found 0 LADSPA plugins
Remote evaluation: /* Project.gui;
 */
Project
Selecting project: nil
Selecting project: AUD420_220329
osc groups enabled? true
polled oscgroups status now
Number of Devices: 5
   0 : "BlackHole 2ch"
   1 : "External Headphones"
   2 : "MacBook Air Microphone"
   3 : "MacBook Air Speakers"
   4 : "ZoomAudioD"

"MacBook Air Microphone" Input Device
   Streams: 1
      0  channels 1

"External Headphones" Output Device
   Streams: 1
      0  channels 2

SC_AudioDriver: sample rate = 48000.000000, driver's block size = 512
SuperCollider 3 server ready.
Requested notification messages from server 'localhost'
localhost: server process's maxLogins (1) matches with my options.
localhost: keeping clientID (0) as confirmed by server process.
Shared memory server interface initialized
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/controlBusMonitor.scd
osc groups enabled? true
osc groups enabled? true
Preparing recording on 'localhost'
Recording channels [ 0, 1 ] ... 
path: '/Users/iani/Music/SuperCollider Recordings/SC_220910_191022.aiff'
loading global buffers
Looking for files in /Users/iani/sc-projects/global/audiofiles ...
... found: [ 01kiiroi.wav, 14pilgrims.wav, README-AUDIOFILES.org, bird_crickets.wav, birdcarman.wav, birdcarmanshort.wav, cricket_ff.wav, cricket_taps.wav, crickets.wav, crossing.wav, echo_crickets.wav, fones.wav, hanbaiki.wav, hoge.wav, lake_plane.wav, loud_crickets.wav, melodic_road.wav, noisebirdsclick.wav, rough_steps.wav, sweet_crickets.wav, takunia.wav ]
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
Loaded buffer hoge, 1 channels, 45.891"
Loaded buffer lake_plane, 1 channels, 24.199"
Loaded buffer loud_crickets, 1 channels, 48.112"
Loaded buffer melodic_road, 1 channels, 26.477"
Loaded buffer noisebirdsclick, 1 channels, 40.773"
Loaded buffer rough_steps, 1 channels, 17.509"
Loaded buffer sweet_crickets, 1 channels, 1'2.277"
Loaded buffer takunia, 1 channels, 4.244"
loading local buffers from: PathName(/Users/iani/sc-projects/AUD420_220329/audiofiles)
Looking for files in /Users/iani/sc-projects/AUD420_220329/audiofiles ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [  ]
osc groups enabled? true
loading local synthdefs
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/synthdefs ...
... found: [  ]
osc groups enabled? true
localhost finished loading synthdefs
loading setup folder
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/setup ...
... found: [  ]
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/newgame.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/setup.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/func.scd
osc groups enabled? true
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/display.scd
osc groups enabled? true
osc groups enabled? true
ROUND 1
FIRST ATTACK : PHOENIX
osc groups enabled? true
osc groups enabled? true
-> Duel
Remote evaluation: /* (~tactic.(0, {
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 0
PHOENIX chose Tactic 0
Score 0 : 0
Synth('temp__2' : 1002)
ERROR: Message 'a' not understood.
RECEIVER:
Instance of BinaryOpUGen {    (0x7ff248397098, gc=BC, fmt=00, flg=00, set=04)
  instance variables [9]
    synthDef : instance of SynthDef (0x7ff2680d8d78, size=16, set=4)
    inputs : instance of Array (0x7ff259acf1a8, size=2, set=2)
    rate : Symbol 'control'
    synthIndex : Integer 29
    specialIndex : Integer 9
    antecedents : nil
    descendants : nil
    widthFirstAntecedents : nil
    operator : Symbol '>'
}
ARGS:
PATH: /Users/iani/sc-projects/Ftarri220910/TI_2_Duel_with_Tasos_Albatross_Sensors.scd

PROTECTED CALL STACK:
	Meta_MethodError:new	0x7ff2606927c0
		arg this = DoesNotUnderstandError
		arg what = nil
		arg receiver = a BinaryOpUGen
	Meta_DoesNotUnderstandError:new	0x7ff260694a80
		arg this = DoesNotUnderstandError
		arg receiver = a BinaryOpUGen
		arg selector = a
		arg args = [  ]
	Object:doesNotUnderstand	0x7ff208113880
		arg this = a BinaryOpUGen
		arg selector = a
		arg args = nil
	a FunctionDef	0x7ff218027208
		sourceCode = "{
	var pch;
	pch = \\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 24, 60);
	// pch = MouseY.kr(24, 60);	// test

	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (pch.midicps), 2.0.rand, 0.1) });
	a = LPF.ar(a, 150, 2, a);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\\amp.kr(0.9).lag(1) * a
	(\\z4.bin > 0.5).lag(1);
}"
		var pch = a BinaryOpUGen
	SynthDef:buildUgenGraph	0x7ff258fd4cc0
		arg this = a SynthDef
		arg func = a Function
		arg rates = nil
		arg prependArgs = [  ]
		var result = nil
		var saveControlNames = [ ControlName  P 0 i_out scalar 0 ]
	a FunctionDef	0x7ff25846d3c0
		sourceCode = "<an open Function>"
		arg i_out = an OutputProxy
		var result = nil
		var rate = nil
		var env = nil
	SynthDef:buildUgenGraph	0x7ff258fd4cc0
		arg this = a SynthDef
		arg func = a Function
		arg rates = nil
		arg prependArgs = [  ]
		var result = nil
		var saveControlNames = nil
	a FunctionDef	0x7ff258fd3300
		sourceCode = "<an open Function>"
	Function:prTry	0x7ff261c33480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = a Function
		var wasInProtectedFunc = true
	Function:protect	0x7ff261c32a00
		arg this = a Function
		arg handler = a Function
		var result = nil
	SynthDef:build	0x7ff258fd2f40
		arg this = a SynthDef
		arg ugenGraphFunc = a Function
		arg rates = nil
		arg prependArgs = nil
	Function:play	0x7ff25912bd00
		arg this = a Function
		arg target = Group(1)
		arg outbus = 0
		arg fadeTime = 0.02
		arg addAction = addToHead
		arg args = nil
		var def = nil
		var synth = nil
		var server = localhost
		var bytes = nil
		var synthMsg = nil
	a FunctionDef	0x7ff2591b3640
		sourceCode = "<an open Function>"
	a FunctionDef	0x7ff260717780
		sourceCode = "<an open Function>"
	Function:prTry	0x7ff261c33480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = nil
		var wasInProtectedFunc = false
	
CALL STACK:
	DoesNotUnderstandError:reportError
		arg this = <instance of DoesNotUnderstandError>
	Nil:handleError
		arg this = nil
		arg error = <instance of DoesNotUnderstandError>
	Thread:handleError
		arg this = <instance of Thread>
		arg error = <instance of DoesNotUnderstandError>
	Object:throw
		arg this = <instance of DoesNotUnderstandError>
	Function:protect
		arg this = <instance of Function>
		arg handler = <instance of Function>
		var result = <instance of DoesNotUnderstandError>
	EnvironmentRedirect:use
		arg this = <instance of Mediator>
		arg function = <instance of Function>
		var result = nil
		var saveEnvir = <instance of Mediator>
	Function:playInEnvir
		arg this = <instance of Function>
		arg player = 'albatross'
		arg envir = nil
		var synth = nil
	< closed FunctionDef >  (no arguments or variables)
	Interpreter:interpretPrintCmdLine
		arg this = <instance of Interpreter>
		var res = nil
		var func = <instance of Function>
		var code = "//:
(~tactic.(1,
{
	var pch;..."
		var doc = <instance of ScelDocument>
		var ideClass = nil
	Process:interpretPrintCmdLine
		arg this = <instance of Main>
^^ ERROR: Message 'a' not understood.
RECEIVER: a BinaryOpUGen


ERROR: Message 'a' not understood.
RECEIVER:
Instance of BinaryOpUGen {    (0x7ff262aceac8, gc=D0, fmt=00, flg=00, set=04)
  instance variables [9]
    synthDef : instance of SynthDef (0x7ff2626dd698, size=16, set=4)
    inputs : instance of Array (0x7ff20812c2d8, size=2, set=2)
    rate : Symbol 'control'
    synthIndex : Integer 29
    specialIndex : Integer 9
    antecedents : nil
    descendants : nil
    widthFirstAntecedents : nil
    operator : Symbol '>'
}
ARGS:
PATH: /Users/iani/sc-projects/Ftarri220910/TI_2_Duel_with_Tasos_Albatross_Sensors.scd

PROTECTED CALL STACK:
	Meta_MethodError:new	0x7ff2606927c0
		arg this = DoesNotUnderstandError
		arg what = nil
		arg receiver = a BinaryOpUGen
	Meta_DoesNotUnderstandError:new	0x7ff260694a80
		arg this = DoesNotUnderstandError
		arg receiver = a BinaryOpUGen
		arg selector = a
		arg args = [  ]
	Object:doesNotUnderstand	0x7ff208113880
		arg this = a BinaryOpUGen
		arg selector = a
		arg args = nil
	a FunctionDef	0x7ff2627f93d8
		sourceCode = "{
	var pch;
	pch = \\x4.bamp(0.1, 0.5).linlin(0.46, 0.56, 24, 60);
	// pch = MouseY.kr(24, 60);	// test

	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (pch.midicps), 2.0.rand, 0.1) });
	a = LPF.ar(a, 150, 2, a);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\\amp.kr(0.9).lag(1) * a
	(\\z4.bin > 0.5).lag(1);
}"
		var pch = a BinaryOpUGen
	SynthDef:buildUgenGraph	0x7ff258fd4cc0
		arg this = a SynthDef
		arg func = a Function
		arg rates = nil
		arg prependArgs = [  ]
		var result = nil
		var saveControlNames = [ ControlName  P 0 i_out scalar 0 ]
	a FunctionDef	0x7ff25846d3c0
		sourceCode = "<an open Function>"
		arg i_out = an OutputProxy
		var result = nil
		var rate = nil
		var env = nil
	SynthDef:buildUgenGraph	0x7ff258fd4cc0
		arg this = a SynthDef
		arg func = a Function
		arg rates = nil
		arg prependArgs = [  ]
		var result = nil
		var saveControlNames = nil
	a FunctionDef	0x7ff258fd3300
		sourceCode = "<an open Function>"
	Function:prTry	0x7ff261c33480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = a Function
		var wasInProtectedFunc = true
	Function:protect	0x7ff261c32a00
		arg this = a Function
		arg handler = a Function
		var result = nil
	SynthDef:build	0x7ff258fd2f40
		arg this = a SynthDef
		arg ugenGraphFunc = a Function
		arg rates = nil
		arg prependArgs = nil
	Function:play	0x7ff25912bd00
		arg this = a Function
		arg target = Group(1)
		arg outbus = 0
		arg fadeTime = 0.02
		arg addAction = addToHead
		arg args = nil
		var def = nil
		var synth = nil
		var server = localhost
		var bytes = nil
		var synthMsg = nil
	a FunctionDef	0x7ff2591b3640
		sourceCode = "<an open Function>"
	a FunctionDef	0x7ff260717780
		sourceCode = "<an open Function>"
	Function:prTry	0x7ff261c33480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = nil
		var wasInProtectedFunc = false
	
CALL STACK:
	DoesNotUnderstandError:reportError
		arg this = <instance of DoesNotUnderstandError>
	Nil:handleError
		arg this = nil
		arg error = <instance of DoesNotUnderstandError>
	Thread:handleError
		arg this = <instance of Thread>
		arg error = <instance of DoesNotUnderstandError>
	Object:throw
		arg this = <instance of DoesNotUnderstandError>
	Function:protect
		arg this = <instance of Function>
		arg handler = <instance of Function>
		var result = <instance of DoesNotUnderstandError>
	EnvironmentRedirect:use
		arg this = <instance of Mediator>
		arg function = <instance of Function>
		var result = nil
		var saveEnvir = <instance of Mediator>
	Function:playInEnvir
		arg this = <instance of Function>
		arg player = 'albatross'
		arg envir = nil
		var synth = nil
	< closed FunctionDef >  (no arguments or variables)
	Interpreter:interpretPrintCmdLine
		arg this = <instance of Interpreter>
		var res = nil
		var func = <instance of Function>
		var code = "//:
(~tactic.(1,
{
	var pch;..."
		var doc = <instance of ScelDocument>
		var ideClass = nil
	Process:interpretPrintCmdLine
		arg this = <instance of Main>
^^ ERROR: Message 'a' not understood.
RECEIVER: a BinaryOpUGen


Turn 1
ALBATROSS chose Tactic 1
Score 0 : 1
-> Synth('temp__5' : 1003)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 2
PHOENIX chose Tactic 3
Score 3 : 1
Synth('temp__6' : 1004)
Turn 3
ALBATROSS chose Tactic 4
Score 3 : 4
-> Synth('temp__7' : 1005)
Remote evaluation: /* (~tactic.(4, {
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 4
PHOENIX chose Tactic 4
Score 4 : 4
Synth('temp__8' : 1006)
Turn 5
ALBATROSS chose Tactic 3
Score 4 : 5
-> Synth('temp__9' : 1007)
Remote evaluation: /* (~tactic.(2, {
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 6
PHOENIX chose Tactic 2
Score 7 : 5
Synth('temp__10' : 1008)
Turn 7
ALBATROSS chose Tactic 5
Score 7 : 8
-> Synth('temp__11' : 1009)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 8
PHOENIX chose Tactic 3
Score 8 : 8
Synth('temp__12' : 1010)
Turn 9
ALBATROSS chose Tactic 4
Score 8 : 11
-> Synth('temp__13' : 1011)
Remote evaluation: /* (~tactic.(1, {
	var pch;
	pch = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 72);
	// pch = MouseX.kr(36, 72);	// test

	a = (0..4)*5.5 + pch;
	a = Mix(SinOsc.ar(a.midicps, 0, 0.15));
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.9).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 10
PHOENIX chose Tactic 1
Score 9 : 11
Synth('temp__14' : 1012)
Turn 11
ALBATROSS chose Tactic 1
Score 9 : 12
-> Synth('temp__15' : 1013)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 12
PHOENIX chose Tactic 3
Score 12 : 12
Synth('temp__16' : 1014)
Turn 13
ALBATROSS chose Tactic 4
Score 12 : 15
-> Synth('temp__17' : 1015)
Remote evaluation: /* (~tactic.(4, {
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 14
PHOENIX chose Tactic 4
Score 13 : 15
Synth('temp__18' : 1016)
Turn 15
ALBATROSS chose Tactic 1
Score 13 : 16
-> Synth('temp__19' : 1017)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 16
PHOENIX chose Tactic 3
Score 16 : 16
DRAW
Synth('temp__20' : 1018)
Remote evaluation: /* \phoenix.stop(2); \albatross.stop(2);
 */
albatross
-> albatross
Recording Stopped: (SC_220910_191022.aiff)
====== The default server quit ======
Removing buffer entries from lib
server 'localhost' disconnected shared memory interface
'/quit' message sent to server 'localhost'.
compiling class library...
	Found 855 primitives.
	Compiling directory '/Applications/SuperCollider/SuperCollider.app/Contents/Resources/SCClassLibrary'
	Compiling directory '/Users/iani/Library/Application Support/SuperCollider/Extensions'
	numentries = 1525534 / 22990656 = 0.066
	6344 method selectors, 3624 classes
	method table size 24583928 bytes, big table size 183925248
	Number of Symbols 16206
	Byte Code Size 471121
	compiled 714 files in 0.34 seconds

Info: 5 methods are currently overwritten by extensions. To see which, execute:
MethodOverride.printAll

compile done
localhost : setting clientID to 0.
internal : setting clientID to 0.
Emacs: Initializing lisp interface.
Class tree inited in 0.01 seconds
WARNING: Extension in '/Users/iani/Library/Application Support/SuperCollider/Extensions/sc-hacks-redux/Classes/OperatorsAndShortcuts/UGenShortcuts.sc' overwrites UGen:lag in main class library.
Intentional overwrites must be put in a 'SystemOverwrites' subfolder.


*** Welcome to SuperCollider 3.12.2. *** For help type C-c C-y.
Emacs: Index help topics in 0.632 seconds
Emacs: Built symbol table in 0.0132 seconds
-> Project
Selecting project: nil
Selecting project: AUD420_220329
osc groups enabled? false
polled oscgroups status now
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/initialize.scd
osc groups enabled? false
OscGroups set OSC send port to: 22244
osc groups enabled? false
osc groups enabled? true
OscGroups enabled
osc groups enabled? true
osc groups enabled? true
-> Duel
server 'localhost' unresponsive, rebooting ...
'/quit' message sent to server 'localhost'.
Booting server 'localhost' on address 127.0.0.1:57110.
Found 0 LADSPA plugins
Number of Devices: 5
   0 : "BlackHole 2ch"
   1 : "External Headphones"
   2 : "MacBook Air Microphone"
   3 : "MacBook Air Speakers"
   4 : "ZoomAudioD"

"MacBook Air Microphone" Input Device
   Streams: 1
      0  channels 1

"External Headphones" Output Device
   Streams: 1
      0  channels 2

SC_AudioDriver: sample rate = 48000.000000, driver's block size = 512
SuperCollider 3 server ready.
Requested notification messages from server 'localhost'
localhost: server process's maxLogins (1) matches with my options.
localhost: keeping clientID (0) as confirmed by server process.
Shared memory server interface initialized
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/controlBusMonitor.scd
osc groups enabled? true
osc groups enabled? true
Preparing recording on 'localhost'
Recording channels [ 0, 1 ] ... 
path: '/Users/iani/Music/SuperCollider Recordings/SC_220910_192153.aiff'
loading global buffers
Looking for files in /Users/iani/sc-projects/global/audiofiles ...
... found: [ 01kiiroi.wav, 14pilgrims.wav, README-AUDIOFILES.org, bird_crickets.wav, birdcarman.wav, birdcarmanshort.wav, cricket_ff.wav, cricket_taps.wav, crickets.wav, crossing.wav, echo_crickets.wav, fones.wav, hanbaiki.wav, hoge.wav, lake_plane.wav, loud_crickets.wav, melodic_road.wav, noisebirdsclick.wav, rough_steps.wav, sweet_crickets.wav, takunia.wav ]
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
Loaded buffer hoge, 1 channels, 45.891"
Loaded buffer lake_plane, 1 channels, 24.199"
Loaded buffer loud_crickets, 1 channels, 48.112"
Loaded buffer melodic_road, 1 channels, 26.477"
Loaded buffer noisebirdsclick, 1 channels, 40.773"
Loaded buffer rough_steps, 1 channels, 17.509"
Loaded buffer sweet_crickets, 1 channels, 1'2.277"
Loaded buffer takunia, 1 channels, 4.244"
loading local buffers from: PathName(/Users/iani/sc-projects/AUD420_220329/audiofiles)
Looking for files in /Users/iani/sc-projects/AUD420_220329/audiofiles ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [  ]
osc groups enabled? true
loading local synthdefs
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/synthdefs ...
... found: [  ]
osc groups enabled? true
localhost finished loading synthdefs
loading setup folder
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/setup ...
... found: [  ]
osc groups enabled? true
Remote evaluation: /* OscGroups.forward; // default: forward /sense/data
 */
OscGroups
Recording Stopped: (SC_220910_192153.aiff)
====== The default server quit ======
Removing buffer entries from lib
server 'localhost' disconnected shared memory interface
'/quit' message sent to server 'localhost'.
compiling class library...
	Found 855 primitives.
	Compiling directory '/Applications/SuperCollider/SuperCollider.app/Contents/Resources/SCClassLibrary'
	Compiling directory '/Users/iani/Library/Application Support/SuperCollider/Extensions'
	numentries = 1525534 / 22990656 = 0.066
	6344 method selectors, 3624 classes
	method table size 24583928 bytes, big table size 183925248
	Number of Symbols 16206
	Byte Code Size 471121
	compiled 714 files in 0.30 seconds

Info: 5 methods are currently overwritten by extensions. To see which, execute:
MethodOverride.printAll

compile done
localhost : setting clientID to 0.
internal : setting clientID to 0.
Emacs: Initializing lisp interface.
Class tree inited in 0.01 seconds
WARNING: Extension in '/Users/iani/Library/Application Support/SuperCollider/Extensions/sc-hacks-redux/Classes/OperatorsAndShortcuts/UGenShortcuts.sc' overwrites UGen:lag in main class library.
Intentional overwrites must be put in a 'SystemOverwrites' subfolder.


*** Welcome to SuperCollider 3.12.2. *** For help type C-c C-y.
Emacs: Index help topics in 0.616 seconds
Emacs: Built symbol table in 0.0125 seconds
-> Project
Selecting project: nil
Selecting project: AUD420_220329
osc groups enabled? false
polled oscgroups status now
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/initialize.scd
osc groups enabled? false
OscGroups set OSC send port to: 22244
osc groups enabled? false
osc groups enabled? true
OscGroups enabled
osc groups enabled? true
osc groups enabled? true
-> Duel
server 'localhost' unresponsive, rebooting ...
'/quit' message sent to server 'localhost'.
Booting server 'localhost' on address 127.0.0.1:57110.
Found 0 LADSPA plugins
Number of Devices: 5
   0 : "BlackHole 2ch"
   1 : "External Headphones"
   2 : "MacBook Air Microphone"
   3 : "MacBook Air Speakers"
   4 : "ZoomAudioD"

"MacBook Air Microphone" Input Device
   Streams: 1
      0  channels 1

"External Headphones" Output Device
   Streams: 1
      0  channels 2

SC_AudioDriver: sample rate = 48000.000000, driver's block size = 512
SuperCollider 3 server ready.
Requested notification messages from server 'localhost'
localhost: server process's maxLogins (1) matches with my options.
localhost: keeping clientID (0) as confirmed by server process.
Shared memory server interface initialized
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/controlBusMonitor.scd
osc groups enabled? true
osc groups enabled? true
Preparing recording on 'localhost'
Recording channels [ 0, 1 ] ... 
path: '/Users/iani/Music/SuperCollider Recordings/SC_220910_192334.aiff'
loading global buffers
Looking for files in /Users/iani/sc-projects/global/audiofiles ...
... found: [ 01kiiroi.wav, 14pilgrims.wav, README-AUDIOFILES.org, bird_crickets.wav, birdcarman.wav, birdcarmanshort.wav, cricket_ff.wav, cricket_taps.wav, crickets.wav, crossing.wav, echo_crickets.wav, fones.wav, hanbaiki.wav, hoge.wav, lake_plane.wav, loud_crickets.wav, melodic_road.wav, noisebirdsclick.wav, rough_steps.wav, sweet_crickets.wav, takunia.wav ]
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
Loaded buffer hoge, 1 channels, 45.891"
Loaded buffer lake_plane, 1 channels, 24.199"
Loaded buffer loud_crickets, 1 channels, 48.112"
Loaded buffer melodic_road, 1 channels, 26.477"
Loaded buffer noisebirdsclick, 1 channels, 40.773"
Loaded buffer rough_steps, 1 channels, 17.509"
Loaded buffer sweet_crickets, 1 channels, 1'2.277"
Loaded buffer takunia, 1 channels, 4.244"
loading local buffers from: PathName(/Users/iani/sc-projects/AUD420_220329/audiofiles)
Looking for files in /Users/iani/sc-projects/AUD420_220329/audiofiles ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [  ]
osc groups enabled? true
loading local synthdefs
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/synthdefs ...
... found: [  ]
osc groups enabled? true
localhost finished loading synthdefs
loading setup folder
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/setup ...
... found: [  ]
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/endRecording.scd
osc groups enabled? true
Recording Stopped: (SC_220910_192334.aiff)
osc groups enabled? true
-> Duel
====== The default server quit ======
Removing buffer entries from lib
server 'localhost' disconnected shared memory interface
'/quit' message sent to server 'localhost'.
compiling class library...
	Found 855 primitives.
	Compiling directory '/Applications/SuperCollider/SuperCollider.app/Contents/Resources/SCClassLibrary'
	Compiling directory '/Users/iani/Library/Application Support/SuperCollider/Extensions'
	numentries = 1525534 / 22990656 = 0.066
	6344 method selectors, 3624 classes
	method table size 24583928 bytes, big table size 183925248
	Number of Symbols 16206
	Byte Code Size 471121
	compiled 714 files in 0.35 seconds

Info: 5 methods are currently overwritten by extensions. To see which, execute:
MethodOverride.printAll

compile done
localhost : setting clientID to 0.
internal : setting clientID to 0.
Emacs: Initializing lisp interface.
Class tree inited in 0.02 seconds
WARNING: Extension in '/Users/iani/Library/Application Support/SuperCollider/Extensions/sc-hacks-redux/Classes/OperatorsAndShortcuts/UGenShortcuts.sc' overwrites UGen:lag in main class library.
Intentional overwrites must be put in a 'SystemOverwrites' subfolder.


*** Welcome to SuperCollider 3.12.2. *** For help type C-c C-y.
Emacs: Index help topics in 1.19 seconds
Emacs: Built symbol table in 0.0157 seconds
-> Project
Selecting project: nil
Selecting project: AUD420_220329
osc groups enabled? false
polled oscgroups status now
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/initialize.scd
osc groups enabled? false
OscGroups set OSC send port to: 22244
osc groups enabled? false
osc groups enabled? true
OscGroups enabled
osc groups enabled? true
osc groups enabled? true
-> Duel
server 'localhost' unresponsive, rebooting ...
'/quit' message sent to server 'localhost'.
Booting server 'localhost' on address 127.0.0.1:57110.
Found 0 LADSPA plugins
Number of Devices: 5
   0 : "BlackHole 2ch"
   1 : "External Headphones"
   2 : "MacBook Air Microphone"
   3 : "MacBook Air Speakers"
   4 : "ZoomAudioD"

"MacBook Air Microphone" Input Device
   Streams: 1
      0  channels 1

"External Headphones" Output Device
   Streams: 1
      0  channels 2

SC_AudioDriver: sample rate = 48000.000000, driver's block size = 512
SuperCollider 3 server ready.
Requested notification messages from server 'localhost'
localhost: server process's maxLogins (1) matches with my options.
localhost: keeping clientID (0) as confirmed by server process.
Shared memory server interface initialized
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/controlBusMonitor.scd
osc groups enabled? true
osc groups enabled? true
Preparing recording on 'localhost'
Recording channels [ 0, 1 ] ... 
path: '/Users/iani/Music/SuperCollider Recordings/SC_220910_195633.aiff'
loading global buffers
Looking for files in /Users/iani/sc-projects/global/audiofiles ...
... found: [ 01kiiroi.wav, 14pilgrims.wav, README-AUDIOFILES.org, bird_crickets.wav, birdcarman.wav, birdcarmanshort.wav, cricket_ff.wav, cricket_taps.wav, crickets.wav, crossing.wav, echo_crickets.wav, fones.wav, hanbaiki.wav, hoge.wav, lake_plane.wav, loud_crickets.wav, melodic_road.wav, noisebirdsclick.wav, rough_steps.wav, sweet_crickets.wav, takunia.wav ]
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
Loaded buffer hoge, 1 channels, 45.891"
Loaded buffer lake_plane, 1 channels, 24.199"
Loaded buffer loud_crickets, 1 channels, 48.112"
Loaded buffer melodic_road, 1 channels, 26.477"
Loaded buffer noisebirdsclick, 1 channels, 40.773"
Loaded buffer rough_steps, 1 channels, 17.509"
Loaded buffer sweet_crickets, 1 channels, 1'2.277"
Loaded buffer takunia, 1 channels, 4.244"
loading local buffers from: PathName(/Users/iani/sc-projects/AUD420_220329/audiofiles)
Looking for files in /Users/iani/sc-projects/AUD420_220329/audiofiles ...
... found: [  ]
localhost finished loading buffers
loading global synthdefs
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/global/synthdefs ...
... found: [  ]
osc groups enabled? true
loading local synthdefs
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/synthdefs ...
... found: [  ]
osc groups enabled? true
localhost finished loading synthdefs
loading setup folder
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/AUD420_220329/setup ...
... found: [  ]
osc groups enabled? true
Remote evaluation: /* ({
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__2' : 1002)
-> Synth('temp__3' : 1003)
-> ( 'key': 58 )
-> Synth('temp__4' : 1004)
-> ( 'root': 59 )
-> a Routine
-> a Routine
-> Synth('temp__5' : 1005)
Remote evaluation: /* (key: 33) ++> \phoenix;
 */
( 'key': 33 )
-> a Routine
-> a Routine
-> Synth('temp__6' : 1006)
Remote evaluation: /* ({
	var pch;
	pch = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 72);
	// pch = MouseX.kr(36, 72);	// test

	a = (0..4)*5.5 + pch;
	a = Mix(SinOsc.ar(a.midicps, 0, 0.15));
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__7' : 1007)
-> a Routine
-> a Routine
-> ( 'freq': 1800 )
-> ( 'freq': 5800 )
Remote evaluation: /* ({
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__8' : 1008)
-> ( 'freq': 580 )
Remote evaluation: /* ({
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__9' : 1009)
-> ( 'freq': 58 )
-> ( 'freq': 258 )
-> Synth('temp__10' : 1010)
-> Synth('temp__11' : 1011)
Remote evaluation: /* ({
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__12' : 1012)
-> Synth('temp__13' : 1013)
Remote evaluation: /* ({
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__14' : 1014)
-> Synth('temp__15' : 1015)
-> Synth('temp__16' : 1016)
Remote evaluation: /* ({
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__17' : 1017)
-> ( 'key': 88 )
Remote evaluation: /* ({
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__18' : 1018)
-> ( 'key': 68 )
-> Synth('temp__19' : 1019)
-> a Routine
Remote evaluation: /* ({
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__20' : 1020)
Remote evaluation: /* ({
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__21' : 1021)
-> a Routine
-> Synth('temp__22' : 1022)
-> Synth('temp__23' : 1023)
Remote evaluation: /* ({
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__24' : 1024)
Remote evaluation: /* ({
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix )
 */
Synth('temp__25' : 1025)
-> ( 'amp': 0.1 )
-> ( 'amp': 0.05 )
-> ( 'amp': 0.01 )
Remote evaluation: /* (key: 32) ++> \phoenix;
 */
( 'key': 32 )
Remote evaluation: /* (key: 31) ++> \phoenix;
 */
( 'key': 31 )
-> ( 'amp': 0.001 )
Remote evaluation: /* \phoenix.stop(2);
 */
phoenix
-> albatross
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/newgame.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/setup.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/func.scd
osc groups enabled? true
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/display.scd
osc groups enabled? true
osc groups enabled? true
ROUND 1
FIRST ATTACK : PHOENIX
osc groups enabled? true
osc groups enabled? true
-> Duel
Remote evaluation: /* (~tactic.(0, {
	a = Dust.ar(10);
	b = EnvGen.ar(Env.perc(0, 0.01), a);
	c = 2000.rand + 50;
	c = LFNoise0.ar(100, c, c+50);
	c = Latch.ar(c, a);
	d = RLPF.ar(a, c, 0.05, 10);
	a = SinOsc.ar(10000.rand, 0, d);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 0
PHOENIX chose Tactic 0
Score 0 : 0
Synth('temp__26' : 1026)
Turn 1
ALBATROSS chose Tactic 1
Score 0 : 1
-> Synth('temp__27' : 1027)
Remote evaluation: /* (~tactic.(3, {
	a = Impulse.ar(20.0.rand + 1);
	b = LFSaw.ar(1000)+1/2;
	b = Latch.ar(b, a);
	c = EnvGen.ar(Env.perc(0.005, 0.1), a);
	a = SinOsc.ar(1000*b, 0, c/2);
	a = SinOsc.ar(8000.rand, 0, a);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 2
PHOENIX chose Tactic 3
Score 3 : 1
Synth('temp__28' : 1028)
Turn 3
ALBATROSS chose Tactic 4
Score 3 : 4
-> Synth('temp__29' : 1029)
Remote evaluation: /* (~tactic.(0, {
	a = Dust.ar(10);
	b = EnvGen.ar(Env.perc(0, 0.01), a);
	c = 2000.rand + 50;
	c = LFNoise0.ar(100, c, c+50);
	c = Latch.ar(c, a);
	d = RLPF.ar(a, c, 0.05, 10);
	a = SinOsc.ar(10000.rand, 0, d);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 4
PHOENIX chose Tactic 0
Score 4 : 4
Synth('temp__30' : 1030)
Turn 5
ALBATROSS chose Tactic 5
Score 4 : 5
-> Synth('temp__31' : 1031)
Remote evaluation: /* ~tactic.(5, {{ } +> \phoenix });
 */
Turn 6
PHOENIX chose Tactic 5
Score 7 : 5
Synth('temp__32' : 1032)
Turn 7
ALBATROSS chose Tactic 3
Score 7 : 9
-> Synth('temp__33' : 1033)
Remote evaluation: /* (~tactic.(2, {
	x = (60.rand + 36).midicps;
	a = Impulse.ar(LFNoise0.ar(1.2, 7, 8));
	b = LFNoise0.ar(LFNoise0.ar(1, 7, 8), x/5, x);
	a = CombN.ar(a*1.5, 0.1, 1/b, 0.7);
	a = LPF.ar(HPF.ar(a, 50), 15000);
	a = Pan2.ar(a, 0.7);
	a = FreeVerb2.ar(a[0], a[1], 0.3, 0.2);
} +> \phoenix ))
 */
Turn 8
PHOENIX chose Tactic 2
Score 10 : 9
Synth('temp__34' : 1034)
Turn 9
ALBATROSS chose Tactic 5
Score 10 : 12
-> Synth('temp__35' : 1035)
Remote evaluation: /* (~tactic.(3, {
	a = Impulse.ar(20.0.rand + 1);
	b = LFSaw.ar(1000)+1/2;
	b = Latch.ar(b, a);
	c = EnvGen.ar(Env.perc(0.005, 0.1), a);
	a = SinOsc.ar(1000*b, 0, c/2);
	a = SinOsc.ar(8000.rand, 0, a);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 10
PHOENIX chose Tactic 3
Score 11 : 12
Synth('temp__36' : 1036)
Turn 11
ALBATROSS chose Tactic 4
Score 11 : 15
-> Synth('temp__37' : 1037)
Remote evaluation: /* (~tactic.(1, {
	a = PinkNoise.ar;
	a = Mix.fill(6, {
		BPF.ar(a, 2000.rand + 50, 1/500, SinOsc.ar(1.0.rand, 0, 15, 16));
	});
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 12
PHOENIX chose Tactic 1
Score 12 : 15
Synth('temp__38' : 1038)
Turn 13
ALBATROSS chose Tactic 0
Score 12 : 16
-> Synth('temp__39' : 1039)
Remote evaluation: /* (~tactic.(2, {
	x = (60.rand + 36).midicps;
	a = Impulse.ar(LFNoise0.ar(1.2, 7, 8));
	b = LFNoise0.ar(LFNoise0.ar(1, 7, 8), x/5, x);
	a = CombN.ar(a*1.5, 0.1, 1/b, 0.7);
	a = LPF.ar(HPF.ar(a, 50), 15000);
	a = Pan2.ar(a, 0.7);
	a = FreeVerb2.ar(a[0], a[1], 0.3, 0.2);
} +> \phoenix ))
 */
Turn 14
PHOENIX chose Tactic 2
Score 15 : 16
Synth('temp__40' : 1040)
Turn 15
ALBATROSS chose Tactic 2
Score 15 : 19
-> Synth('temp__41' : 1041)
Remote evaluation: /* (~tactic.(0, {
	a = Dust.ar(10);
	b = EnvGen.ar(Env.perc(0, 0.01), a);
	c = 2000.rand + 50;
	c = LFNoise0.ar(100, c, c+50);
	c = Latch.ar(c, a);
	d = RLPF.ar(a, c, 0.05, 10);
	a = SinOsc.ar(10000.rand, 0, d);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 16
PHOENIX chose Tactic 0
Score 18 : 19
ALBATROSS WINS
Synth('temp__42' : 1042)
-> albatross
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/newgame.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/setup.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/func.scd
osc groups enabled? true
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/display.scd
osc groups enabled? true
osc groups enabled? true
ROUND 2
FIRST ATTACK : ALBATROSS
osc groups enabled? true
osc groups enabled? true
-> Duel
Turn 0
ALBATROSS chose Tactic 2
Score 0 : 0
-> Synth('temp__43' : 1043)
Remote evaluation: /* (~tactic.(0, {
	a = Dust.ar(10);
	b = EnvGen.ar(Env.perc(0, 0.01), a);
	c = 2000.rand + 50;
	c = LFNoise0.ar(100, c, c+50);
	c = Latch.ar(c, a);
	d = RLPF.ar(a, c, 0.05, 10);
	a = SinOsc.ar(10000.rand, 0, d);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 1
PHOENIX chose Tactic 0
Score 3 : 0
Synth('temp__44' : 1044)
Turn 2
ALBATROSS chose Tactic 5
Score 3 : 1
-> Synth('temp__45' : 1045)
Remote evaluation: /* (~tactic.(3, {
	a = Impulse.ar(20.0.rand + 1);
	b = LFSaw.ar(1000)+1/2;
	b = Latch.ar(b, a);
	c = EnvGen.ar(Env.perc(0.005, 0.1), a);
	a = SinOsc.ar(1000*b, 0, c/2);
	a = SinOsc.ar(8000.rand, 0, a);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 3
PHOENIX chose Tactic 3
Score 4 : 1
Synth('temp__46' : 1046)
Turn 4
ALBATROSS chose Tactic 4
Score 4 : 4
-> Synth('temp__47' : 1047)
Remote evaluation: /* (~tactic.(4, {
	a = Mix.fill(4, { LFPulse.kr(Rand(0.3, 0.7), Rand(0, 1))/4 });
	b = Rand(50, 500);
	b = b/3 * a + b;
	c = Rand(0, 5);
	d = Latch.kr(LFNoise0.kr, Changed.kr(a)).lag(0.05);
	a = PMOsc.ar(b, b*c, Rand(0, 20)*d)/4*d;
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 5
PHOENIX chose Tactic 4
Score 5 : 4
Synth('temp__48' : 1048)
Turn 6
ALBATROSS chose Tactic 3
Score 5 : 5
-> Synth('temp__49' : 1049)
Remote evaluation: /* (~tactic.(0, {
	a = Dust.ar(10);
	b = EnvGen.ar(Env.perc(0, 0.01), a);
	c = 2000.rand + 50;
	c = LFNoise0.ar(100, c, c+50);
	c = Latch.ar(c, a);
	d = RLPF.ar(a, c, 0.05, 10);
	a = SinOsc.ar(10000.rand, 0, d);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 7
PHOENIX chose Tactic 0
Score 6 : 5
Synth('temp__50' : 1050)
Turn 8
ALBATROSS chose Tactic 1
Score 6 : 6
-> Synth('temp__51' : 1051)
Remote evaluation: /* (~tactic.(3, {
	a = Impulse.ar(20.0.rand + 1);
	b = LFSaw.ar(1000)+1/2;
	b = Latch.ar(b, a);
	c = EnvGen.ar(Env.perc(0.005, 0.1), a);
	a = SinOsc.ar(1000*b, 0, c/2);
	a = SinOsc.ar(8000.rand, 0, a);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 9
PHOENIX chose Tactic 3
Score 9 : 6
Synth('temp__52' : 1052)
Turn 10
ALBATROSS chose Tactic 4
Score 9 : 9
-> Synth('temp__53' : 1053)
Remote evaluation: /* (~tactic.(1, {
	a = PinkNoise.ar;
	a = Mix.fill(6, {
		BPF.ar(a, 2000.rand + 50, 1/500, SinOsc.ar(1.0.rand, 0, 15, 16));
	});
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 11
PHOENIX chose Tactic 1
Score 10 : 9
Synth('temp__54' : 1054)
Turn 12
ALBATROSS chose Tactic 0
Score 10 : 10
-> Synth('temp__55' : 1055)
Remote evaluation: /* (~tactic.(2, {
	x = (60.rand + 36).midicps;
	a = Impulse.ar(LFNoise0.ar(1.2, 7, 8));
	b = LFNoise0.ar(LFNoise0.ar(1, 7, 8), x/5, x);
	a = CombN.ar(a*1.5, 0.1, 1/b, 0.7);
	a = LPF.ar(HPF.ar(a, 50), 15000);
	a = Pan2.ar(a, 0.7);
	a = FreeVerb2.ar(a[0], a[1], 0.3, 0.2);
} +> \phoenix ))
 */
Turn 13
PHOENIX chose Tactic 2
Score 13 : 10
Synth('temp__56' : 1056)
Turn 14
ALBATROSS chose Tactic 5
Score 13 : 13
-> Synth('temp__57' : 1057)
Remote evaluation: /* (~tactic.(3, {
	a = Impulse.ar(20.0.rand + 1);
	b = LFSaw.ar(1000)+1/2;
	b = Latch.ar(b, a);
	c = EnvGen.ar(Env.perc(0.005, 0.1), a);
	a = SinOsc.ar(1000*b, 0, c/2);
	a = SinOsc.ar(8000.rand, 0, a);
	a = Pan2.ar(a, 0.7);
} +> \phoenix ))
 */
Turn 15
PHOENIX chose Tactic 3
Score 14 : 13
Synth('temp__58' : 1058)
Turn 16
ALBATROSS chose Tactic 4
Score 14 : 16
ALBATROSS WINS
-> Synth('temp__59' : 1059)
-> albatross
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/newgame.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/setup.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/func.scd
osc groups enabled? true
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/display.scd
osc groups enabled? true
osc groups enabled? true
ROUND 3
FIRST ATTACK : PHOENIX
osc groups enabled? true
osc groups enabled? true
-> Duel
Remote evaluation: /* (~tactic.(0, {
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 0
PHOENIX chose Tactic 0
Score 0 : 0
Synth('temp__60' : 1060)
-> ( 'amp': 0.9 )
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
FAILURE IN SERVER /n_set Node 1059 not found
Turn 1
ALBATROSS chose Tactic 0
Score 0 : 1
-> Synth('temp__61' : 1061)
Remote evaluation: /* (~tactic.(2, {
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 2
PHOENIX chose Tactic 2
Score 3 : 1
Synth('temp__62' : 1062)
Turn 3
ALBATROSS chose Tactic 2
Score 3 : 4
-> Synth('temp__63' : 1063)
Remote evaluation: /* (~tactic.(1, {
	var pch;
	pch = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 72);
	// pch = MouseX.kr(36, 72);	// test

	a = (0..4)*5.5 + pch;
	a = Mix(SinOsc.ar(a.midicps, 0, 0.15));
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.9).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 4
PHOENIX chose Tactic 1
Score 6 : 4
Synth('temp__64' : 1064)
Turn 5
ALBATROSS chose Tactic 1
Score 6 : 5
-> Synth('temp__65' : 1065)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 6
PHOENIX chose Tactic 3
Score 9 : 5
Synth('temp__66' : 1066)
Turn 7
ALBATROSS chose Tactic 4
Score 9 : 8
-> Synth('temp__67' : 1067)
Remote evaluation: /* (~tactic.(4, {
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 8
PHOENIX chose Tactic 4
Score 10 : 8
Synth('temp__68' : 1068)
Turn 9
ALBATROSS chose Tactic 3
Score 10 : 9
-> Synth('temp__69' : 1069)
Remote evaluation: /* (~tactic.(2, {
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 10
PHOENIX chose Tactic 2
Score 13 : 9
Synth('temp__70' : 1070)
Turn 11
ALBATROSS chose Tactic 5
Score 13 : 12
-> Synth('temp__71' : 1071)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 12
PHOENIX chose Tactic 3
Score 14 : 12
Synth('temp__72' : 1072)
Turn 13
ALBATROSS chose Tactic 4
Score 14 : 15
-> Synth('temp__73' : 1073)
Remote evaluation: /* (~tactic.(4, {
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 14
PHOENIX chose Tactic 4
Score 15 : 15
Synth('temp__74' : 1074)
Turn 15
ALBATROSS chose Tactic 0
Score 15 : 16
-> Synth('temp__75' : 1075)
Remote evaluation: /* (~tactic.(2, {
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 16
PHOENIX chose Tactic 2
Score 18 : 16
PHOENIX WINS
Synth('temp__76' : 1076)
-> albatross
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/newgame.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/setup.scd
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/func.scd
osc groups enabled? true
osc groups enabled? true
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/display.scd
osc groups enabled? true
osc groups enabled? true
ROUND 4
FIRST ATTACK : ALBATROSS
osc groups enabled? true
osc groups enabled? true
-> Duel
Turn 0
ALBATROSS chose Tactic 0
Score 0 : 0
-> Synth('temp__77' : 1077)
Remote evaluation: /* (~tactic.(2, {
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 1
PHOENIX chose Tactic 2
Score 3 : 0
Synth('temp__78' : 1078)
Turn 2
ALBATROSS chose Tactic 2
Score 3 : 3
-> Synth('temp__79' : 1079)
Remote evaluation: /* (~tactic.(0, {
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 3
PHOENIX chose Tactic 0
Score 6 : 3
Synth('temp__80' : 1080)
Turn 4
ALBATROSS chose Tactic 1
Score 6 : 4
-> Synth('temp__81' : 1081)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 5
PHOENIX chose Tactic 3
Score 9 : 4
Synth('temp__82' : 1082)
Turn 6
ALBATROSS chose Tactic 4
Score 9 : 7
-> Synth('temp__83' : 1083)
Remote evaluation: /* (~tactic.(4, {
	var frq;
	frq = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 100, 8000);
	// frq = MouseX.kr(100, 8000);		// test

	a = LFSaw.ar(1000)+1/2;
	b = Impulse.ar(20.0.rand + 2);
	c = Latch.ar(a, b);
	d = EnvGen.ar(Env.perc(0, 0.1), b);
	a = LFSaw.ar(c * 500 + 100) * d;
	a = RLPF.ar(a, frq, 0.2);
	a = Limiter.ar(a, -1.dbamp);
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 7
PHOENIX chose Tactic 4
Score 10 : 7
Synth('temp__84' : 1084)
Turn 8
ALBATROSS chose Tactic 3
Score 10 : 8
-> Synth('temp__85' : 1085)
Remote evaluation: /* (~tactic.(2, {
	var frq = 400.rand + 50;
	var rte;
	rte = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0.2, 5);
	// rte = MouseX.kr(0.2, 5);	// test

	a = LFNoise1.ar(1, rte, rte + 0.1);
	a = LFSaw.ar(a)+1/2**2;
	b = (a*pi).sin;
	a = Mix.fill(4, {|n| LFSaw.ar(n/100 + 1 * (a*frq+frq), 2.0.rand, b/4) });
	a = Pan2.ar(a, 0.7);

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 9
PHOENIX chose Tactic 2
Score 13 : 8
Synth('temp__86' : 1086)
Turn 10
ALBATROSS chose Tactic 2
Score 13 : 11
-> Synth('temp__87' : 1087)
Remote evaluation: /* (~tactic.(0, {
	var key = \key.kr(32);
	var amp = Slope.kr(
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1).lag(1);
		// MouseX.kr(0, 1).lag(2);			// test
	).abs.max(0.02).min(1);
	var osc = [PinkNoise.ar(amp), PinkNoise.ar(amp)];
	osc = RLPF.ar(osc,
		\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, key, 132).midicps;
		// MouseX.kr(key, 132).midicps;	// test
		, 0.5);
	osc = Mix.fill(10, {|n| BPF.ar(osc, midicps(n*\itv.kr(5)+key), 0.01, 10)});
	osc = CombN.ar(osc, 0.2, 0.2, 1, 1, osc);

	\amp.kr(0.8).lag(1) * osc
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 11
PHOENIX chose Tactic 0
Score 16 : 11
Synth('temp__88' : 1088)
Turn 12
ALBATROSS chose Tactic 1
Score 16 : 12
-> Synth('temp__89' : 1089)
Remote evaluation: /* (~tactic.(3, {
	var amp;
	amp = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 0, 1);
	// amp = MouseX.kr;			// test

	a = 2000.rand + 100;
	a = LFNoise2.ar(100, a/5, a);
	a = SinOsc.ar(a, 0, amp);
	a = Pan2.ar(a, SinOsc.ar(0.5.rand));

	\amp.kr(0.7).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 13
PHOENIX chose Tactic 3
Score 19 : 12
Synth('temp__90' : 1090)
Turn 14
ALBATROSS chose Tactic 4
Score 19 : 15
-> Synth('temp__91' : 1091)
Remote evaluation: /* (~tactic.(1, {
	var pch;
	pch = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 72);
	// pch = MouseX.kr(36, 72);	// test

	a = (0..4)*5.5 + pch;
	a = Mix(SinOsc.ar(a.midicps, 0, 0.15));
	a = Pan2.ar(a, SinOsc.ar(0.5.rand + 0.1));

	\amp.kr(0.9).lag(1) * a
	* (\z3.bin > 0.5).lag(1);
} +> \phoenix ))
 */
Turn 15
PHOENIX chose Tactic 1
Score 20 : 15
Synth('temp__92' : 1092)
Turn 16
ALBATROSS chose Tactic 1
Score 20 : 16
PHOENIX WINS
-> Synth('temp__93' : 1093)
-> albatross
LOADING:  /Users/iani/Library/Application Support/SuperCollider/Extensions/Duel/endRecording.scd
osc groups enabled? true
Recording Stopped: (SC_220910_195633.aiff)
osc groups enabled? true
-> Duel
====== The default server quit ======
Removing buffer entries from lib
server 'localhost' disconnected shared memory interface
'/quit' message sent to server 'localhost'.
Server 'localhost' exited with exit code 0.
SCLang Input: EOF. Will quit.
main: waiting for input thread to join...
main: quitting...
cleaning up OSC

*** SCLang finished ***

