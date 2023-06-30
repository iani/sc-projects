compiling class library...
	Found 855 primitives.
	Compiling directory '/Applications/SuperCollider/SuperCollider.app/Contents/Resources/SCClassLibrary'
	Compiling directory '/Users/iani/Library/Application Support/SuperCollider/Extensions'
	numentries = 1525534 / 22990656 = 0.066
	6344 method selectors, 3624 classes
	method table size 24583928 bytes, big table size 183925248
	Number of Symbols 16206
	Byte Code Size 471121
	compiled 714 files in 0.27 seconds

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
Emacs: Index help topics in 0.637 seconds
Emacs: Built symbol table in 0.0185 seconds
-> Project
Selecting project: nil
Selecting project: AUD420_220329
osc groups enabled? false
polled oscgroups status now
Selecting project: Ftarri220910
Loading selected item: PathName(/Users/iani/sc-projects/Ftarri220910/00_OSC_setup_and_server_boot.scd)
loading project item: PathName(/Users/iani/sc-projects/Ftarri220910/00_OSC_setup_and_server_boot.scd)
OscGroups set OSC send port to: 22244
osc groups enabled? false
osc groups enabled? true
OscGroups enabled
osc groups enabled? true
enabled osc groups
Enabled forwarding sense data to osc groups
Sensors 1-8 write to buses 0-23
server 'localhost' unresponsive, rebooting ...
'/quit' message sent to server 'localhost'.
Booting server 'localhost' on address 127.0.0.1:57110.
Found 0 LADSPA plugins
Number of Devices: 5
   0 : "27N4Q"
   1 : "BlackHole 2ch"
   2 : "MacBook Air Microphone"
   3 : "MacBook Air Speakers"
   4 : "ZoomAudioD"

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
loading local buffers from: PathName(/Users/iani/sc-projects/Ftarri220910/audiofiles)
Looking for files in /Users/iani/sc-projects/Ftarri220910/audiofiles ...
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
Looking for files in /Users/iani/sc-projects/Ftarri220910/synthdefs ...
... found: [  ]
osc groups enabled? true
localhost finished loading synthdefs
loading setup folder
osc groups enabled? true
osc groups enabled? true
Looking for files in /Users/iani/sc-projects/Ftarri220910/setup ...
... found: [  ]
osc groups enabled? true
Loading selected item: PathName(/Users/iani/sc-projects/Ftarri220910/01_TI_ControlBusMonitor.scd)
loading project item: PathName(/Users/iani/sc-projects/Ftarri220910/01_TI_ControlBusMonitor.scd)
Loading selected item: PathName(/Users/iani/sc-projects/Ftarri220910/01_TI_ControlBusMonitor.scd)
loading project item: PathName(/Users/iani/sc-projects/Ftarri220910/01_TI_ControlBusMonitor.scd)
Loading selected item: PathName(/Users/iani/sc-projects/Ftarri220910/01_TI_ControlBusMonitor.scd)
loading project item: PathName(/Users/iani/sc-projects/Ftarri220910/01_TI_ControlBusMonitor.scd)
-> Synth('temp__3' : 1003)
-> Synth('temp__4' : 1004)
-> Synth('temp__5' : 1005)
-> Synth('temp__6' : 1006)
-> Synth('temp__7' : 1007)
Remote evaluation: /* ~tasosL = \x3.bamp(0.1, 0.5);
 */
an Amplitude
-> Synth('temp__8' : 1008)
Remote evaluation: /* \phoeSampHold.stop(5);
 */
phoeSampHold
-> Synth('temp__9' : 1009)
Remote evaluation: /* ~tactic.(0, {{ ~tasosL.linlin(0.46, 0.56, 1, 20); Pan2.ar(Dust.ar(x), -0.7) } +> \phoenix });
 */
nil
Remote evaluation: /* { ~tasosL.linlin(0.46, 0.56, 1, 20); Pan2.ar(Dust.ar(x), -0.7) } +> \phoenix
 */
Dust arg: 'density' has bad input: nil
 ARGS:
   density: nil Nil
SynthDef temp__10 build failed
ERROR: Dust arg: 'density' has bad input: nil

PROTECTED CALL STACK:
	SynthDef:checkInputs	0x7faf29add780
		arg this = a SynthDef
		var firstErr = Dust arg: 'density' has bad input: nil
	SynthDef:finishBuild	0x7faf29ad7580
		arg this = a SynthDef
	a FunctionDef	0x7faf29abb300
		sourceCode = "<an open Function>"
	Function:prTry	0x7faf28893480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = a Function
		var wasInProtectedFunc = true
	Function:protect	0x7faf28892a00
		arg this = a Function
		arg handler = a Function
		var result = nil
	SynthDef:build	0x7faf29abaf40
		arg this = a SynthDef
		arg ugenGraphFunc = a Function
		arg rates = nil
		arg prependArgs = nil
	Function:play	0x7faf29c13d00
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
	a FunctionDef	0x7faf29c9b640
		sourceCode = "<an open Function>"
	a FunctionDef	0x7faf28607780
		sourceCode = "<an open Function>"
	Function:prTry	0x7faf28893480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = a Function
		var wasInProtectedFunc = true
	Function:protect	0x7faf28892a00
		arg this = a Function
		arg handler = a Function
		var result = nil
	EnvironmentRedirect:use	0x7faf28607300
		arg this = <default>:[ (albatross -> Synth('temp__9' : 1009)), (cbmon -> Synth('temp__2' : 1002)), (tasosL -> an Amplitude) ]
		arg function = a Function
		var result = nil
		var saveEnvir = <default>:[ (albatross -> Synth('temp__9' : 1009)), (cbmon -> Synth('temp__2' : 1002)), (tasosL -> an Amplitude) ]
	Function:playInEnvir	0x7faf29c9b1c0
		arg this = a Function
		arg player = phoenix
		arg envir = nil
		var synth = nil
	a FunctionDef	0x7faf29ccdd40
		sourceCode = "<an open Function>"
	a FunctionDef	0x7faf28890080
		sourceCode = "<an open Function>"
	a FunctionDef	0x7faf29a58a40
		sourceCode = "<an open Function>"
	Function:prTry	0x7faf28893480
		arg this = a Function
		var result = nil
		var thread = a Thread
		var next = nil
		var wasInProtectedFunc = false

CALL STACK:
	Exception:reportError
		arg this = <instance of Error>
	< closed FunctionDef >
		arg error = <instance of Error>
	Integer:forBy
		arg this = 0
		arg endval = 0
		arg stepval = 2
		arg function = <instance of Function>
		var i = 0
		var j = 0
	SequenceableCollection:pairsDo
		arg this = [*2]
		arg function = <instance of Function>
	Scheduler:seconds_
		arg this = <instance of Scheduler>
		arg newSeconds = 554.879965208
	Meta_AppClock:tick
		arg this = <instance of Meta_AppClock>
		var saveClock = <instance of Meta_SystemClock>
	Process:tick
		arg this = <instance of Main>
^^ The preceding error dump is for ERROR: Dust arg: 'density' has bad input: nil
Remote evaluation: /* { \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20); Pan2.ar(Dust.ar(x), -0.7) } +> \phoenix }
 */
ERROR: Parse error
  in interpreted text
  line 1 char 89:

  { \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20); Pan2.ar(Dust.ar(x), -0.7) } +> \phoenix }
                                                                                          ^
-----------------------------------
unmatched '}'
  in interpreted text line 1 char 89
ERROR: syntax error, unexpected BADTOKEN, expecting $end
  in interpreted text
  line 1 char 89:

  { \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20); Pan2.ar(Dust.ar(x), -0.7) } +> \phoenix }
                                                                                          ^
-----------------------------------
ERROR: Command line parse failed
nil
Remote evaluation: /* Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20)), -0.7) } +> \phoenix
 */
