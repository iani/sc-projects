/* 16 Feb 2022 16:33

*/


//:
// This is the port where OscGroupServer sends messages to all clients.
// It must be open in order for SuperCollider to receive data from OscGroups:
thisProcess.openUDPPort(22245);
//:
OSC.addNotifier('/groupclinet/ping', { | ... args |
	postf("received from OscGroups: %\n", args);
})