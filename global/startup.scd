// { "This is project startup".postln; } ! 10;
// OscGroups.gui;
// Project.gui;
// MediatorGui();

// ================================
//: Phoenix Albatross  3 Apr 2022 22:16
// OscGroups.enable;
// Project.gui;

// Server.default waitForBoot: {
// 	OscGroups.forward;
// 	SenseData().setxyz(1, 2, 3, 4, 5, 6, 7, 8);
// 	OSCData.record('/minibee/data');
// 	Server.default.record;
// }