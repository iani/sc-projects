// OSCGroups setup
// Start OSCGroupsClient on terminal:
/*
OscGroupClient 139.162.184.97 22242 22246 22244 22245 <username> <userpass> checkGroup test
*/
//:Open UDP port for receiving data from OSCGroups:
OscGroups.openUDPPort;
//: Test if receiving data from OSCGroups:
OSC.verbose;
//: Disable OSC input trace posting:
OSC.silent;
//:Open Project Gui
Project.gui;
//:Enable OscGroups sending + receiving + evaluation:
OscGroups.enable;
//:
OscGroups.isEnabled;
//:
NetAddr.localAddr.sendMsg('/code', "Hello Mr. Ikeda".asCompileString);