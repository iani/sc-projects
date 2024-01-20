//Sat 20 Jan 2024 15:11
//playing events with OSC.
//first tries


OscMonitor.gui;
//:
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \s, \bd ])
//:
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \s, \hh, \n, 4])
//:
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \s, 'hh' ])
//:
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \instrument, \default ])
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \instrument, \bd ])
//:
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \s, \bd ])
//:
LocalAddr().sendMsg('/dirt/play', *[\_id_, 1, \cps, 0.5625, \cycle, 175.0, \delta, 0.44444400072098, \orbit, 0, \s, \default, \n, 50 ])
