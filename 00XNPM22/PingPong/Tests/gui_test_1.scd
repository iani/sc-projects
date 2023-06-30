Proj.gui0;
//:Initialize synths in silence
// { SinOsc.ar(400, 0, 0.1) * \amp.br(0) } +> \ping;
// { [0, SinOsc.ar(600, 0, 0.1) * \amp.br(0)] } +> \pong;
//:Test playing pong
0.1 @>.pong \amp;
//:Test playing ping
0.1 @>.ping \amp;
//:Watch pingpong variable
{ \pingpong.sr.gt(0) * 0.1 } @>.ping \amp;
{ (1 - \pingpong.sr.gt(0)) * 0.1 } @>.pong \amp;
//:
