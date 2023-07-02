/*  1 Jul 2023 22:02
Basic playfunc
*/

{
	var buf;
	// TMP debugging messages:
	postln("debugging playbuf. ~buf is" + ~buf);
	postln("debugging playbuf. ~buf.buf is" + ~buf.buf);

	buf = ~buf.buf;
	PlayBuf.ar(
		buf.numChannels,
		buf,
		\rate.br(~rate ? 1),
		\trigger.br(1),
		\startpos.br(~startpos ? 0),
		\loop.br(~loop ? 0),
		Done.freeSelf
	)
}
