
//:
(bufnum: [\g, \clap, \cymbal].pseq(1).bufnums, dur: 0.25, instrument: \playbuf1) +> \pongtest;
//:
(bufnum: [\g, \clap, \cymbal].pseq(3).bufnums, dur: 0.25, instrument: \playbuf1) +> \pongtest;
//:
(bufnum: [\g, \clap, \cymbal].pseq(3).bufnums, dur: [0.25, 0.5].prand, instrument: \playbuf1) +> \pongtest;
//:
(bufnum: [\a1, \a30, \a10].pseq(3).bufnums, dur: [0.25, 0.5].prand, instrument: \playbuf1) +> \pongtest;
//:
(bufnum: [\a1, \a30, \a10].pseq(5).bufnums,
dur: [0.25, Pn(0.25/5, 3), 0.5].prand,
instrument: \playbuf1) +> \pongtest;
//:
(bufnum: [\a1, \a30, \a10].prand(25).bufnums,
dur: [0.25, Pn(0.25/5, 3), 0.5].prand,
instrument: \playbuf1) +> \pongtest;
//:
(bufnum:
((1..32) collect: { | x | format("a%", x).asSymbol }).prand(25).bufnums,
dur: [0.25, Pn(0.25/5, 5), 0.1].prand,
instrument: \playbuf1) +> \pongtest;
//:
(1..32) collect: { | x | format("a%", x).asSymbol };
//:
\click +> \test;
//:
(instrument: \click, dur: (60/60), degree: (-10..10).prand) +> \heartland;
//:!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
(instrument: \click,
dur: (60/60) *
[1, [0.5, 0.5].pseq(1), [0.25, 0.25, 0.25, 0.25].pseq(1),
	[1/8].pseq(8)
].prand,
degree: (-10..10).prand) +> \heartland;
