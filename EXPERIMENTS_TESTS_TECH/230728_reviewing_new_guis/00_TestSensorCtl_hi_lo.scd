/* 28 Jul 2023 23:27

*/
//:create a SensorCtl on freq
a = SensorCtl(\player, \test);
//:play a sound listening to freq
{ SinOsc.ar(\lo.br(4).linlin(0.1, 10, 400, 6000), 0, 0.1).dup } +>. \test;
//:change freq through mediator
\player.envir.set(\test, \lo, 600);
//:change freq through sensorctl
a.lo_(500);
//:
\tokyo.envir.at(\rate);
//:
\tokyo.envir.at(\rate).set(\lo, 6);
//:
\z1.sensorbus.set(0.00);
\tokyo.envir.at(\rate).set(\lo, 1);