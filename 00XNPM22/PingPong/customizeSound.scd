/*  2 Dec 2022 18:35
Simple example:
play \sheep sample on ping
play \cymbal sample on pong.

Available buffers are:
---
\arp
\clap
\cymbal
\ding
\g
\jeep
\sheep
\tank

You can add more audiofiles in your project audiofiles folder or in the
global audiofiles folder and they will be loaded when the server boots.

---

See more sound customization examples in customizeSoundExamples.scd

Buffer.all do: _.postln;
*/
//:
\sheep.pIng;
\cymbal.pOng;