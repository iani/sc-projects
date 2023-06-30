/* 22 Jun 2022 19:51

*/
//:
OSC.trace;
OSC.untrace;
//: '/HR_data'
'/HR_data' >>>.test { | n, args |
	// postln("testing" + args);
	postln("data size is:" + args[1..].size;)
}
//: '/HR_data'
'/HR_data' >>>.test { | n, args |
	// postln("testing" + args);
	postln("data 0, 1, 2" + args[1..3];)
}
//: '/HR_data'
'/HR_data' >>>.test { | n, args |
	// postln("testing" + args);
	postln("data 256" + args[256];)
}
//: '/HR_data'
'/HR_data' >>>.test { | n, args |
	// postln("testing" + args);
	postln("data 255" + args[255];)
}
//: '/HR_data'
'/HR_data' >>>.test { | n, args |
	// postln("testing" + args);
	postln("data 255, 256" + args[255..256];)
}
//: '/HR_data'
'/HR_index' >>>.test { | n, args |
	// postln("testing" + args);
	postln("data is:" + args[1];)
}
//:
'/HR_data' <<< \test;
'/HR_index' <<< \test;
