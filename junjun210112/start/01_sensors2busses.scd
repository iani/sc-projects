/* 12 Jan 2022 14:49
Create busses and set their values to the data received from sensors.
*/
//: Setup busses and oscfunc
var allbusnames, allbusses;
allbusnames = ["jun", "asayo"].collect({ | name |
	["L", "R"].collect({ | lr |
		[ "x", "y", "z"].collect({ | xyz |
			format("%%%", name, lr, xyz).asSymbol;
		})
	})
});
allbusnames.postln;
allbusnames.flat do: { | bname | bname.bus; };

allbusses = allbusnames.flatten(1).collect { | hand | hand.collect({ | xyz | xyz.bus}) };

~allbusnames = allbusnames;
~allbusses = allbusses;

~verbose = false;
OSCFunc(
	{ | msg |
		var useless, nr, x, y, z, buses;
		#useless, nr, x, y, z = msg;
		if (~verbose) {
			postf("sensor input. nr: %, x: %, y: %, z: %\n", nr, x, y, z);
		};
		buses = allbusses[nr - 1];
		// [x, y, z].linlin(0.43, 0.57, 0.0, 1.0) // not for now!
		do: { | val, i |
			buses[i].set(val);
		}
	},
	'/minibee/data'
).fix;
//:
Server.default.scope(12, rate: \control);
