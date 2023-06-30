/* 17 Feb 2022 20:08
Test OscGroups functionality
*/
OscGroups.isEnabled; // false
//:
OSC.activeMessagePairs;
//:
Notification.matches('/code', 'code');
//:
OSC.listensTo('code', 'code');
//:
OSC.activeMessages; // []
//:
OscGroups.enable;