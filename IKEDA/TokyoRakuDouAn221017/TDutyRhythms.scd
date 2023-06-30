/* 18 Oct 2022 14:40
Compare Using TDuty with
using Impulse multiplied with a Tseq
*/

//:
{ WhiteNoise.ar(Decay.kr(\tduty.bin)).dup * 0.1 } +> \test;
{ TDuty.kr(Dseq([5, 0.31, 0.31] / 3, inf)) } @> \tduty;
//:
{ WhiteNoise.ar(Decay.kr(\tduty.bin)).dup * 0.1 } +> \test;
{ 
	var trig;
	trig = Impulse.kr(3);
	trig * Demand.kr(trig, 0, Dseq([1, 1, 0, 1, 1, 1, 0], inf))
} @> \tduty;
//:

//: Next calculate the durations from an array of beats in
// this form:
a = [1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1]; // etc;
//:
f = { | beats |
	var accum = 1;
	var result;
	(beats rotate: -1) do: { | i |
		if (i == 0) {
			accum = accum + 1
		} {
			result = result add: accum;
			accum = 1;
		};
	};
	result;
};
//:
f.([1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1]);
f.([1, 1]);
f.([1, 0]);
f.([1, 0, 1]);
f.([1, 0, 1, 1]);
f.([1, 1, 0, 1, 1]);
f.([1, 1, 0, 1, 0]);
f.([1, 1, 0, 1, 0, 0, 1, 0, 1, 1]);
f.([1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0]);
f.([0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1]);
f.([0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1]);

//:
a rotate: 1;
//
(a add: 1) do: { | i | f.(i).postln };
//:

b = (1 - a).differentiate;
(1..(a.size)) * a;
a do: { | x |
	if (x == 1) {
		b = b +
	}{

	}
}

1 - a;