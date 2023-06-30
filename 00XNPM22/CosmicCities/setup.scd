

//From PD (Italy) to Iannix (Athens)
/*
/iannix/setcolormultiply
/iannix/setActive
/iannix/stop
/iannix/zoom
/iannix/zoom
/iannix/setSpeedF
/iannix/play
/iannix/fastrewind

/iannix/center
/iannix/rotate
*/
// Control from PD to IanniX (remote!)
//: Forward from PD (via OscGroups), to IanniX

// OscGroups.enable(22243, 22245);

OscGroups.enable;

OscGroups.disableCodeForwarding;
//:
OSC.forward('/iannix/setcolormultiply', 1234);
OSC.forward('/iannix/setActive', 1234);
OSC.forward('/iannix/stop', 1234);
OSC.forward('/iannix/zoom', 1234);
OSC.forward('/iannix/setSpeedF', 1234);
OSC.forward('/iannix/play', 1234);
OSC.forward('/iannix/fastrewind', 1234);
OSC.forward('/iannix/center', 1234);
OSC.forward('/iannix/rotate', 1234);
//:
OscGroups.forward('/iannix/setcolormultiply');
OscGroups.forward('/iannix/setActive');
OscGroups.forward('/iannix/stop');
OscGroups.forward('/iannix/zoom');
OscGroups.forward('/iannix/setSpeedF');
OscGroups.forward('/iannix/play');
OscGroups.forward('/iannix/fastrewind');
OscGroups.forward('/iannix/center');
OscGroups.forward('/iannix/rotate');
//:
//: Control from IanniX to PD and max for sound:
//From IanniX (Athens) to PD (Italy)
OscGroups.forward('/trigger');
OscGroups.forward('/cursor');
//:
//:

"test"

OSC.trace;

OscGroups.send(\test)