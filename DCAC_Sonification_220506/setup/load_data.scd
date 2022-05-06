"loading data".postln;
~data = (Project.selectedProjectPath +/+ "data" +/+ "*.fasta")
.fullPath.pathMatch collect: { | p |
	var data;
	postln("Loading data from: " + p);
	data = CSVFileReader.read(p)[1..];
	postf("Loaded % rows\n", data.size);
	data;
};

postf("\nLoaded % files into variable ~data\n", ~data.size);
