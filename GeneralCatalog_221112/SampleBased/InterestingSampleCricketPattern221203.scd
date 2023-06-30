/*  3 Dec 2022 12:51
Some interesting patterns using playbuf synthdef.
*/
//:
(bufnum: \crickets.bufnums, rate: [0.05, 0.1, 100].pwhite, instrument: \playbuf1) +> \test;
(bufnum: \crickets.bufnums, rate: [0.05, 0.01, 100].pseries, instrument: \playbuf1) +> \test;
//:
(
bufnum: \crickets.bufnums, instrument: \playbuf1,
rate: [0.05, 0.01, 100].pseries
) +> \test;
//:
(bufnum: \crickets.bufnums, dur: 0.1, rate: [0.05, 0.01, 100].pseries, instrument: \playbuf1) +> \test;
//:!!!!!!!!!!!!!1
(
bufnum: \crickets.bufnums, instrument: \playbuf1, loop: 1,
fin: 1.5, fout: 1.5, legato: 1.5,
dur: 3, rate: [0.05, 0.01, 100].pseries,
startPos: (0, \crickets.buf.numFrames / 99 .. \crickets.buf.numFrames).pseq
)+> \test;
//:
(bufnum: \crickets.bufnums, rate: (0.05, 0).pwhite, instrument: \playbuf1) +> \test;
//:
(instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 0.5, rate: [0.5, 1.5].pwhite, fin: 3) +> \test;
//:
(instrument: \playbuf1, legato: 1, bufnum: \crickets.bufnum, dur: 5, rate: [0.5, 1.5].pwhite) +> \test;
//:
(instrument: \playbuf1, legato: 1, bufnum: \crickets.bufnum,
dur: 5, loop: 1,
rate: [0.5, 1.5].pwhite,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1, bufnum: \crickets.bufnum,
dur: 5, loop: 1,  //rate: [0.5, 1.5].pwhite,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1.5, bufnum: \crickets.bufnum,
dur: 5, loop: 1, fin: 1, fout: 1,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1.5, bufnum: \crickets.bufnum,
dur: [0.5, 1.5].pwhite, loop: 1, fin: 1, fout: 1,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1.5, bufnum: \crickets.bufnum,
dur: [0.15, 0.5].pwhite, loop: 1, fin: 1, fout: 1,
rate: [0.5, 1.5].pwhite,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1.5, bufnum: \crickets.bufnum,
dur: [0.15, 0.5].pwhite, loop: 1, fin: 1, fout: 1,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1.2, bufnum: \crickets.bufnum,
dur: [0.5, 1.5].pwhite, loop: 1,  //rate: [0.5, 1.5].pwhite,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:
(instrument: \playbuf1, legato: 1.2, bufnum: \crickets.bufnum,
dur: 0.5, loop: 1,  //rate: [0.5, 1.5].pwhite,
startPos: [0, \crickets.buf.numFrames].pwhite
) +> \test;
//:!!!!!!!!!!!!!!!!
(
instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 4.5,
fin: 3,
fout: 5,
rate: [0.5, 1.5].pwhite,
legato: 1
) +> \test;
//:
(
instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 1.5,
fin: 0.3,
fout: 5,
rate: [0.5, 1.5].pwhite,
legato: 1
) +> \test;
//:
(
instrument: \playbuf1, bufnum: \crickets.bufnum, dur: 1.5,
fin: ((1..15)/10).pseq,
fout: ((1..30) / 10).pseq,
rate: [0.15, 1.5].pwhite,
legato: 0.5
) +> \test;
//:
a = Synth(\playbuf1, [bufnum: \crickets.bufnum, fin: 10, fout: 10]);
//:
a.release;
//:
a = Synth(\playbuf1, [bufnum: \crickets.bufnum]);
//:
a.release;
//:
a = Synth(\playbuf1, [bufnum: \crickets.bufnum, fin: 10, fout: 0.01]);
//:
a.release;
//:
(bufnum: \crickets.bufnums, instrument: \playbuf1, legato: 1.5, loop: 1,
dur: [0.1, 1.0].pwhite, startPos: [0, \crickets.buf.numFrames].pwhite) +> \test;
//:
(bufnum: \crickets.bufnums, instrument: \playbuf1, legato: 1.5, loop: 1,
rate: [0.1, 5.0].pwhite,
dur: [0.1, 1.0].pwhite, startPos: [0, \crickets.buf.numFrames].pwhite) +> \test;
//:!!!!!
(bufnum: \crickets.bufnums, instrument: \playbuf1, legato: 1.5, loop: 1,
rate: [3.0, 5.0].pwhite,
dur: [0.1, 5.0].pwhite, startPos: [0, \crickets.buf.numFrames].pwhite) +> \test;
//:
\crickets.buf.numFrames;
//:
(buf: [\g, \crickets, \arp].pseq, rate: 0.8, dur: 0.3, loop: 1).playbuf +> \test;
