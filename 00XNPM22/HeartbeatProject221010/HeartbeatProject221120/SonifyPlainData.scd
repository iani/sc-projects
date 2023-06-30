/* 23 Oct 2022 22:18

*/

~data = [];

{ SinOsc.ar(\freq.kr(400), 0, 0.1).dup } +> \test;

(freq: 600) ++> \test;

'/HR_data_filt' >>>.data { | n, m | ~data = ~data add: m[1] };

//:
'/HR_data_filt' >>>.data { | n, m |
	//	(freq: m[1].linlin(-10, 10, 400, 1000)) ++> \test;
};
//:
'/HR_data_filt' >>>.data { | n, m |
	//	 (freq: m[1].linlin(-10, 10, 400, 1000), dur: 0.05).play;
};
//:
'/HR_data_filt' >>>.data { | n, m |
	//	(freq: m[1].linlin(-10, 10, 400, 1000)) ++> \test;
};

//:
//
~data.size;

~data.plot;


~data.writeArchive(PathName("~/hr_data.txt").fullPath);
