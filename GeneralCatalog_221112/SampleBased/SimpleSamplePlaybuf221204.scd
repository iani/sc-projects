/*  4 Dec 2022 16:16
Simple sample playbuf example with Event
*/
(buf: [\g, \crickets, \arp].pseq, rate: [0.28, 3.2].pwhite, dur: [0.28, 3.2].pwhite, loop: 1).playbuf +> \test;
//:
\crickets.playbuf;
//:
\default +> \test;
\g.buf.play;



"hello"

().play;

"Hello Hide, I stopped you"
"Hello, this is Iani"
"We are rehearsing now"
//:Your startup file put this:
OscGroups.enable;
Project.gui;
Server.default.boot;
//
//
//:
(buf: [\soto_kick].pseq,
rate: [0.28, 3.2].pwhite, dur: [0.28, 3.2].pwhite,
loop: 1).playbuf +> \test;


(buf: [\soto_kick].pseq, dur: [0.1, 0.2].prand).playbuf +> \test;