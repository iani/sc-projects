/*  5 Dec 2022 21:40
Connecting players in the desired order and with the right busses.
*/
//:
Groups.plot;
[\src, \fx, \record, \playback, \fx2].groups;
{ Dust.ar(10).fader(0.05).out(\fxbus) } +>@.src \src; // stores the group in the environment
{ Ringz.ar(\fxbus.in, LFNoise1.kr(0.5).range(200, 1000), 0.01).fader(1.1) } +>@.fx \fx;
//:Next time the player will use the group stored in the environment
{ Ringz.ar(\fxbus.in, LFNoise1.kr(5.5).range(1200, 2000), 0.1).fader(1.1) } +> \fx;


//:For very special cases (!?!):
//:Specify another group. Bypass the environment's target. Do not replace it.
// Here adding this at the top of the default group: The effect gets no input. Silence.
{ Ringz.ar(\fxbus.in, LFNoise1.kr(5.5).range(200, 400), 0.1).fader(1.1) } +><@>.default_group \fx;
//:
\crickets.pb;
//:
\src.stop;
//:
{ Ringz.ar(\fxbus.in, LFNoise1.kr(0.5).range(200, 1000), 0.01).fader(0.1) } +>@.fx \fx;
\crickets.pb(nil, \fxbus.ab);
//:
\crickets.pb(\src, \fxbus, \src);
//:
\crickets.pb(nil, 0);
//:
//;
//:
{ Ringz.ar(\fxbus.in, LFNoise1.kr(0.5).range(200, 1000), 0.05).fader(0.1) } +>@.fx \fx2;
//:Store group + bus in environment.
//The group and / or bus is permanently stored and reused.
//To change them, one must remove them from the environment or overwrite them,
//or specify the group with the above operator +>@ which bypasses the environment's group
//
//:Use named groups in patterns:
[\top, \bottom].groups;
(group: \bottom) +> \test; // Functions use "target". Events use "group".

a = ().play;
