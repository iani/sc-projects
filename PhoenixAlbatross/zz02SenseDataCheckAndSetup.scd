OSC.verbose;
OSC.silent;
SenseData().verbose;
SenseData().silent;

//: activate all 4 sensor sets
SenseData().setxyz(1, 2, 3, 4);
/*
They will write to busses like this:
For sensor 1:  \x1, \y1, \z1
For sensor 2:  \x2, \y2, \z2
etc.

To read the current value of the sensors from these busses, write:

	\x1.bin // Input from a kr bus stored in \x1
	// etc.
	for example, to use \x1 bus as value of freq with mapping, write:
	SinOsc.ar(\x1.bin.linlin(0.46, 0.56, 100, 5000))
*/

/* TODO:
Store the 0.46 and 0.56 in_lo and in_hi values in library.
Then, define a shortcut method that reads these values from the library,
and returns a linlin with the expected in_lo and in_hi values.

\x1.bin.senselin(100, 5000); // in_lo, in_hi provided by Library

*/

//:
SenseData.scope;
