//:
Pings addSound: {
	(dur: 0.05 rrand: 0.12, degree: 10.rand + (0..4).pseq(1)) +> \pongtest2;
}
//:
Pings addSound: {
	(dur: 0.05 rrand: 0.12, degree: 10.rand + (0..4).pseq(1)) +> \pongtest2;
}
//:
Pings addSound: {
	(dur: [0.05, 0.25].prand, degree: 10.rand + (0..-14).pseq(5)) +> \pongtest2;
}
//:
Pings addSound: {
	(dur: 0.05 rrand: 0.12, degree: 10.rand + (0..-4).prand(40)) +> \pongtest2;
}
//:
Pings addSound: {
	(dur: [0.05, 0.12].prand, degree: 10.rand + (-10..4).prand(40)) +> \pongtest2;
}
//: