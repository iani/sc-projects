/*  2 Dec 2022 20:34
Variant of previous example, with looping enabled.

Requires g sample from SuperDirt sample library.
To be loaded through audiofiles in sc-projects.
*/
//:
{
	{
		inf do: {
			\g.playbuf((rate: 0.2 exprand: 2.5, loop: 1));
			0.1.exprand(1.2).wait;
		};
	}.fork;
	{
		inf do: {
			\g.playbuf((rate: 0.2 exprand: 2.5, loop: 1), \g2);
			0.1.exprand(1.2).wait;
		};
	}.fork;
}.fork;
//