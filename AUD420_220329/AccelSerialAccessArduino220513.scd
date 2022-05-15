SerialPort.devices;
//:
SerialPort.devices do: _.postln;
//:

//:

~port = SerialPort.new("/dev/cu.usbmodem1101", 9600);
//:

~port.read;
30.do {~port.read.postln};

//:
{

	inf.do {
		var input;
		input = ~port.read;
		postln("input as char: " + input + "input class is:" + input.class);
	};
}.fork;

//:


// 90.asAscii;
//
// (
// x = [ ];
// 30.do{x = x.add(~port.read)};
// )
//
// x.collect(_.asAscii);
//
// (
// x = [ ];
// 100.do{x = x.add(~port.read)};
// x.collect(_.asAscii);
// )
//
// (
// ~charArray = [ ];
// ~getValues = Routine.new({
// 	var ascii;
// 	{
// 		ascii = ~port.read.asAscii;
// 		if(ascii.isDecDigit, {~charArray = ~charArray.add(ascii)});
// 	}.loop;
// }).play;
// )


~port.close;

(
~charArray = [ ];
~getValues = Routine.new({
	var lol;
	{
		lol = (3.do{~port.read});
		if(lol.isDecDigit, {~charArray = ~charArray.add(lol)});
		if(lol == $d, {
			~val = ~charArray.collect(_.digit);
			~charArray = [ ];
		});
	}.loop;
}).play;
)



s.boot;





(
SynthDef.new(\saw, {
	arg cutoff=1000;
	var sig;
	sig = Saw.ar([50,51]);
	sig = RLPF.ar(sig, cutoff.lag(0.02), 0.25, 0.2);
	Out.ar(0, sig);
}).add;
)

~synth = Synth(\saw, [\cutoff, 200]);
~synth.set(\cutoff,  400);
~synth.free;

(
~control = Routine.new({
	{
		~synth.set(\cutoff, ~valA);
	}.loop;
}).play;
)