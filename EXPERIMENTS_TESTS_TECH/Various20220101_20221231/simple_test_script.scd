{
10 do: { | i | 
    [i, 1000.rand].postln;
     1.wait;
     };
     "DONE!".postln;
}.fork;