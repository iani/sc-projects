// { "This is project startup".postln; } ! 10;
// OscGroups.gui;
// Project.gui;
// MediatorGui();

OscGroups.enable;
Project.gui;

Server.default waitForBoot: {
	OscGroups.forward;
	SenseData().setxyz(1, 2, 3, 4, 5, 6, 7, 8);
	OSCData.record('/minibee/data');
	Server.default.record;
}