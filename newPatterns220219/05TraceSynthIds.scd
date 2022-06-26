/* 22 Feb 2022 07:42
Test receivingid synths via Notification from
*/

\test.trace;
//:
\test.changed(\blah, 2.rand);
//L When a new synth starts, it notifies its id with the name of the
// environment variable that it started in.
{ SinOsc.ar(400, 0, 0.1) } +> \test;
//: