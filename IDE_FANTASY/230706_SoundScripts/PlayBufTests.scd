/*  6 Jul 2023 23:49
Testing use of EditSoundPlayer
*/
//:First test
EditSoundPlayer().play; // default: entire buffer
//:Test defaults
// EditSoundPlayer().playfunc.postln;
EditSoundPlayer().event;
EditSoundPlayer().mediator;
//:adjust rate
EditSoundPlayer().play((rate: 0.5, vol: 1));
//:adjust rate again
EditSoundPlayer().play((rate: 0.05, vol: 10));
//:change buffer - keep other unchangee
EditSoundPlayer().play((buf: \pilgrims));
//:reset to default
EditSoundPlayer().clear.play;
//:move the rate around
EditSoundPlayer().play((rate: 0.05, dur: 1000));
{ LFNoise2.kr(0.1).range(0.25, 0.94) } @>.s \rate;
//:very slow pilgrims
EditSoundPlayer().play((buf: \pilgrims, rate: 0.025, vol: 10));
//:var rate slow pilgrims
EditSoundPlayer().play((buf: \pilgrims, rate: 0.025, vol: 10)).play;
{ LFNoise1.kr(0.2).range(0.03, 0.1) } @>.s \rate;
//:rounded var rate slow pilgrims
EditSoundPlayer()..play.((buf: \pilgrims, rate: 0.025, vol: 10));
{ LFNoise1.kr(0.2).range(0.03, 0.1).round(0.01) } @>.s \rate;
//:pilgrims
EditSoundPlayer().play((buf: \pilgrims, rate: 0.5))
//:** play in \x
\pilgrims **.x ();
//:** play in \s (default)
\pilgrims ** (rate: 0.05, vol: 10, dur: 1000);
//:** playbuf shortcut
\pilgrims ** (rate: 0.1, vol: 2, dur: 1000);
//:restart with previous settings
EditSoundPlayer().play; // plays with previous settings
//:clear and restart
EditSoundPlayer().cplay;
//:clear and stop currentEnvironment
currentEnvironment.clear;
//:stop all synths in current environment
currentEnvironment.stopSynths;
//:free buffers of current environment
currentEnvironment.fb;