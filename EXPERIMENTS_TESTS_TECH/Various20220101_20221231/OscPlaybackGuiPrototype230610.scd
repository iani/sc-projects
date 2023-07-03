/* 10 Jun 2023 19:48
To be incorporated in OscMonitor.

Create osc data player and play it.
Store the player somewhere, and avoid re-starting it.
If requested to play while it is playing, then stop it and start from the beginning.

*/

p = OscDataReader.makePlayer;
e = p.play;
e.start;
e.isPlaying;
e.stop;
e.isPlaying;
e
nil.isPlaying;

OscDataReader.allData;
OscDataReader.reRead;

OscDataReader.pathsLastRead;

Object.readArchive(OscDataReader.pathsArchivePath ++"abla")
Object.readArchive(OscDataReader.pathsArchivePath);

CmdPeriod addDependant: { "hello".postln; };


File.exists(OscDataReader.pathsArchivePath ++ "abra");

EventStream