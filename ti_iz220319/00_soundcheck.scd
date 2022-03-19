/* 19 Mar 2022 13:44
Do not connect osc groups here.

Test separately to see how to mute sound of remote supercolliders on Zoom.

*/

{ WhiteNoise.ar(0.05).dup } +> \soundcheck;

\default +> \soundcheck;

\aaa +> \soundcheck;



a = Synth(\default);

a.release;

b = Synth(\aaa);

b.release;

b.free;



() +> \soundcheck;