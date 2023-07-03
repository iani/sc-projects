/*  1 Nov 2022 12:45
Testing input from sensors.
Simulating messages sent by sensestage, pinetime.
*/
//:normalize and forward pinetime data to pine
MapXyz('/pinetime/data', '/pine', -1200, 1200);
//:send some simulation data
{ ['/pinetime/data', 1, Array.rand(3, -1200, 1200)].flat.sim; 0.1 } **> \test;
//:watch incoming messages translated by MapXyz
\pine.watch;
//: alternative simulation data with smoother curve profiles
(dur: 0.05, msg: '/pinetime/data', id: 1, x: Pbrown(-200.0, 200, 50.0),
y: Pbrown(-200.0, 200, 50.0), z: Pbrown(-200.0, 200, 50.0)).osc(\id, \x, \y, \z) +> \test;
//:send some more simulation data
{ ['/pinetime/data', 3, Array.rand(3, -1000, 1000)].flat.sim; 0.1 } **> \test2;
//:Monitor received pine data. Enable input from 12 sensors
InputXyz enable: 12;
//:add message maybe needs to run AFTER!!!!
InputXyz.addMessage('/pine').gui;
//:stop simulation data
\test.stop;
\test2.stop;
//:start a sound to test control from data
{ SinOsc.ar(\freq.br(400), 0, \amp.br(0.01)).dup } +> \soundtest;
//:scale and map x8 to frequency
{ \x8.br(0).exp(150, 1600).lag(0.5) } @> \freq;
//:compare with linear mapping
{ \x1.br(0).lin(150, 1600) } @> \freq;
//: use z to cut or let sound through
{ \z1.br(0).gt(0.5).lag(1) * 0.01 } @> \amp;
//:Change scale
{ \x1.br(0).lin(300, 600) } @> \freq;
//:
\x1 @> \freq ++> \soundtest;
//:Open scope
Server.default.scope(rate:\control, numChannels: 12);
//:
