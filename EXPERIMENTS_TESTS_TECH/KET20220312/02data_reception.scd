/* 12 Mar 2022 08:52
Testing data reception from sensestage sensors
*/
//:confirm data reception:
OSC.trace;
//:switch off generic tracing
OSC.untrace;
//:
SenseData('status.reply').verbose;
SenseData('status.reply').silent;
//:
SenseData().verbose;
//:
SenseData().post(1);
//:
SenseData().activeIds;
//:
SenseData().enable;
//:
SenseData().disable;
//:
SenseData().silent;
//:
SenseData('minibee/data').verbose;
//:
SenseData('minibee/data').silent;
//:
SenseData('minibee/data').inspect ;
//:
\x1.bus.get;
//:
Library.at(Bus, nil.asTarget.server);
//:
SenseData().verbose;
//:
SenseData().silent;
//:
SenseData().setxyz(1);
//:
SenseData.scope;