/* 10 Nov 2022 19:29
Developing a scope for control busses, that can be switched
to any named bus in the system.

This is control rate signal scope, modified from the docs examples.

It can be played with the script play button on the SnippetBrowser.

*/
//:[0.1] Starting with the example from the docs
// execute the following two blocks in succession:
​
(
f = Buffer.alloc(s,1024,2);
b = Bus.control(s,1);
​
w = Window.new.front;
w.onClose = { // free everything when finished
    c.stop; a.free; d.free; f.free; b.free;
    "SynthDefs, busses and buffers have all been freed.".postln;
};
c = ScopeView(w.view,w.view.bounds.insetAll(10,10,10,10));
c.bufnum = f.bufnum;
c.server = s; // Important: one must assign the ScopeView to a server
)
//:[5] // play a sound
​

// listening to the bus, using ScopeOut2 to write it to the buffer
a = SynthDef("monoscope", { arg bus, bufnum;
    var z;
    z = K2A.ar(In.kr(bus, 2));
    ScopeOut2.ar(z, bufnum);
    Out.ar(0, Silent.ar);
}).play(
    target: RootNode(s),
    args: [\bus, b.index, \bufnum, f.bufnum],
    addAction: \addToTail // make sure it goes after what you are scoping
);
//:
// making noise onto the buffer
d = SynthDef("noise", { arg bus;
    var z;
    z = LFSaw.kr(SinOsc.kr(0.1).range(0.1,10),[0,1]*pi) * 0.1;
    Out.kr(bus, z);
}).play(
    s,
    [\bus,b.index]
);
c.start; // Tell the ScopeView to start
CmdPeriod.doOnce({w.close});

​
//:​[3]
c.style = 1; // overlapped
//:[3]
c.style = 2; // x/y
//:[10000000] watch a long time before looping back to the beginning
c.style = 0; // vertically spaced
//: