/*  9 Nov 2022 21:05

*/
//:
OscGroups.enable;
"enabled osc groups".postln;
// OscGroups.forward; // default: forward /sense/data
//:normalize and forward pinetime data to pine
MapXyz('/pinetime/data', '/pine', -1200, 1200);
//:normalize and forward sensestage data to minibee
MapXyz('/minibee/data', '/minibee', 0.44, 0.56);
//:Monitor received pine data. Enable input from 12 sensors
InputXyz enable: 12;
//:add message maybe needs to run AFTER!!!!
InputXyz.addMessage('/pine');
InputXyz.addMessage('/minibee');
InputXyz.gui;
