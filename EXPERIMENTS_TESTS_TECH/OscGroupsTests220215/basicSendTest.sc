{
	var netAddress;
	netAddress = NetAddr("127.0.0.1", 22244);
	inf do: { | i |
		postf("sending: % to %\n", i, netAddress);
		netAddress.sendMsg(\test, i);
		1.wait;
	};
}.fork;
