/* 16 Feb 2022 20:26

*/
\test1 >>>.test1 { "this is action test1 for message test1".postln; };
\test1 >>>.test2 { "this is action test2 for message test1".postln; };
\test1 >>>.test3 { "this is action test3 for message test1".postln; };
\test5 >>>.test7 { "this is action test7 for message test5".postln; };
//:
OSC.list;
//:
OSC.changed('/test1')
//:
OSC.verbose;
OSC.sendLocal(\test1);
//:
OSC.remove(\test1, \test1);
//:
OSC.sendLocal(\test1);