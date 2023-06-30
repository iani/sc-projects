Sensors.enable;
// InputXyz.enable(30);
InputXyz.addMessage('/gyro');
MapFunc('/ZIGSIM/hh1_zig/gyro', { | msg |
	var x, y, z, message;
	#x, y, z = msg[1..];
	// [x, y, z].postln;
	x = x.linlin(-11.0, 11.0, 0.0, 1.0);
	y = y.linlin(-12.0, 15.0, 0.0, 1.0);
	z = z.linlin(-9.0, 8.0, 0.0, 1.0);
	// [x, y, z].postln;
	message = ['/gyro', 20, x, y, z];
	OscGroups.send(message);
	LocalAddr().sendMsg(*message);
});
MapFunc('/ZIGSIM//zigsim/iz/gyro', { | msg |
	var x, y, z, message;
	#x, y, z = msg[1..];
	// [x, y, z].postln;
	x = x.linlin(-11.0, 11.0, 0.0, 1.0);
	y = y.linlin(-12.0, 15.0, 0.0, 1.0);
	z = z.linlin(-9.0, 8.0, 0.0, 1.0);
	// [x, y, z].postln;
	message = ['/gyro', 21, x, y, z];
	OscGroups.send(message);
	LocalAddr().sendMsg(*message);
});
InputXyz.gui;