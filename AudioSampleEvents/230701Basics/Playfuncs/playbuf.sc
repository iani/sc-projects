/*  1 Jul 2023 22:02
Basic playfunc
*/

{
	PlayBuf.ar(
		~buf.buf.numChannels,
		~buf.buf,
		\rate.br(~rate ? 1),
		\trigger.br(1),
		\startpos.br(~startpos ? 0),
		\loop.br(~loop ? 0),
		Done.freeSelf
	)
}