ERROR: Parse error
  in interpreted text
  line 1 char 70:

  Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20)), -0.7) } +> \phoenix
                                                                       ^
-----------------------------------
unmatched '}'
  in interpreted text line 1 char 70
ERROR: syntax error, unexpected BADTOKEN, expecting $end
  in interpreted text
  line 1 char 70:

  Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20)), -0.7) } +> \phoenix
                                                                       ^
-----------------------------------
ERROR: Command line parse failed
nil
-> Synth('temp__11' : 1010)
Remote evaluation: /* { Dust.ar(1) } +> \phoenix
 */
Synth('temp__12' : 1011)
Remote evaluation: /* { Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 20)) } +> \phoenix
 */
Synth('temp__13' : 1012)
-> Synth('temp__14' : 1013)
-> Synth('temp__15' : 1014)
Remote evaluation: /* { Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 100)) } +> \phoenix
 */
Synth('temp__16' : 1015)
Remote evaluation: /* { Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10)) } +> \phoenix
 */
Synth('temp__17' : 1016)
-> Synth('temp__18' : 1017)
Remote evaluation: /* { Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10)), WhiteNoise.ar) } +> \phoenix
 */
Synth('temp__19' : 1018)
Remote evaluation: /* { Pan2.ar(Dust.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 50)), WhiteNoise.ar) } +> \phoenix
 */
Synth('temp__20' : 1019)
-> Synth('temp__21' : 1020)
-> Synth('temp__22' : 1021)
Remote evaluation: /* \phoenix.stop(5);
 */
phoenix
Remote evaluation: /* (
{
	a = PinkNoise.ar(0.1);
	a = SinOsc.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10)) * a;
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__23' : 1022)
Remote evaluation: /* (
{
	a = PinkNoise.ar(0.1);
	a = SinOsc.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 1, 10)) * a;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__24' : 1023)
-> Synth('temp__25' : 1024)
-> Synth('temp__26' : 1025)
-> Synth('temp__27' : 1026)
-> Synth('temp__28' : 1027)
Remote evaluation: /* (
{
	a = SinOsc.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps, 0, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__29' : 1028)
-> Synth('temp__30' : 1029)
-> Synth('temp__31' : 1030)
-> Synth('temp__32' : 1031)
-> Synth('temp__33' : 1032)
Remote evaluation: /* (
{
	a = LFPulse.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps)/20;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a = CombN.ar(a, 0.1, 1/250, 0.1);
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__34' : 1033)
-> Synth('temp__35' : 1034)
Remote evaluation: /* (
{
	a = LFPulse.ar(\x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 48).midicps)/20;
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a = CombN.ar(a, 0.1, 1/250, 0.5);
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__36' : 1035)
-> Synth('temp__37' : 1036)
-> Synth('temp__38' : 1037)
Remote evaluation: /* (
{
	a = PinkNoise.ar;
	a = BPF.ar(a, \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps, 0.5);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__39' : 1038)
Remote evaluation: /* (
{
	a = PinkNoise.ar;
	a = BPF.ar(a, \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps, 0.2);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__40' : 1039)
Remote evaluation: /* (
{
	a = PinkNoise.ar;
	a = BPF.ar(a, \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps, 0.1);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__41' : 1040)
-> Synth('temp__42' : 1041)
-> Synth('temp__43' : 1042)
-> Synth('temp__44' : 1043)
-> Synth('temp__45' : 1044)
-> Synth('temp__46' : 1045)
Remote evaluation: /* (
{
	a = Dust.ar;
	b = \x3.bamp(0.1, 0.5).linlin(0.46, 0.56, 36, 96).midicps;
	b = LFNoise0.ar(100, 100, b);
	a = CombN.ar(a, 0.1, 1/b, 0.5);
	a = Pan2.ar(a, SinOsc.ar(0.2));
	a * (\z3.bin > 0.5).lag(1);
} +> \phoenix
)
 */
Synth('temp__47' : 1046)
