//:normalize and forward sensestage data to minibee
MapXyz('/minibee/data', '/minibee', 0.44, 0.56);
//:Monitor received pine data. Enable input from 12 sensors
InputXyz enable: 12;
InputXyz.addMessage('/minibee');
InputXyz.gui;

//:
//