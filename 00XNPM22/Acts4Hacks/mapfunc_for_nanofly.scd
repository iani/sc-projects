//code
/* 25 Nov 2022 21:17
Prototype for handling data from nanofly.
*/

//:--[1] //this is a comment
MapFunc('/nanofly/data', { | msg |
	var id, x, y, z, message;
	#id, x, y, z = msg[1..].collect({|s| s.asString.interpret});
	// [x, y, z].postln;
	x = x.linlin(0.0, 255.0, 0.0, 1.0);
	y = y.linlin(0.0, 255.0, 0.0, 1.0);
	z = z.linlin(0.0, 255.0, 0.0, 1.0);
	// [x, y, z].postln;
	//	[id, id.class].postln;
	message = ['/fly', id, x, y, z];
	OscGroups.send(message);
	LocalAddr().sendMsg(*message);
});
//:--[0.1]
OSC.forward('/nanofly/data', NetAddr("127.0.0.1", 1000), \of);
OSC.forward('/nanofly/data', NetAddr("127.0.0.1", 1234), \pd);
//:--[0.5]
"Testing".postln;
//:--[1]
InputXyz.addMessage('/fly');
InputXyz.enable(12);
InputXyz.gui;
//:--[1] //this is a comment
MapFunc('/nanofly/data', { | msg |
	var id, x, y, z, message;
	#id, x, y, z = msg[1..].collect({|s| s.asString.interpret});
	// [x, y, z].postln;
	x = x.linlin(0.0, 255.0, 0.0, 1.0);
	y = y.linlin(0.0, 255.0, 0.0, 1.0);
	z = z.linlin(0.0, 255.0, 0.0, 1.0);
	// [x, y, z].postln;
	//	[id, id.class].postln;
	message = ['/fly', id, x, y, z];
	OscGroups.send(message);
	LocalAddr().sendMsg(*message);
});
//:--[0.1]
OSC.forward('/nanofly/data', NetAddr("127.0.0.1", 1000), \of);
OSC.forward('/nanofly/data', NetAddr("127.0.0.1", 1234), \pd);
//:--[0.5]
"Testing".postln;
//:--[1]
InputXyz.addMessage('/fly');
InputXyz.enable(12);
InputXyz.gui;
//:--[1] //this is a comment
MapFunc('/nanofly/data', { | msg |
	var id, x, y, z, message;
	#id, x, y, z = msg[1..].collect({|s| s.asString.interpret});
	// [x, y, z].postln;
	x = x.linlin(0.0, 255.0, 0.0, 1.0);
	y = y.linlin(0.0, 255.0, 0.0, 1.0);
	z = z.linlin(0.0, 255.0, 0.0, 1.0);
	// [x, y, z].postln;
	//	[id, id.class].postln;
	message = ['/fly', id, x, y, z];
	OscGroups.send(message);
	LocalAddr().sendMsg(*message);
});
//:--[0.1]
OSC.forward('/nanofly/data', NetAddr("127.0.0.1", 1000), \of);
OSC.forward('/nanofly/data', NetAddr("127.0.0.1", 1234), \pd);
//:--[0.5]
"Testing".postln;
//:--[1]
InputXyz.addMessage('/fly');
InputXyz.enable(12);
InputXyz.gui;

Document.current.string;

Document.current.currentString;

OscData.currentDocumentGui;

Document.current.path;