var nucleotids;
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
postln("Collecting nucleotids in a single array");

~data[0] do: { | row, count |
	postln("adding nucleotids of row" + count);
	postln(row);
	row[0] do: { | char| nucleotids = nucleotids add: char.asSymbol };
};
postf("Collected % nucleotids\n", nucleotids.size);
