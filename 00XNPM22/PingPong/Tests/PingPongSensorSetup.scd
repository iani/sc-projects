/* 19 Nov 2022 22:37
Setup for iPhone Sensors for piece by Hidehiro Fujiwara.
Ping Pong.

Messages to program:

 /ZIGSIM/hh1_zig/gyro,
/ZIGSIM/hh1_zig/gravity,
/ZIGSIM/hh1_zig/quaternion,
/status.reply,
	/ZIGSIM/hh1_zig/accel ]

Prototype code from Class:

MapXyz {

	*new { | inputMessage, forwardMessage, lo = 0, hi = 1 |
		inputMessage.asOscMessage >>>.mapxyz { | n, msg |
			var xyz, message;
			xyz = msg[2..].linlin(lo, hi, 0.0, 1.0);
			message = [forwardMessage, msg[1]] ++ xyz;
			OscGroups.send(message);
			LocalAddr().sendMsg(*message);
		}
	}
}

MapFunc {

	*new { | inputMessage, func |
		inputMessage.asOscMessage >>>.mapxyz { | n, msg |
			var message;
			message = func.(msg);
			OscGroups.send(message);
			LocalAddr().sendMsg(*message);
		}
	}
}

	x range:
-> 10.815824508667
-> -10.989544868469
	y range
	-> 14.639225006104
-> -11.932550430298
	z range:
-> 7.3298110961914
-> -8.7048559188843
-> Project
*/
//:
//:
InputXyz.enable(30);
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
InputXyz.gui;

/*
//:
InputXyz.enable(30);
//:
MapFunc('/ZIGSIM/hh1_zig/gyro', { | n, msg |
	//n.msg.postln;
})
//:
*/
//:

//: