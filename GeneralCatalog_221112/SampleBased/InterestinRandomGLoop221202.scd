/*  2 Dec 2022 20:34

Requires g sample from SuperDirt sample library.
To be loaded through audiofiles in sc-projects.
*/

{
	inf do: {
		\g.playbuf((rate: 0.2 exprand: 2.5));
		0.1.exprand(2.0).wait;
		// maybe try this one also
		// 0.01.exprand(0.2).wait;

	}
}.fork;
//:
