/* 18 Sep 2022 12:17
OSC groups connection:

Terminal shell command:

OscGroupClient 172.104.250.242 22242 22246 22244 22245 <username> <password> checkGroup test

*/
//:
(
Project.gui;
{
	Server.default waitForBoot: {
		SenseData().setxyz(1, 2, 3, 4, 5, 6, 7, 8);
		Duel.controlBusMonitor;
		OscGroups.forward; // default: forward /sense/data
		Server.default.record;
		OscGroups.enable;
	}
}.defer(1.0);
)
//: