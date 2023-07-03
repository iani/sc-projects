/* 12 Nov 2022 16:38

*/
//:Read some data from file
OscDataReader.openDialog;
// Next time one can reread the data after recompiling:
// OscDataReader.readLastSaved;
//:
OSC.trace;
OscDataReader.makePlayer.play;
//:
OscDataReader.makePlayer.playSelect(['/pinetime/data']);
//:
OscDataReader.makePlayer.playSelect(['/pine']);
//:
OscDataReader.makePlayer.playReject(['/pine']);
//:
OscDataReader.makePlayer.playSelect(['/minibee/data']);
//:
OscDataReader.makePlayer.playSelect(['/minibee']);
//:
OscDataReader.makePlayer.playReject(['/minibee']);
//:
//:
