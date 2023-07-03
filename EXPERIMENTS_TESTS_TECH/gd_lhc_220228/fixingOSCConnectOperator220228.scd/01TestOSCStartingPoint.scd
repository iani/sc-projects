/* 28 Feb 2022 11:31

*/

//:
OSC.add('status.reply', { | ... args | args.postln; });
OSC.remove('status.reply');
//:
'status.reply' >>> { "just testing".postln; };

//:both of the below remove the action added above:
'status.reply' <<< 'status.reply';

'status.reply'.removeOsc;

OSC.list;
//:
[] +>> \test;
{
// \test.trace;
OSC.add
// OSC.verbose;
5.wait;
\test.stop;
// 3.wait;
// \test.untrace;
OSC.silent;
}.fork;