/*  1 Jul 2023 22:02
Basic playfunc
*/

{
	var buf, test;
	// TMP debugging messages:
	// postln("debugging playbuf. ~buf is" + ~buf);
	// postln("debugging playbuf. ~buf.buf is" + ~buf.buf);

	buf = ~buf.buf;

	PlayBuf.ar(
		buf.numChannels,
		buf,
		1,
		// \rate.br(~rate ? 1),
		1,
		// \trigger.br(1),
		0,
		// \startpos.br(~startpos ? 0),
		0,
		// \loop.br(~loop ? 0),
		Done.freeSelf
	)
}
