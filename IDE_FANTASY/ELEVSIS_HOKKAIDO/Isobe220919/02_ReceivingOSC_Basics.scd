/* 19 Aug 2022 17:11
Introduction to receiving osc messages.
*/
//:Preliminaries: Posting received osc messages.
// This is useful to check what happens, but will fill your post window!
OSC.trace;
//: To stop posting, execute this:
OSC.untrace;

//:Basics: Execute a function when receiving a message
'/status.reply' >>> { | ... args | "I received the message 'status.reply'".postln;
	postln("the arguments are: " + args)
};
// =============
//:To remove a function bound to a message, try this:
'/status.reply'.removeOSC; // substitute the message that you want to remove instead of '/status.reply'

//:How to take the arguments that you need from an osc message.
// The first argument is a notification - which is usually not needed
// The second argument contains the entire messsage received via OSC
// The best way to get the data sent with the osc message (but get rid
// of the notification and the message name itself) is:
'/status.reply' >>> { | n, msg |
	var data;
	// ignore the notification n and skip the message name from msg.
	data = msg[1..];
	"I received the message 'status.reply'".postln;
	postln("the data are: " + data);
	// now you can pick the data from inside the data array with data[index];
	postln("the first value in data is:" + data [0]);
};


