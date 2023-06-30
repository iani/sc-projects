postln("Setting up...");
"Enabling OscGroups".postln;
OscGroups.enable;
"OscGroups enabled".postln;
"Configuring and starting local server".postln;
Server.default.options.memSize = (2 ** 15).asInteger;
Server.default.boot;
// here we should set up the sensors and sensor forwarding.
MapXyz('/pinetime/data', '/pine', -1200, 1200);
MapXyz('/minibee/data', '/minibee', 0.45, 0.55);
InputXyz.enable(24);
InputXyz.addMessage('/pine');
InputXyz.addMessage('/minibee');
InputXyz.gui;
