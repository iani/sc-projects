/* 16 Feb 2022 20:26

*/
//:
OscGroups.isEnabled;
//:
\code >>>.code { "testing code".postln; };
//:
OSC.activeMessages;
//:
OSC.listensTo(\test1);
//:
OSC.listensTo(\test5);
//:
OSC.listensTo(\code);
//:
\test5 >>>.test1 { "this is action test1 for message test5".postln; };
//:
OSC.listensTo(\test5, \test1);
//:
OSC.listensTo(\test7);
//:
OSC.listensTo(\testxxxx);
//:
\test1 >>>.test1 { "this is action test1 for message test1".postln; };
\test1 >>>.test2 { "this is action test2 for message test1".postln; };
\test1 >>>.test3 { "this is action test3 for message test1".postln; };
\test5 >>>.test7 { "this is action test7 for message test5".postln; };
\test5 >>>.test5 { "this is action test5 for message test5".postln; };
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

OscGroups.enable;
//:
thisProcess.openUDPPort(22245);
//:
OSC.silent;
//:
'status.reply' >>> { "status reply from server".postln; }
//:
'groupclient/ping' >>> { "group client tttttttttttttt ping received 15".postln; }
//:
'status.reply'.removeOSC;
//:
//:
'groupclient/ping'.removeOSC;

OSC.clear;
//:
OSC.activeMessages;
//:
OSC.listensTo(\code);
//:
OSC.dependants.asArray.select({ | n | n isKindOf: NotificationController })
.do{|nc| nc.actions.includesKey('/test1').postln; }
//:
includesKey

//:
Notification.messagesOf(OSC)
//:
Notification.controllers[OSC];

listenersOf(OSC)
 bb//:
Notification.controllers;
Notification.notifications .do({|n| postf("notifier: %, listener: %, message: %\n",
	n.notifier, n.listener, n.message
)});
//:

Notification.matches(OSC, 'test1', '/test1');
Notification.matches(OSC, 'test7', '/test5');

.collect({|nc| nc.actions.postln;})
.select({ |d| d.keys includes: \status });
//:
OscGroups.enable;