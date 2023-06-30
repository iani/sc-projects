"Connecting OSC from this script".postln;
//:======== SECTION A: configuration commands =========
// Here we should provide osc commands for configuring following 2 things:
//
// 1. tell the system what osc command to expect from the smartphones
// Zigbee can be configured to send a desired osc command, but this
// osc command must be communicated to the listening supercollider server.
// So that supercollider knows what command corresponds to what player (ping or pong).
//
// 2. Adjust the threshold at which the system issues a "ball received" trigger signal.
//: -------------------- SECTION B: experimental setup =======================
//:first experimental setup, made manually and not configurable
// This may be adapted later to become configurable with the commands of section A above.

//: receive from phone 1, trigger at x > 0.8
'/ZIGSIM/ping/gyro' >>>.pingpong { | who, msg |
	if (msg[1] > 9.0) {
		msg[1].postln;
		\pingpongActions !!* \trigPing;
	}
	//	OscGroups.send()
};

//: receive drom phone 2, trigger at x > 0.8
// Please edit the device id on ZIGSIM to read: pong/gyro
//
'/ZIGSIM/pong/gyro' >>>.pingpong { | who, msg |
	if (msg[1] >  9.0) {
		msg[1].postln;
		\pingpongActions !!* \trigPong;
	}
};
//: Forward zigsim input to oscgroups
// DO NOT FORWARD THIS REMOTELY
// ONLY FORWARD THE RESULT OF DETECTING THE BALLNSET
// OscGroups forward: '/ZIGSIM/ping/gyro';
// OscGroups forward: '/ZIGSIM/pong/gyro';
//:------------------------------------------------------------