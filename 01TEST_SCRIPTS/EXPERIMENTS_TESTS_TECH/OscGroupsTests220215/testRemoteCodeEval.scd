/* 16 Feb 2022 14:53

*/
//:

OSC.add(receiver, this, { | notification, message |
	// postf("received this over osc: %\n", message);
	// postf("I'll be forwarding it to: %\n", address);
	thisProcess.interpreter.interpret(message[index]);
});