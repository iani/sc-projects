Project.gui;

(
{
	10 do: {
		1000.rand.postln;
		1.wait;
	}
}.fork;
)

OSC.trace;

OSC.untrace;