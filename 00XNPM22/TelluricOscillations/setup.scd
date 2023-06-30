/*  7 Dec 2022 11:11
Setup of Telluric Oscillations
*/



~sismos=CSVFileReader.read(Proj.getPath("telluric_data.csv"), true, true);

Proj.garciaDataRoutine;

Server.default.waitForBoot({
	"Loading synthdefs".postln;
	Proj.garciasynthdefs;
});
